/*
  # Remove Radius Feature from Search System

  1. Schema Changes
    - Remove `radius_km` column from `user_last_search` table
    - Searches now match only exact locality_id (no nearby expansion)
  
  2. Notification Trigger Update
    - Remove radius-based locality matching
    - Direct locality_id match only
    - No more calls to get_nearby_localities_cached
  
  3. Important Notes
    - Faster queries with exact match
    - Simpler user experience
    - Cleaner codebase without radius complexity
*/

-- Remove radius_km column from user_last_search
ALTER TABLE user_last_search DROP COLUMN IF EXISTS radius_km;

-- Update notification trigger to match only exact locality_id
CREATE OR REPLACE FUNCTION notify_users_of_new_property()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  user_search RECORD;
  notification_count integer;
BEGIN
  -- Only proceed if status changed to 'approved'
  IF NEW.status = 'approved' AND (OLD.status IS DISTINCT FROM 'approved') THEN
    
    -- For each user with a saved search matching property type, listing type, and exact locality
    FOR user_search IN 
      SELECT 
        uls.user_id,
        uls.locality_id,
        uls.property_type,
        uls.listing_type
      FROM user_last_search uls
      WHERE uls.property_type = NEW.property_type
        AND uls.listing_type = NEW.listing_type
        AND uls.locality_id = NEW.locality_id
    LOOP
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
    END LOOP;
  END IF;
  
  RETURN NEW;
END;
$$;
