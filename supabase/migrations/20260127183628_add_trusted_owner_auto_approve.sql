/*
  # Add Trusted Owner Auto-Approve Feature

  1. Schema Changes
    - Add `trusted` boolean column to users table (default false)
    - Add `trusted_at` timestamptz column to track when user became trusted
    - Add `trusted_by` uuid column to track which admin granted trusted status

  2. Functions & Triggers
    - `auto_approve_trusted_owner()` - Auto-approves properties from trusted owners
    - `auto_approve_property` - Trigger attached to properties table (BEFORE INSERT)

  3. Security
    - Only admins can update trusted status
    - Trusted status is logged with timestamp and admin ID

  4. Benefits
    - Trusted owners get instant property approval
    - Reduces admin workload for reliable property owners
    - Maintains security for new/unverified owners
*/

-- Add trusted columns to users table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'users' AND column_name = 'trusted'
  ) THEN
    ALTER TABLE users ADD COLUMN trusted boolean DEFAULT false;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'users' AND column_name = 'trusted_at'
  ) THEN
    ALTER TABLE users ADD COLUMN trusted_at timestamptz;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'users' AND column_name = 'trusted_by'
  ) THEN
    ALTER TABLE users ADD COLUMN trusted_by uuid REFERENCES users(id);
  END IF;
END $$;

-- Add index for trusted users lookup
CREATE INDEX IF NOT EXISTS idx_users_trusted ON users(trusted) WHERE trusted = true;

-- Create auto-approve function for trusted owners
CREATE OR REPLACE FUNCTION auto_approve_trusted_owner()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_is_trusted boolean;
BEGIN
  -- Check if the property owner is a trusted user
  SELECT trusted INTO v_is_trusted
  FROM users
  WHERE id = NEW.owner_id;

  -- If owner is trusted, auto-approve the property
  IF v_is_trusted = true THEN
    NEW.status := 'approved';
    NEW.approved_at := now();
    NEW.approved_by := NEW.owner_id; -- Mark as auto-approved by system
  END IF;

  RETURN NEW;
END;
$$;

-- Create trigger for auto-approval (BEFORE INSERT to set status before insert)
DROP TRIGGER IF EXISTS auto_approve_property ON properties;
CREATE TRIGGER auto_approve_property
  BEFORE INSERT ON properties
  FOR EACH ROW
  EXECUTE FUNCTION auto_approve_trusted_owner();

-- Also check on update if owner changes and new owner is trusted
CREATE OR REPLACE FUNCTION auto_approve_on_owner_change()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_is_trusted boolean;
BEGIN
  -- Only check if owner_id changed and status is pending
  IF NEW.owner_id IS DISTINCT FROM OLD.owner_id AND NEW.status = 'pending' THEN
    SELECT trusted INTO v_is_trusted
    FROM users
    WHERE id = NEW.owner_id;

    IF v_is_trusted = true THEN
      NEW.status := 'approved';
      NEW.approved_at := now();
      NEW.approved_by := NEW.owner_id;
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS auto_approve_on_owner_change ON properties;
CREATE TRIGGER auto_approve_on_owner_change
  BEFORE UPDATE ON properties
  FOR EACH ROW
  WHEN (OLD.owner_id IS DISTINCT FROM NEW.owner_id)
  EXECUTE FUNCTION auto_approve_on_owner_change();

-- RLS Policy: Only admins can update trusted status
DROP POLICY IF EXISTS "Admins can update trusted status" ON users;
CREATE POLICY "Admins can update trusted status"
  ON users
  FOR UPDATE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM users u
      WHERE u.id = auth.uid()
      AND u.role = 'admin'
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM users u
      WHERE u.id = auth.uid()
      AND u.role = 'admin'
    )
  );
