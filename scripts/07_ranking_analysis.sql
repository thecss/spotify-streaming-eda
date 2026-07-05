/*
=============================================================
Ranking Analysis
=============================================================
Purpose:
    - To identify the highest and lowest ranked entities based
      on streaming activity.
    - To highlight the most and least frequently streamed
      artists and tracks.
    - To identify the most frequently skipped artists and tracks.

SQL Functions Used:
    - COUNT()
    - GROUP BY
    - ORDER BY
    - LIMIT
=============================================================
*/


-- Top 3 Most Streamed Artists
-- Displays the artists with the highest number of streams.
SELECT
    artist_name,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY artist_name
ORDER BY total_streams DESC
LIMIT 3;


-- Top 3 Most Streamed Tracks
-- Displays the tracks with the highest number of streams.
SELECT
    spotify_track_uri,
    track_name,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY
    spotify_track_uri,
    track_name
ORDER BY total_streams DESC
LIMIT 3;


-- Bottom 3 Least Streamed Artists
-- Displays the artists with the lowest number of streams.
SELECT
    artist_name,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY artist_name
ORDER BY total_streams
LIMIT 3;


-- Bottom 3 Least Streamed Tracks
-- Displays the tracks with the lowest number of streams.
SELECT
    spotify_track_uri,
    track_name,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY
    spotify_track_uri,
    track_name
ORDER BY total_streams
LIMIT 3;


-- Top 3 Most Skipped Artists
-- Displays the artists with the highest number of skipped playback events.
SELECT
    artist_name,
    COUNT(*) AS total_skips
FROM spotify_history
WHERE skipped = 'True'
GROUP BY artist_name
ORDER BY total_skips DESC
LIMIT 3;


-- Top 3 Most Skipped Tracks
-- Displays the tracks with the highest number of skipped playback events.
SELECT
    spotify_track_uri,
    track_name,
    COUNT(*) AS total_skips
FROM spotify_history
WHERE skipped = 'True'
GROUP BY
    spotify_track_uri,
    track_name
ORDER BY total_skips DESC
LIMIT 3;


-- Top 3 Most Used Platforms
-- Displays the platforms with the highest number of streams.
SELECT
    platform,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY platform
ORDER BY total_streams DESC
LIMIT 3;
