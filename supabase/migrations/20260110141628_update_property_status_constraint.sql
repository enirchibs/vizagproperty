/*
  # Update Property Status Constraint for Moderation

  ## Overview
  Updates the properties table status constraint to support a full moderation workflow.

  ## Changes

  1. Status Values
    - `pending` - New properties awaiting admin review (default for user submissions)
    - `active` - Approved properties visible to all users
    - `rejected` - Properties rejected by admin

  ## Migration Steps
    1. Drop existing status constraint
    2. Add new constraint with three moderation states

  ## Security Notes
  - Only admins can change property status (enforced by RLS policies)
  - Default status for new properties is 'pending'
  - Owners cannot change their own property status
*/

-- Drop existing constraint
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS properties_status_check;

-- Recreate constraint with moderation states
ALTER TABLE properties
ADD CONSTRAINT properties_status_check
CHECK (status IN ('pending', 'active', 'rejected'));
