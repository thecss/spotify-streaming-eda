/*
=============================================================
Magnitude Analysis
=============================================================
Purpose:
    - To measure streaming activity across different dimensions.
    - To identify the artists, albums, tracks, and platforms
      with the highest number of streams.

SQL Functions Used:
    - COUNT()
    - GROUP BY
    - ORDER BY
*/


-- Displays the total number of streams for each artist.
SELECT
    artist_name,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY artist_name
ORDER BY total_streams DESC;


-- Displays the total number of streams for each album.
SELECT
    album_name,
    artist_name,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY
    album_name,
    artist_name
ORDER BY total_streams DESC;


-- Displays the total number of streams for each track.
SELECT
    spotify_track_uri,
    track_name,
    album_name,
    artist_name,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY
    spotify_track_uri,
    track_name,
    album_name,
    artist_name
ORDER BY total_streams DESC;


-- Displays the total number of streams on each platform.
SELECT
    platform,
    COUNT(*) AS total_streams
FROM spotify_history
GROUP BY platform
ORDER BY total_streams DESC;


-- Displays the tracks with the highest number of skipped streams.
SELECT
    spotify_track_uri,
    track_name,
    artist_name,
    COUNT(*) AS total_skips
FROM spotify_history
WHERE skipped = 'True'
GROUP BY
    spotify_track_uri,
    track_name,
    artist_name
ORDER BY total_skips DESC;


-- Displays the artists with the highest number of skipped streams.
SELECT
    artist_name,
    COUNT(*) AS total_skips
FROM spotify_history
WHERE skipped = 'True'
GROUP BY artist_name
ORDER BY total_skips DESC;
