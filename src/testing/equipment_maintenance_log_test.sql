.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- -- Valid input  
-- INSERT INTO equipment_maintenance_log (log_id, equipment_id, maintenance_date, description, staff_id) VALUES  
-- (1, 1, '2023-10-01', 'Quarterly maintenance check', 1),  
-- (2, 2, '2023-10-02', 'Replaced worn-out parts', 2),  
-- (3, 3, '2023-10-03', 'Routine cleaning and lubrication', 3);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO equipment_maintenance_log (log_id, equipment_id, maintenance_date, description, staff_id) VALUES  
-- (1, 1, '2023-10-04', 'Fixed electrical issues', 1),  
-- (2, 2, '2023-10-05', 'Replaced safety guards', 2),  
-- (3, 3, '2023-10-06', 'Updated firmware', 3);  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Invalid input: Non-existent equipment_id (Foreign Key Constraint)  
-- INSERT INTO equipment_maintenance_log (log_id, equipment_id, maintenance_date, description, staff_id) VALUES  
-- (4, 9999, '2023-10-07', 'Checked alignment', 1),  
-- (5, 9998, '2023-10-08', 'Calibrated sensors', 2),  
-- (6, 9997, '2023-10-09', 'Repaired control panel', 3);  
-- -- Expected result: All rows should fail due to foreign key constraint violation on equipment_id.  
-- -- PASS  
  
-- -- Invalid input: Non-existent staff_id (Foreign Key Constraint)  
-- INSERT INTO equipment_maintenance_log (log_id, equipment_id, maintenance_date, description, staff_id) VALUES  
-- (7, 1, '2023-10-10', 'Inspection for wear', 9999),  
-- (8, 2, '2023-10-11', 'Cleaned air filters', 9998),  
-- (9, 3, '2023-10-12', 'Replaced oil', 9997);  
-- -- Expected result: All rows should fail due to foreign key constraint violation on staff_id.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO equipment_maintenance_log (log_id, equipment_id, maintenance_date, description, staff_id) VALUES  
-- (10, 1, '2023-10-13', 'Tested emergency stop', 2),  
-- (11, 2, '2023-10-14', 'Replaced drive belts', 1),  
-- (12, 3, '2023-10-15', 'Lubricated moving parts', 2);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  