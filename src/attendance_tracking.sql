-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
-- TODO: Write a query to record a member's gym visit
INSERT INTO attendance (member_id, location_id, check_in_time)
VALUES (7, 1, DATETIME('now'))


-- 2. Retrieve a member's attendance history
-- TODO: Write a query to retrieve a member's attendance history
SELECT SUBSTR(check_in_time, 1, 10) AS visit_date, check_in_time, check_out_time
FROM attendance
WHERE member_id = 5

-- 3. Find the busiest day of the week based on gym visits
-- TODO: Write a query to find the busiest day of the week based on gym visits
SELECT strftime('%w', a.check_in_time) AS day_of_week, COUNT(*) AS visit_count  
FROM attendance a  
WHERE a.check_in_time IS NOT NULL  
GROUP BY day_of_week  
ORDER BY visit_count DESC  
LIMIT 1;

-- 4. Calculate the average daily attendance for each location
-- TODO: Write a query to calculate the average daily attendance for each location
SELECT l.name AS location_name, AVG(daily_visits.visit_count) AS average_daily_attendance  
FROM (SELECT location_id, DATE(check_in_time) AS visit_date, COUNT(*) AS visit_count  
        FROM attendance  
        WHERE check_in_time IS NOT NULL  
        GROUP BY location_id, DATE(check_in_time)) AS daily_visits  
JOIN locations l ON daily_visits.location_id = l.location_id  
GROUP BY l.location_id