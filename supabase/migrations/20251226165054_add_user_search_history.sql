/*
  # Add User Search History Tracking

  1. New Tables
    - `user_search_history`
      - `id` (uuid, primary key)
      - `user_id` (uuid, references auth.users)
      - `location` (text) - City/area searched
      - `locality` (text) - Specific locality searched
      - `search_type` (text) - buy, rent, or commercial
      - `search_query` (text) - Full search query if any
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)
  
  2. Security
    - Enable RLS on `user_search_history` table
    - Add policy for users to read their own search history
    - Add policy for users to insert their own search history
    - Add policy for users to update their own search history
  
  3. Indexes
    - Add index on user_id for fast lookups
    - Add index on created_at for sorting by recency
*/

CREATE TABLE IF NOT EXISTS user_search_history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  location text DEFAULT '',
  locality text DEFAULT '',
  search_type text DEFAULT 'buy',
  search_query text DEFAULT '',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE user_search_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own search history"
  ON user_search_history
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own search history"
  ON user_search_history
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own search history"
  ON user_search_history
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE INDEX IF NOT EXISTS idx_user_search_history_user_id ON user_search_history(user_id);
CREATE INDEX IF NOT EXISTS idx_user_search_history_created_at ON user_search_history(created_at DESC);