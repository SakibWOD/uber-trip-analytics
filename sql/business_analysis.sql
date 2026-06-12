-- ===========================================
-- FILE: business_analysis.sql
-- PROJECT: Uber Trip Analytics
-- ===========================================

USE uber_data;

-- Trips by Passenger Count
SELECT
passenger_count,
COUNT(ride_id) AS total_trips
FROM uber_trips
GROUP BY passenger_count
ORDER BY total_trips DESC;

-- Revenue by Passenger Count
SELECT
passenger_count,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY passenger_count
ORDER BY revenue DESC;

-- Average Fare by Passenger Count
SELECT
passenger_count,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips
GROUP BY passenger_count
ORDER BY avg_fare DESC;

-- Passenger Summary
SELECT
passenger_count,
COUNT(ride_id) AS total_trips,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY passenger_count
ORDER BY total_trips DESC;

-- Fare Segmentation
SELECT
fare_amount,
CASE
WHEN fare_amount < 10 THEN 'Low Fare'
WHEN fare_amount BETWEEN 10 AND 30 THEN 'Medium Fare'
ELSE 'High Fare'
END AS fare_segment
FROM uber_trips;

-- Top 10 Highest Fare Trips
SELECT
ride_id,
fare_amount,
pickup_datetime
FROM uber_trips
ORDER BY fare_amount DESC
LIMIT 10;

-- Top Revenue Hours
SELECT
ride_hour,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY ride_hour
ORDER BY revenue DESC
LIMIT 10;

-- Time Category Performance
SELECT
time_category,
COUNT(ride_id) AS total_trips,
ROUND(SUM(fare_amount),2) AS revenue,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips
GROUP BY time_category
ORDER BY revenue DESC;