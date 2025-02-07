.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- -- Valid input  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (1, 1, '2023-10-01', '75.5', '18.4', '60.2', '23.5'),  
-- (2, 2, '2023-10-02', '90.0', '25.9', '70.3', '26.8'),  
-- (3, 3, '2023-10-03', '68.7', '15.3', '55.6', '21.7');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (1, 4, '2023-10-04', '65.5', '17.2', '58.1', '22.3'),  
-- (2, 5, '2023-10-05', '82.1', '22.8', '65.4', '25.1'),  
-- (3, 6, '2023-10-06', '70.9', '20.0', '60.0', '24.0');  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS
  
-- -- Invalid input: Non-existent member_id (Foreign Key Constraint)  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (4, 999, '2023-10-07', '70.0', '18.5', '60.5', '23.0'),  
-- (5, 998, '2023-10-08', '80.0', '20.0', '65.0', '25.0'),  
-- (6, 997, '2023-10-09', '75.0', '19.5', '62.5', '24.5');  
-- -- Expected result: All rows should fail due to foreign key constraint violation.  
-- -- PASS  
  
-- -- Invalid input: Incorrect weight format  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (7, 7, '2023-10-10', '7.5', '18.2', '60.2', '23.5'),  
-- (8, 8, '2023-10-11', '100.0', '20.1', '63.3', '25.6'),  
-- (9, 9, '2023-10-12', '75.55', '19.9', '61.1', '24.9');  
-- -- Expected result: All rows should fail due to weight format constraint.  
-- -- PASS  
  
-- -- Invalid input: Incorrect body_fat_percentage format  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (10, 10, '2023-10-13', '70.0', '8.5', '60.0', '23.0'),  
-- (11, 11, '2023-10-14', '80.0', '100.0', '65.0', '25.0'),  
-- (12, 12, '2023-10-15', '75.0', '19.99', '62.5', '24.5');  
-- -- Expected result: All rows should fail due to body_fat_percentage format constraint.  
-- -- PASS  
  
-- -- Invalid input: Incorrect muscle_mass format  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (13, 13, '2023-10-16', '70.0', '18.5', '6.0', '23.0'),  
-- (14, 14, '2023-10-17', '80.0', '20.0', '100.0', '25.0'),  
-- (15, 15, '2023-10-18', '75.0', '19.5', '62.55', '24.5');  
-- -- Expected result: All rows should fail due to muscle_mass format constraint.  
-- -- PASS  
  
-- -- Invalid input: Incorrect bmi format  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (16, 16, '2023-10-19', '70.0', '18.5', '60.0', '2.0'),  
-- (17, 17, '2023-10-20', '80.0', '20.0', '65.0', '125.0'),  
-- (18, 18, '2023-10-21', '75.0', '19.5', '62.5', '24.55');  
-- -- Expected result: All rows should fail due to bmi format constraint.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO member_health_metrics (metric_id, member_id, measurement_date, weight, body_fat_percentage, muscle_mass, bmi) VALUES  
-- (19, 1, '2023-10-22', '74.3', '18.9', '59.7', '22.8'),  
-- (20, 2, '2023-10-23', '85.5', '23.4', '66.2', '26.0'),  
-- (21, 3, '2023-10-24', '69.8', '17.6', '56.4', '21.9');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
