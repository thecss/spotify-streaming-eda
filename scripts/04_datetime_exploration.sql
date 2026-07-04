/*
=============================================================
Date & Time Exploration
=============================================================
Script Purpose:
    - To determine the date range of the streaming history.
*/

-- Displays the earliest and latest playback timestamps along with the duration.
SELECT 
  MIN(ts) AS first_streamed,
  MAX(ts) AS last_streamed,
  DATEDIFF(MAX(ts), MIN(ts)) AS stream_range_days,
  TIMESTAMPDIFF(YEAR, MIN(ts), MAX(ts)) AS stream_range_years
FROM spotify_history;


