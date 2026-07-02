/*
=============================================================
Dataset Exploration
=============================================================
Script Purpose:
    This script explores the Spotify Streaming History dataset
    to understand its size, structure, and available data.

The script answers the following questions:
    1. How many playback events are in the dataset?
    2. What is the structure of the table?
    3. What columns are available for analysis?
*/

-- Total Number of Playback Events
SELECT COUNT(*)  AS total_playback_events
FROM spotify_history;

-- View Table Structure
DESC spotify_history;

-- Preview the Dataset
SELECT * 
FROM spotify_history
LIMIT 5;
