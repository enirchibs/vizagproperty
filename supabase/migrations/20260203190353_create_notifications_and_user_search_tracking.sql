/*
  # Create Notifications System for Property Alerts

  1. New Tables
    - `user_last_search`
      - Stores each user's last search criteria
      - Used to match new properties with interested users
      - Includes locality_id, radius_km, property_type, listing_type
      - One row per user (upserted on each search)
    
    - `notifications`
      - Stores in-app notifications for users
      - Links users to new properties that match their search
      - Tracks read/unread status
      - Includes created timestamp for sorting and filtering
  
  2. Security (RLS)
    - Enable RLS on both tables
    - Users can only see their own search history
    - Users can only see their own notifications
    - Users can mark their own notifications as read
    - System can insert notifications for all users
  
  3. Important Notes
    - Notifications are created automatically via trigger (next migration)
    - Max 3 notifications per user per day enforced at query level
    - Auto-cleanup of old notifications after 30 days
*/

-- Create user_last_search table
CREATE TABLE IF NOT EXISTS user_last_search (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  locality_id uuid REFERENCES localities(id) NOT NULL,
  locality_name text NOT NULL,
  radius_km integer DEFAULT 3 CHECK (radius_km IN (1, 3, 5)),
  property_type text NOT NULL,
  listing_type text NOT NULL CHECK (listing_type IN ('sale', 'rent', 'lease')),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(user_id)
);

-- Create notifications table
CREATE TABLE IF NOT EXISTS notifications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE NOT NULL,
  type text DEFAULT 'new_property' CHECK (type IN ('new_property')),
  is_read boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

-- Add indexes for performance
CREATE INDEX IF NOT EXISTS idx_user_last_search_user_id ON user_last_search(user_id);
CREATE INDEX IF NOT EXISTS idx_notifications_user_id ON notifications(user_id);
CREATE INDEX IF NOT EXISTS idx_notifications_created_at ON notifications(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_notifications_is_read ON notifications(is_read) WHERE is_read = false;

-- Enable RLS
ALTER TABLE user_last_search ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

-- RLS Policies for user_last_search
CREATE POLICY "Users can view own search history"
  ON user_last_search FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own search history"
  ON user_last_search FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own search history"
  ON user_last_search FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- RLS Policies for notifications
CREATE POLICY "Users can view own notifications"
  ON notifications FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can update own notifications"
  ON notifications FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Function to cleanup old notifications (30+ days)
CREATE OR REPLACE FUNCTION cleanup_old_notifications()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  DELETE FROM notifications
  WHERE created_at < now() - interval '30 days';
END;
$$;
