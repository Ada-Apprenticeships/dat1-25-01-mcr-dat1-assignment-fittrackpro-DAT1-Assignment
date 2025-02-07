.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- -- Valid input  
-- INSERT INTO class_schedule (schedule_id, class_id, staff_id, start_time, end_time) VALUES  
-- (1, 1, 1, '2023-10-01 09:00:00', '2023-10-01 10:00:00'),  
-- (2, 2, 1, '2023-10-01 11:00:00', '2023-10-01 12:00:00'),  
-- (3, 3, 2, '2023-10-01 13:00:00', '2023-10-01 14:00:00');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: start_time format incorrect  
-- INSERT INTO class_schedule (schedule_id, class_id, staff_id, start_time, end_time) VALUES  
-- (4, 1, 2, '2023-10-01 09:00', '2023-10-01 10:00:00'),  
-- (5, 2, 2, '09:00:00 2023-10-01', '2023-10-01 11:00:00'),  
-- (6, 3, 1, '20231001 090000', '2023-10-01 12:00:00');  
-- -- Expected result: All rows should fail due to incorrect start_time format.  
-- -- PASS
  
-- -- Invalid input: end_time format incorrect  
-- INSERT INTO class_schedule (schedule_id, class_id, staff_id, start_time, end_time) VALUES  
-- (7, 1, 1, '2023-10-01 09:00:00', '2023-10-01 10:00'),  
-- (8, 2, 1, '2023-10-01 11:00:00', '10:00:00 2023-10-01'),  
-- (9, 3, 2, '2023-10-01 13:00:00', '20231001 140000');  
-- -- Expected result: All rows should fail due to incorrect end_time format.  
-- -- PASS
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO class_schedule (schedule_id, class_id, staff_id, start_time, end_time) VALUES  
-- (1, 1, 1, '2023-10-02 09:00:00', '2023-10-02 10:00:00'),  
-- (2, 2, 3, '2023-10-02 11:00:00', '2023-10-02 12:00:00'),  
-- (3, 3, 1, '2023-10-02 13:00:00', '2023-10-02 14:00:00');  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS
  
-- -- Foreign Key constraint: class_id does not exist  
-- INSERT INTO class_schedule (schedule_id, class_id, staff_id, start_time, end_time) VALUES  
-- (10, 999, 2, '2023-10-03 09:00:00', '2023-10-03 10:00:00'),  
-- (11, 998, 1, '2023-10-03 11:00:00', '2023-10-03 12:00:00'),  
-- (12, 997, 1, '2023-10-03 13:00:00', '2023-10-03 14:00:00');  
-- -- Expected result: All rows should fail due to foreign key constraint violation.  
-- -- PASS  

-- -- Foreign Key constraint: staff_id does not exist  
-- INSERT INTO class_schedule (schedule_id, class_id, staff_id, start_time, end_time) VALUES  
-- (10, 1, 200, '2023-10-03 09:00:00', '2023-10-03 10:00:00'),  
-- (11, 2, 101, '2023-10-03 11:00:00', '2023-10-03 12:00:00'),  
-- (12, 3, -1, '2023-10-03 13:00:00', '2023-10-03 14:00:00');  
-- -- Expected result: All rows should fail due to foreign key constraint violation.  
-- -- PASS   

-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO class_schedule (schedule_id, class_id, staff_id, start_time, end_time) VALUES  
-- (13, 1, 1, '2023-10-04 09:00:00', '2023-10-04 10:00:00'),  
-- (14, 2, 3, '2023-10-04 11:00:00', '2023-10-04 12:00:00'),  
-- (15, 3, 2, '2023-10-04 13:00:00', '2023-10-04 14:00:00');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  