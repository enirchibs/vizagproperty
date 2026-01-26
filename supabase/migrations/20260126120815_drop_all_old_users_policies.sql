/*
  # Drop All Remaining Old Users Policies
  
  ## Problem
  - Previous migration didn't catch all old policies
  - "admin read all users" policy still has recursive query causing infinite recursion
  - Other redundant policies still exist
  
  ## Solution
  - Drop every single policy on users table
  - Keep only the safe users_select and users_update policies
*/

-- Drop all old policies that are causing recursion or are redundant
drop policy if exists "admin read all users" on public.users;
drop policy if exists "admin update all users" on public.users;
drop policy if exists "users read own" on public.users;
drop policy if exists "users update self" on public.users;
drop policy if exists "users insert self" on public.users;

-- Verify the safe policies exist (recreate if they were somehow dropped)
drop policy if exists "users_select" on public.users;
drop policy if exists "users_update" on public.users;

-- Recreate the ONLY two policies we need (safe, non-recursive)

create policy "users_select"
on public.users
for select
using (
  auth.uid() = id
  or auth.jwt() ->> 'email' in ('pratapjamp@gmail.com', 'himaaitools@gmail.com')
);

create policy "users_update"
on public.users
for update
using (
  auth.uid() = id
  or auth.jwt() ->> 'email' in ('pratapjamp@gmail.com', 'himaaitools@gmail.com')
);
