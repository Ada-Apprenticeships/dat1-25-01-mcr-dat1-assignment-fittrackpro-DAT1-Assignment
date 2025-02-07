.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;


-- -- Valid input  
-- INSERT INTO personal_training_sessions (session_id, member_id, staff_id, session_date, start_time, end_time, notes) VALUES  
-- (1, 1, 1, '2023-10-01', '09:00:00', '10:00:00', 'Morning session'),  
-- (2, 2, 2, '2023-10-02', '11:00:00', '12:00:00', 'Midday session'),  
-- (3, 3, 3, '2023-10-03', '13:00:00', '14:00:00', 'Afternoon session');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO personal_training_sessions (session_id, member_id, staff_id, session_date, start_time, end_time, notes) VALUES  
-- (1, 1, 2, '2023-10-04', '15:00:00', '16:00:00', 'Duplicate session 1'),  
-- (2, 2, 1, '2023-10-05', '17:00:00', '18:00:00', 'Duplicate session 2'),  
-- (3, 1, 2, '2023-10-06', '19:00:00', '20:00:00', 'Duplicate session 3');  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Invalid input: Incorrect start_time format  
-- INSERT INTO personal_training_sessions (session_id, member_id, staff_id, session_date, start_time, end_time, notes) VALUES  
-- (4, 1, 1, '2023-10-07', '9:00:00', '10:00:00', 'Incorrect start time 1'),  
-- (5, 1, 1, '2023-10-08', '11:0:00', '12:00:00', 'Incorrect start time 2'),  
-- (6, 1, 1, '2023-10-09', '13:00', '14:00:00', 'Incorrect start time 3');  
-- -- Expected result: All rows should fail due to incorrect start_time format.  
-- -- FAIL  
  
-- -- Invalid input: Incorrect end_time format  
-- INSERT INTO personal_training_sessions (session_id, member_id, staff_id, session_date, start_time, end_time, notes) VALUES  
-- (7, 110, 210, '2023-10-10', '15:00:00', '16:0:0', 'Incorrect end time 1'),  
-- (8, 111, 211, '2023-10-11', '17:00:00', '18:00', 'Incorrect end time 2'),  
-- (9, 112, 212, '2023-10-12', '19:00:00', '2000', 'Incorrect end time 3');  
-- -- Expected result: All rows should fail due to incorrect end_time format.  
-- -- PASS  
  
-- -- Invalid input: Invalid end_time hour, minute, or second  
-- INSERT INTO personal_training_sessions (session_id, member_id, staff_id, session_date, start_time, end_time, notes) VALUES  
-- (10, 113, 213, '2023-10-13', '21:00:00', '24:00:00', 'Invalid end hour'),  
-- (11, 114, 214, '2023-10-14', '22:00:00', '22:60:00', 'Invalid end minute'),  
-- (12, 115, 215, '2023-10-15', '23:00:00', '23:59:60', 'Invalid end second');  
-- -- Expected result: All rows should fail due to invalid end_time values.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO personal_training_sessions (session_id, member_id, staff_id, session_date, start_time, end_time, notes) VALUES  
-- (13, 1, 2, '2023-10-16', '06:00:00', '07:00:00', 'Early morning session'),  
-- (14, 2, 2, '2023-10-17', '10:00:00', '11:00:00', 'Late morning session'),  
-- (15, 2, 2, '2023-10-18', '16:00:00', '17:00:00', 'Evening session');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  