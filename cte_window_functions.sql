-- ===========================================
-- FILE:advanced_sql.sql
-- PROJECT: Uber Trip Analytics
-- ===========================================

USE uber_data;

-- Trips Above Average Fare
SELECT
ride_id,
fare_amount
FROM uber_trips
WHERE fare_amount >
(
SELECT AVG(fare_amount)
FROM uber_trips
)
ORDER BY fare_amount DESC;

-- Overall Average Fare using Window Function
SELECT
ride_id,
fare_amount,
ROUND(AVG(fare_amount) OVER(),2) AS overall_avg
FROM uber_trips;

-- Fare Ranking
SELECT
ride_id,
fare_amount,
RANK() OVER(ORDER BY fare_amount DESC) AS fare_rank
FROM uber_trips;

-- Top Ranked Fares
SELECT
ride_id,
fare_amount,
RANK() OVER(ORDER BY fare_amount DESC) AS fare_rank
FROM uber_trips
LIMIT 10;

-- Monthly Revenue Ranking
SELECT
ride_month,
ROUND(SUM(fare_amount),2) AS revenue,
RANK() OVER(ORDER BY SUM(fare_amount) DESC) AS revenue_rank
FROM uber_trips
GROUP BY ride_month;

-- Monthly Revenue CTE
WITH monthly_revenue AS
(
SELECT
ride_month,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY ride_month
)
SELECT *
FROM monthly_revenue
ORDER BY revenue DESC;

-- Months Above Average Revenue
WITH monthly_revenue AS
(
SELECT
ride_month,
ROUND(SUM(fare_amount),2) AS revenue
FROM uber_trips
GROUP BY ride_month
)
SELECT *
FROM monthly_revenue
WHERE revenue >
(
SELECT AVG(revenue)
FROM monthly_revenue
);

-- Monthly Revenue Dashboard Query
SELECT
ride_month,
ROUND(SUM(fare_amount),2) AS revenue,
ROUND(AVG(fare_amount),2) AS avg_fare,
RANK() OVER(ORDER BY SUM(fare_amount) DESC) AS revenue_rank
FROM uber_trips
GROUP BY ride_month;