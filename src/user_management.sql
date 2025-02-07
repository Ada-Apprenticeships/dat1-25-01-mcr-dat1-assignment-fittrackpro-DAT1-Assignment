-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- User Management Queries

-- 1. Retrieve all members
-- TODO: Write a query to retrieve all members
SELECT member_id, first_name, last_name, email, join_date 
FROM members;

-- 2. Update a member's contact information
-- TODO: Write a query to update a member's contact information
UPDATE members
SET email='emily.jones.updated@email.com'
WHERE member_id = 5; -- included email for a 2nd option as is also a unique key

-- -- 3. Count total number of members
-- -- TODO: Write a query to count the total number of members
SELECT COUNT(member_id) AS total_members
FROM members

-- 4. Find member with the most class registrations
-- TODO: Write a query to find the member with the most class registrations
SELECT m.member_id, m.first_name, m.last_name, COUNT(ca.class_attendance_id) AS registration_count  
FROM class_attendance ca  
JOIN members m ON ca.member_id = m.member_id  
WHERE ca.attendance_status = 'Registered'  
GROUP BY m.member_id, m.first_name, m.last_name
ORDER BY registration_count DESC  
LIMIT 1; 

-- 5. Find member with the least class registrations
-- TODO: Write a query to find the member with the least class registrations
SELECT m.member_id, m.first_name, m.last_name, COUNT(ca.class_attendance_id) AS registration_count  
FROM class_attendance ca  
JOIN members m ON ca.member_id = m.member_id  
WHERE ca.attendance_status = 'Registered'  
GROUP BY m.member_id, m.first_name, m.last_name
ORDER BY registration_count ASC  
LIMIT 1;

-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class
SELECT (COUNT(DISTINCT ca.member_id) * 100.0 / COUNT(DISTINCT m.member_id)) AS percentage_attended
FROM members m
LEFT JOIN class_attendance ca 
ON m.member_id = ca.member_id AND ca.attendance_status ='Attended'