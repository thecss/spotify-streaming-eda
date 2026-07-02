/*
=============================================================
Create Database, Table, and Load Data
=============================================================
Script Purpose:
    This script initializes the database environment for the Spotify Streaming History SQL EDA project.

    The script performs the following tasks:
        1. Creates the project database if it does not already exist.
        2. Sets the database as the active schema.
        3. Creates the Spotify streaming history table to store playback event data.
        4. Loads the Spotify streaming history dataset into the table.

WARNING:
    Running this script will drop the existing database (if it exists) and recreate it from scratch. 
    All data stored in the database will be permanently deleted.

Notes:
    - Update the  CSV file path below to match your local repository location.
*/

-- Create the 'spotify_streaming_history' database
CREATE DATABASE IF NOT EXISTS spotify_streaming_history;

-- Switch to the project database
USE spotify_streaming_history;

-- Creates the 'spotify_streaming_history' table 
CREATE TABLE IF NOT EXISTS spotify_history (
spotify_track_uri VARCHAR(50),
ts DATETIME,
platform VARCHAR(50),
ms_played INT,
track_name VARCHAR(255),
artist_name VARCHAR(255),
album_name VARCHAR(255),
reason_start VARCHAR(50),
reason_end VARCHAR(50),
shuffle BOOLEAN,
skipped BOOLEAN
);

-- Enables the LOCAL INFILE option to allow importing data from a local CSV file.
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'spotify-streaming-eda/dataset/spotify_history.csv'
INTO TABLE spotify_history
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

