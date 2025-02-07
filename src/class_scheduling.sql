-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Class Scheduling Queries

-- 1. List all classes with their instructors
-- TODO: Write a query to list all classes with their instructors
SELECT cl.class_id, cl.name AS class_name, s.first_name ||' '|| s.last_name AS instructor_name -- use ||' '|| to join names together into one attribute
FROM classes cl
JOIN class_schedule cs 
ON cl.class_id = cs.class_id
JOIN staff s 
ON cs.staff_id = s.staff_id

    -- 2. Find available classes for a specific date
    -- TODO: Write a query to find available classes for a specific date
    SELECT cl.class_id, cl.name AS class_name, cs.start_time, cs.end_time, (cl.capacity - COUNT(ca.class_attendance_id)) AS available_spots  
    FROM class_schedule cs  
    JOIN classes cl ON cs.class_id = cl.class_id  
    LEFT JOIN class_attendance ca ON cs.schedule_id = ca.schedule_id AND ca.attendance_status = 'Registered'  
    WHERE cs.start_time LIKE '2025-02-01%'  
    GROUP BY cl.class_id, cl.name, cs.start_time, cs.end_time, cl.capacity; 


    -- 3. Register a member for a class
    -- TODO: Write a query to register a member for a class
    INSERT INTO class_attendance (member_id, schedule_id, attendance_status)  
    VALUES (11, (SELECT schedule_id FROM class_schedule WHERE class_id = 3 AND start_time LIKE '2025-02-01%'), 'Registered');

    -- 4. Cancel a class registration
    -- TODO: Write a query to cancel a class registration
    DELETE FROM class_attendance 
    WHERE member_id == 2 AND schedule_id == 7;

-- -- 5. List top 5 most popular classes
-- -- TODO: Write a query to list top 5 most popular classes
--     IT SAYS TOP 3 IN THIS FILE BUT TOP 5 IN THE README SO I HAVE DONE QUERIES FOR BOTH!!!

-- TOP 3:
-- SELECT cs.class_id, cl.name AS class_name, COUNT(ca.attendance_status) AS registration_count  
FROM class_attendance ca  
JOIN class_schedule cs ON cs.schedule_id = ca.schedule_id  
JOIN classes cl ON cs.class_id = cl.class_id  
WHERE ca.attendance_status = 'Registered'  
GROUP BY cs.class_id, cl.name  
ORDER BY registration_count DESC  
LIMIT 3;

-- TOP 5:
SELECT cs.class_id, cl.name AS class_name, COUNT(ca.attendance_status) AS registration_count  
FROM class_attendance ca  
JOIN class_schedule cs ON cs.schedule_id = ca.schedule_id  
JOIN classes cl ON cs.class_id = cl.class_id  
WHERE ca.attendance_status = 'Registered'  
GROUP BY cs.class_id, cl.name  
ORDER BY registration_count DESC  
LIMIT 5;


-- 6. Calculate average number of classes per member
-- TODO: Write a query to calculate average number of classes per member
