/*
  # Auto-Create Notifications for Property Approvals

  1. New Function
    - `notify_users_of_new_property()`
      - Triggers when property status changes to 'approved'
      - Finds all users with matching search criteria
      - Creates notification for each matching user
      - Matches on: property_type, listing_type, and locality within radius
  
  2. Trigger
    - Executes AFTER UPDATE on properties table
    - Only fires when status changes from non-approved to 'approved'
    - Prevents duplicate notifications
  
  3. Matching Logic
    - Uses get_nearby_localities_cached for radius matching
    - Enforces strict property_type and listing_type matching
    - Only notifies users who have saved a last search
    - Limits to max 3 notifications per user per day
  
  4. Important Notes
    - Function runs as SECURITY DEFINER (elevated privileges)
    - No notifications for draft or rejected properties
    - Notifications are created in batch for efficiency
*/

-- Function to create notifications for users with matching searches
CREATE OR REPLACE FUNCTION notify_users_of_new_property()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  user_search RECORD;
  nearby_locality_ids uuid[];
  notification_count integer;
BEGIN
  -- Only proceed if status changed to 'approved'
  IF NEW.status = 'approved' AND (OLD.status IS DISTINCT FROM 'approved') THEN
    
    -- For each user with a saved search matching property type and listing type
    FOR user_search IN 
      SELECT 
        uls.user_id,
        uls.locality_id,
        uls.radius_km,
        uls.property_type,
        uls.listing_type
      FROM user_last_search uls
      WHERE uls.property_type = NEW.property_type
        AND uls.listing_type = NEW.listing_type
    LOOP
      -- Get nearby localities for this user's search
      SELECT ARRAY_AGG(locality_id)
      INTO nearby_locality_ids
      FROM get_nearby_localities_cached(
        user_search.locality_id,
        user_search.radius_km,
        COALESCE(NEW.city, 'Visakhapatnam')
      );
      
      -- Check if property is within user's radius
      IF NEW.locality_id = ANY(nearby_locality_ids) THEN
        
        -- Check notification limit (max 3 per day per user)
        SELECT COUNT(*)
        INTO notification_count
        FROM notifications
        WHERE user_id = user_search.user_id
          AND created_at > now() - interval '24 hours';
        
        -- Only create notification if under daily limit
        IF notification_count < 3 THEN
          INSERT INTO notifications (user_id, property_id, type, is_read)
          VALUES (user_search.user_id, NEW.id, 'new_property', false)
          ON CONFLICT DO NOTHING;
        END IF;
      END IF;
    END LOOP;
  END IF;
  
  RETURN NEW;
END;
$$;

-- Create trigger
DROP TRIGGER IF EXISTS trigger_notify_users_of_new_property ON properties;

CREATE TRIGGER trigger_notify_users_of_new_property
  AFTER UPDATE ON properties
  FOR EACH ROW
  EXECUTE FUNCTION notify_users_of_new_property();
