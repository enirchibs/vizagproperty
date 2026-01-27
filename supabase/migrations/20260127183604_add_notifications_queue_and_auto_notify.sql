/*
  # Add Notifications Queue and Auto-Notify System

  1. New Tables
    - `notifications_queue`
      - `id` (uuid, primary key)
      - `user_id` (uuid, references users)
      - `property_id` (uuid, references properties)
      - `message` (text)
      - `channel` (text) - whatsapp, email, sms
      - `sent` (boolean) - default false
      - `created_at` (timestamptz)
      - `sent_at` (timestamptz)

  2. Functions & Triggers
    - `notify_owner_on_status_change()` - Queues notification when property status changes
    - `property_status_notify` - Trigger attached to properties table

  3. Security
    - Enable RLS on notifications_queue
    - Users can only read their own notifications
    - System can insert notifications (for trigger)
    - Admins can view all notifications
*/

-- Create notifications queue table
CREATE TABLE IF NOT EXISTS notifications_queue (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE,
  message text NOT NULL,
  channel text NOT NULL DEFAULT 'whatsapp' CHECK (channel IN ('whatsapp', 'email', 'sms')),
  sent boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  sent_at timestamptz
);

-- Add indexes for performance
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications_queue(user_id);
CREATE INDEX IF NOT EXISTS idx_notifications_property ON notifications_queue(property_id);
CREATE INDEX IF NOT EXISTS idx_notifications_sent ON notifications_queue(sent) WHERE sent = false;

-- Enable RLS
ALTER TABLE notifications_queue ENABLE ROW LEVEL SECURITY;

-- RLS Policies
CREATE POLICY "Users can view own notifications"
  ON notifications_queue
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all notifications"
  ON notifications_queue
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE users.id = auth.uid()
      AND users.role = 'admin'
    )
  );

CREATE POLICY "System can insert notifications"
  ON notifications_queue
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Create notification trigger function
CREATE OR REPLACE FUNCTION notify_owner_on_status_change()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_message text;
BEGIN
  -- Only notify if status actually changed
  IF NEW.status IS DISTINCT FROM OLD.status THEN
    -- Create appropriate message based on status
    CASE NEW.status
      WHEN 'approved' THEN
        v_message := 'Great news! Your property listing has been approved and is now live on our platform.';
      WHEN 'rejected' THEN
        v_message := 'Your property listing was not approved. Reason: ' || COALESCE(NEW.rejection_reason, 'Please contact support for details.');
      WHEN 'pending' THEN
        v_message := 'Your property listing is under review. We''ll notify you once it''s approved.';
      ELSE
        v_message := 'Your property status changed to ' || NEW.status;
    END CASE;

    -- Insert notification for both WhatsApp and Email
    INSERT INTO notifications_queue (user_id, property_id, message, channel)
    VALUES 
      (NEW.owner_id, NEW.id, v_message, 'whatsapp'),
      (NEW.owner_id, NEW.id, v_message, 'email');
  END IF;

  RETURN NEW;
END;
$$;

-- Create trigger
DROP TRIGGER IF EXISTS property_status_notify ON properties;
CREATE TRIGGER property_status_notify
  AFTER UPDATE ON properties
  FOR EACH ROW
  WHEN (OLD.status IS DISTINCT FROM NEW.status)
  EXECUTE FUNCTION notify_owner_on_status_change();
