/*
=============================================================
Dimensions Exploration
=============================================================
Script Purpose:
    This script explores the categorical dimensions in the
    Spotify streaming history dataset to understand the
    unique entities and playback categories available for
    analysis.

Questions Answered:
    1. How many unique artists are in the dataset?
    2. How many unique tracks are in the dataset?
    3. How many unique albums are in the dataset?
    4. What unique Artist → Track → Album combinations exist?
    5. Which platforms were used?
    6. What playback start reasons exist?
    7. What playback end reasons exist?

Notes:
    - 'spotify_track_uri' is used to identify unique tracks,
      as multiple tracks can share the same track name.
*/


-- Count Unique Artists
SELECT COUNT(DISTINCT artist_name) AS total_artists
FROM spotify_history;


-- Count Unique Tracks
SELECT COUNT(DISTINCT spotify_track_uri) AS total_tracks
FROM spotify_history;


-- Count Unique Albums
SELECT COUNT(DISTINCT album_name) AS total_albums
FROM spotify_history;


-- Displays unique Artist, Track, and Album combinations.
SELECT DISTINCT
    artist_name,
    track_name,
    album_name
FROM spotify_history
ORDER BY
    artist_name,
    track_name,
    album_name;


-- Explore Platforms Used
SELECT DISTINCT
    platform
FROM spotify_history
ORDER BY
    platform;


-- Explore Playback Start Reasons
SELECT DISTINCT
    reason_start
FROM spotify_history
ORDER BY
    reason_start;


-- Explore Playback End Reasons
SELECT DISTINCT
    reason_end
FROM spotify_history
ORDER BY
    reason_end;
