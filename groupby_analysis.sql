-- ===========================================
-- FILE: groupby_analysis.sql
-- PROJECT: Uber Trip Analytics
-- ===========================================

USE uber_data;

-- Trips by Month
SELECT ride_month,
COUNT(ride_id) AS total_trips
FROM uber_trips
GROUP BY ride_month
ORDER BY total_trips DESC;

-- Revenue by Month
SELECT ride_month,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY ride_month
ORDER BY revenue DESC;

-- Average Fare by Month
SELECT ride_month,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips
GROUP BY ride_month
ORDER BY avg_fare DESC;

-- Trips by Hour
SELECT ride_hour,
COUNT(ride_id) AS total_trips
FROM uber_trips
GROUP BY ride_hour
ORDER BY total_trips DESC;

-- Revenue by Hour
SELECT ride_hour,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY ride_hour
ORDER BY revenue DESC;

-- Average Fare by Hour
SELECT ride_hour,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips
GROUP BY ride_hour
ORDER BY avg_fare DESC;

-- Trips by Day
SELECT day_name,
COUNT(ride_id) AS total_trips
FROM uber_trips
GROUP BY day_name
ORDER BY total_trips DESC;

-- Revenue by Day
SELECT day_name,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY day_name
ORDER BY revenue DESC;

-- Average Fare by Day
SELECT day_name,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips
GROUP BY day_name
ORDER BY avg_fare DESC;

-- Trips by Time Category
SELECT time_category,
COUNT(ride_id) AS total_trips
FROM uber_trips
GROUP BY time_category
ORDER BY total_trips DESC;

-- Revenue by Time Category
SELECT time_category,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY time_category
ORDER BY revenue DESC;

-- Average Fare by Time Category
SELECT time_category,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips
GROUP BY time_category
ORDER BY avg_fare DESC;

-- Time Category Summary
SELECT
time_category,
COUNT(ride_id) AS total_trips,
ROUND(SUM(fare _amount),2) AS total_revenue
FROM uber_trips
GROUP BY time_category
ORDER BY total_revenue DESC;

-- Monthly Performance Summary
SELECT
ride_month,
COUNT(ride_id) AS total_trips,
ROUND(SUM(fare_amount),2) AS revenue,
ROUND(AVG(fare_amount),2) AS avg_fare
FROM uber_trips
GROUP BY ride_month
ORDER BY revenue DESC;

-- Top 5 Busiest Hours
SELECT
ride_hour,
COUNT(ride_id) AS total_trips
FROM uber_trips
GROUP BY ride_hour
ORDER BY total_trips DESC
LIMIT 5;