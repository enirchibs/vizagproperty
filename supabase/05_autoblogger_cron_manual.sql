-- NOTE: Replace <YOUR_PROJECT_REFERENCE_ID> with your actual 20-character Supabase project ID
-- Ensure that the pg_cron and pg_net extensions are enabled in your database before running this.

select cron.schedule(
  'vizag-news-auto-blogger', 
  '0 8,16 * * *',       
  $$
    select net.http_post(
      url := 'https://<YOUR_PROJECT_REFERENCE_ID>.supabase.co/functions/v1/auto-blogger',
      headers := jsonb_build_object(
        'Content-Type', 'application/json'
      )
    )
  $$
);
