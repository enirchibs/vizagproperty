/*
  # Ensure RLS is Enabled on Core Tables

  1. Security Enhancement
    - Enable Row Level Security on users table
    - Enable Row Level Security on properties table  
    - Enable Row Level Security on property_details table

  2. Current Status
    All three tables already have RLS enabled with comprehensive policies:
    
    **Users Table:**
    - Authenticated users can insert/read/update their own records
    - Admin can read/update all users
    
    **Properties Table:**
    - Public can read approved properties
    - Authenticated owners can manage their own properties
    - Admin can manage all properties
    
    **Property Details Table:**
    - Public can read details of approved properties
    - Authenticated owners can manage details of their properties
    - Admin can manage all property details

  3. Notes
    - This migration is idempotent
    - Existing policies remain unchanged
    - RLS provides critical data security layer
*/

-- Enable RLS on users table
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Enable RLS on properties table
ALTER TABLE properties ENABLE ROW LEVEL SECURITY;

-- Enable RLS on property_details table
ALTER TABLE property_details ENABLE ROW LEVEL SECURITY;
