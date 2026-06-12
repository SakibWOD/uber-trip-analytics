-- ===========================================
-- FILE: basic_analysis.sql
-- PROJECT: Uber Trip Analytics
-- DATABASE: uber_data
-- TABLE: uber_trips
-- ===========================================

USE uber_data;

-- Total Trips
SELECT COUNT(ride_id) AS total_trips
FROM uber_trips;

-- Total Revenue
SELECT ROUND(SUM(fare_amount),2) AS total_revenue
FROM uber_trips;

-- Total Passengers
SELECT ROUND(SUM(passenger_count)) AS total_passengers
FROM uber_trips;

-- Average Passengers per Trip
SELECT ROUND(AVG(passenger_count)) AS avg_passengers
FROM uber_trips;

-- Average Fare
SELECT ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips;

-- Highest and Lowest Fare
SELECT
MAX(fare_amount) AS highest_fare,
MIN(fare_amount) AS lowest_fare
FROM uber_trips
WHERE fare_amount > 2.5;

-- KPI Summary
SELECT
COUNT(ride_id) AS total_trips,
ROUND(SUM(fare_amount),2) AS total_revenue,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips;