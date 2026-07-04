/*
=============================================================
Data Quality Checks
=============================================================
Script Purpose:
    This script performs basic data quality checks on the
    Spotify streaming history dataset before analysis.

Checks Performed:
    1. Check for missing and blank values.
    2. Check for exact duplicate records.
    3. Display duplicate records for inspection.
    4. Check for invalid playback duration values.

Notes:
    - Exact duplicate records are identified by comparing all
      columns in each playback event.
    - A negative playback duration is considered invalid.
*/


-- Check for Missing and Blank Values
SELECT
    SUM(CASE WHEN spotify_track_uri IS NULL OR TRIM(spotify_track_uri) = '' THEN 1 ELSE 0 END) AS missing_track_uri,
    SUM(CASE WHEN ts IS NULL THEN 1 ELSE 0 END) AS missing_timestamp,
    SUM(CASE WHEN track_name IS NULL OR TRIM(track_name) = '' THEN 1 ELSE 0 END) AS missing_track_name,
    SUM(CASE WHEN artist_name IS NULL OR TRIM(artist_name) = '' THEN 1 ELSE 0 END) AS missing_artist,
    SUM(CASE WHEN album_name IS NULL OR TRIM(album_name) = '' THEN 1 ELSE 0 END) AS missing_album,
    SUM(CASE WHEN platform IS NULL OR TRIM(platform) = '' THEN 1 ELSE 0 END) AS missing_platform,
    SUM(CASE WHEN reason_start IS NULL OR TRIM(reason_start) = '' THEN 1 ELSE 0 END) AS missing_reason_start,
    SUM(CASE WHEN reason_end IS NULL OR TRIM(reason_end) = '' THEN 1 ELSE 0 END) AS missing_reason_end,
    SUM(CASE WHEN skipped IS NULL THEN 1 ELSE 0 END) AS missing_skipped
FROM spotify_history;


-- Check for Exact Duplicate Records
SELECT
    total_records,
    total_distinct,
    total_records - total_distinct AS duplicate_records
FROM (
    SELECT
        (SELECT COUNT(*) FROM spotify_history) AS total_records,
        (SELECT COUNT(*)
         FROM (
             SELECT DISTINCT *
             FROM spotify_history
         ) AS distinct_records
        ) AS total_distinct
) AS record_summary;


-- Display Duplicate Records
SELECT
    spotify_track_uri,
    ts,
    platform,
    ms_played,
    track_name,
    artist_name,
    album_name,
    reason_start,
    reason_end,
    shuffle,
    skipped,
    COUNT(*) AS duplicate_count
FROM spotify_history
GROUP BY
    spotify_track_uri,
    ts,
    platform,
    ms_played,
    track_name,
    artist_name,
    album_name,
    reason_start,
    reason_end,
    shuffle,
    skipped
HAVING COUNT(*) > 1;


-- Check for Invalid Playback Duration
SELECT *
FROM spotify_history
WHERE ms_played < 0;
