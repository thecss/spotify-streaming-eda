/*
=============================================================
Measures Exploration (Key Metrics)
=============================================================
Purpose:
    - To calculate summary statistics for playback duration.
    - To understand overall listening activity using key metrics.
*/

-- Displays the total number of playback events.
SELECT
    COUNT(*) AS total_streams
FROM spotify_history;

-- Displays the total listening time in hours.
SELECT ROUND(SUM(ms_played)/(1000*60*60),2) AS total_hours_played
FROM spotify_history;

-- Displays the average, minimum, and maximum playback duration.
SELECT
    ROUND(AVG(ms_played) / 1000, 2) AS avg_playback_seconds,
    ROUND(MIN(ms_played) / 1000, 2) AS min_playback_seconds,
    ROUND(MAX(ms_played) / 1000, 2) AS max_playback_seconds
FROM spotify_history;

-- Displays the number of skipped playback events.
SELECT
    COUNT(*) AS total_skipped_tracks
FROM spotify_history
WHERE skipped = 'TRUE';

-- Displays the percentage of playback events that were skipped.
SELECT
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM spotify_history),
        2
    ) AS skip_rate_percent
FROM spotify_history
WHERE skipped = 'TRUE';

-- Displays the number of unique tracks that were played more than once.
SELECT
    COUNT(*) AS repeated_tracks
FROM (
    SELECT
        spotify_track_uri
    FROM spotify_history
    GROUP BY spotify_track_uri
    HAVING COUNT(*) > 1
) AS repeated_tracks;
