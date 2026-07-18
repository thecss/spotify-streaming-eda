# 🎧 Spotify User Listening Behavior EDA
*What can music listening habits tell us about user engagement?*

<p align="center">
<img width="500" height="300" alt="thibault-penin-SwKf1x2_hRo-unsplash" src="https://github.com/user-attachments/assets/890fd37a-4182-49d0-8b08-4bc76f7cf05e" />  
</p> 

<br>

## 💼 Business Problem
Spotify records millions of listening events every day across multiple devices and platforms. Each playback session captures valuable information about how users discover music, interact with recommendations, use platform features like shuffle, and decide whether to continue or skip a track.

While this behavioral data is available, product teams need a deeper understanding of listening patterns to improve user engagement, enhance recommendation systems, and create a more personalized listening experience.

<br>

## 🎯 Objective
As a Data Analyst on the Product Analytics team, I was tasked with performing an exploratory data analysis (EDA) of Spotify listening history using SQL.

The objective is to assess data quality, explore user listening behavior, identify engagement patterns, analyze playback habits, and generate insights that could support product and user experience decisions.

<br>

## 📂 Dataset
This project uses a Spotify listening history dataset where each record represents a single music playback event.

Key attributes: Track Name, Artist, Playback Timestamp, Platform, Playback Duration, Playback Start Reason, Shuffle, Skipped.

<br>

## 📊 Analysis Approach
The analysis was conducted using a structured analytical framework, progressing from data understanding and validation to business insight generation.

<table>
  <thead>
    <tr>
      <th>Analysis</th>
      <th>Objective</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>📋 <strong>Data Overview</strong></td>
      <td>Understand the dataset, its structure, and key attributes.</td>
    </tr>
    <tr>
      <td>🧹 <strong>Data Quality Assessment</strong></td>
      <td>Assess data quality by identifying missing values, duplicates, inconsistencies, and outliers.</td>
    </tr>
    <tr>
      <td>📊 <strong>Dimensions Analysis</strong></td>
      <td>Explore key dimensions including artists, tracks, albums, platforms, and playback categories (start and end reasons).</td>
    </tr>
    <tr>
      <td>📅 <strong>Date & Time Analysis</strong></td>
      <td>Determine the time span of the listening history by identifying the earliest and latest playback timestamps.</td>
    </tr>
   <tr>
      <td>📈 <strong>Measures Analysis</strong></td>
      <td>Evaluate overall listening activity using key metrics such as total streams, listening time, playback duration, skip rate, and repeated tracks.</td>
    </tr>
    <tr>
      <td>🏷️ <strong>Magnitude Analysis</strong></td>
      <td>Analyze streaming volume across artists, albums, tracks, and platforms to understand their contribution to overall listening activity.</td>
    </tr>
    <tr>
      <td>🏆 <strong>Ranking Analysis</strong></td>
      <td>Identify the top and bottom streamed artists, tracks, and platforms, along with the most frequently skipped artists and tracks.</td>
    </tr>
  </tbody>
</table>

<br>
