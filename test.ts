import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://fqjzjngseryyzfsmiulb.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZxanpqbmdzZXJ5eXpmc21pdWxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNzA3NDQsImV4cCI6MjA0OTk0Njc0NH0.8zZ1o50w-j-526yV8XQvXpX_Kk9G0r7E3PjPj3R_H6c'
const supabase = createClient(supabaseUrl, supabaseKey)

async function run() {
  const { count, error } = await supabase.from('properties').select('*', { count: 'exact', head: true })
  console.log('Total properties:', count)
}
run()
