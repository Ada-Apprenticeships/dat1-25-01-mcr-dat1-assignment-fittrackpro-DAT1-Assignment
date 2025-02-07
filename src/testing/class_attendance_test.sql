.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- -- Valid input  
-- INSERT INTO class_attendance (class_attendance_id, schedule_id, member_id, attendance_status) VALUES  
-- (1, 1, 1, 'Registered'),  
-- (2, 2, 2, 'Attended'),  
-- (3, 3, 3, 'Unattended');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO class_attendance (class_attendance_id, schedule_id, member_id, attendance_status) VALUES  
-- (1, 4, 3, 'Registered'),  
-- (2, 5, 2, 'Attended'),  
-- (3, 6, 1, 'Unattended');  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Invalid input: Non-existent schedule_id (Foreign Key Constraint)  
-- INSERT INTO class_attendance (class_attendance_id, schedule_id, member_id, attendance_status) VALUES  
-- (4, 999, 2, 'Registered'),  
-- (5, 998, 2, 'Attended'),  
-- (6, 997, 1, 'Unattended');  
-- -- Expected result: All rows should fail due to foreign key constraint violation on schedule_id.  
-- -- PASS  
  
-- -- Invalid input: Non-existent member_id (Foreign Key Constraint)  
-- INSERT INTO class_attendance (class_attendance_id, schedule_id, member_id, attendance_status) VALUES  
-- (7, 7, 999, 'Registered'),  
-- (8, 8, 998, 'Attended'),  
-- (9, 9, 997, 'Unattended');  
-- -- Expected result: All rows should fail due to foreign key constraint violation on member_id.  
-- -- PASS  
  
-- -- Invalid input: Incorrect attendance_status value  
-- INSERT INTO class_attendance (class_attendance_id, schedule_id, member_id, attendance_status) VALUES  
-- (10, 10, 110, 'Pending'),  
-- (11, 11, 111, 'Cancelled'),  
-- (12, 12, 112, 'Completed');  
-- -- Expected result: All rows should fail due to attendance_status check constraint.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO class_attendance (class_attendance_id, schedule_id, member_id, attendance_status) VALUES  
-- (13, 1, 1, 'Registered'),  
-- (14, 2, 2, 'Attended'),  
-- (15, 3, 2, 'Unattended');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  