/*
  # Fix Infinite Recursion in Users Table RLS Policies

  ## Problem
  - Existing policies on `users` table were causing infinite recursion
  - Policies were likely querying the `users` table itself to check admin status
  - This creates a circular dependency when Postgres tries to evaluate the policy

  ## Solution
  1. Drop all existing policies on the `users` table
  2. Create new policies that use ONLY `auth.uid()` and `auth.jwt()`
  3. Hardcode admin emails in the policy (from JWT) instead of querying the table
  4. No INSERT policy needed (trigger handles inserts)

  ## New Policies
  - `users_select`: Users can read their own profile, admins can read all
  - `users_update`: Users can update their own profile, admins can update all

  ## Security
  - RLS remains enabled and restrictive
  - No recursive queries = no performance issues
  - Admin access controlled via JWT email check
  - Regular users can only access their own data
*/

-- STEP 1: Drop all existing policies on users table
drop policy if exists "Users can view own profile" on public.users;
drop policy if exists "Users can update own profile" on public.users;
drop policy if exists "Admin can view users" on public.users;
drop policy if exists "Admin can update users" on public.users;
drop policy if exists "users_select" on public.users;
drop policy if exists "users_update" on public.users;
drop policy if exists "users_insert" on public.users;
drop policy if exists "users_delete" on public.users;

-- STEP 2: Create safe, non-recursive policies

-- SELECT: User can read self, admin can read all
create policy "users_select"
on public.users
for select
using (
  auth.uid() = id
  or auth.jwt() ->> 'email' in ('pratapjamp@gmail.com', 'himaaitools@gmail.com')
);

-- UPDATE: User can update self, admin can update all
create policy "users_update"
on public.users
for update
using (
  auth.uid() = id
  or auth.jwt() ->> 'email' in ('pratapjamp@gmail.com', 'himaaitools@gmail.com')
);

-- NO INSERT POLICY: Trigger handles inserts automatically
-- NO DELETE POLICY: Users should not be deleted (data integrity)
