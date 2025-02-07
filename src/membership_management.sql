-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- Membership Management Queries

-- 1. List all active memberships
-- TODO: Write a query to list all active memberships
SELECT m.member_id, m.first_name, m.last_name, ms.type AS membership_type, m.join_date
FROM members m
JOIN memberships ms ON m.member_id == ms.member_id
WHERE ms.status = 'Active'


-- 2. Calculate the average duration of gym visits for each membership type
-- TODO: 
SELECT m.type AS membership_type, AVG(JULIANDAY(a.check_out_time) - JULIANDAY(a.check_in_time)) * 24 * 60 AS average_visit_duration_minutes  
FROM attendance a  
JOIN members mb ON a.member_id = mb.member_id  
JOIN memberships m ON mb.member_id = m.member_id  
WHERE a.check_in_time IS NOT NULL AND a.check_out_time IS NOT NULL  
GROUP BY m.type;

-- 3. Identify members with expiring memberships this year
-- TODO: Write a query to identify members with expiring memberships this year

SELECT m.member_id, m.first_name, m.last_name, m.email, ms.end_date
FROM members m
JOIN memberships ms
ON m.member_id = ms.member_id
WHERE ms.end_date LIKE '2025%'