.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;


-- -- Valid input  
-- INSERT INTO attendance (attendance_id, member_id, location_id, check_in_time, check_out_time) VALUES  
-- (1, 1, 101, '2023-10-01 09:00:00', '2023-10-01 10:00:00'),  
-- (2, 2, 102, '2023-10-01 11:00:00', '2023-10-01 12:00:00'),  
-- (3, 3, 103, '2023-10-01 13:00:00', '2023-10-01 14:00:00');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO attendance (attendance_id, member_id, location_id, check_in_time, check_out_time) VALUES  
-- (1, 4, 104, '2023-10-02 09:00:00', '2023-10-02 10:00:00'),  
-- (2, 5, 105, '2023-10-02 11:00:00', '2023-10-02 12:00:00'),  
-- (3, 6, 106, '2023-10-02 13:00:00', '2023-10-02 14:00:00');  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Invalid input: Non-existent member_id (Foreign Key Constraint)  
-- INSERT INTO attendance (attendance_id, member_id, location_id, check_in_time, check_out_time) VALUES  
-- (4, 999, 107, '2023-10-03 09:00:00', '2023-10-03 10:00:00'),  
-- (5, 998, 108, '2023-10-03 11:00:00', '2023-10-03 12:00:00'),  
-- (6, 997, 109, '2023-10-03 13:00:00', '2023-10-03 14:00:00');  
-- -- Expected result: All rows should fail due to foreign key constraint violation.  
-- -- PASS  
  
-- -- Invalid input: Incorrect check_in_time format  
-- INSERT INTO attendance (attendance_id, member_id, location_id, check_in_time, check_out_time) VALUES  
-- (7, 1, 110, '2023-10-04 09:00', '2023-10-04 10:00:00'),  
-- (8, 2, 111, '09:00:00 2023-10-04', '2023-10-04 11:00:00'),  
-- (9, 3, 112, '20231004 090000', '2023-10-04 12:00:00');  
-- -- Expected result: All rows should fail due to incorrect check_in_time format.  
-- -- PASS  
  
-- -- Invalid input: Incorrect check_out_time format  
-- INSERT INTO attendance (attendance_id, member_id, location_id, check_in_time, check_out_time) VALUES  
-- (10, 1, 113, '2023-10-05 09:00:00', '2023-10-05 10:00'),  
-- (11, 2, 114, '2023-10-05 11:00:00', '10:00:00 2023-10-05'),  
-- (12, 3, 115, '2023-10-05 13:00:00', '20231005 140000');  
-- -- Expected result: All rows should fail due to incorrect check_out_time format.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO attendance (attendance_id, member_id, location_id, check_in_time, check_out_time) VALUES  
-- (13, 1, 116, '2023-10-06 09:00:00', '2023-10-06 10:00:00'),  
-- (14, 2, 117, '2023-10-06 11:00:00', '2023-10-06 12:00:00'),  
-- (15, 3, 118, '2023-10-06 13:00:00', '2023-10-06 14:00:00');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
