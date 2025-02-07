.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;
        

-- -- Valid input  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (1, 'Treadmill', 'Cardio', '2021-01-01', '2022-01-01', '2023-01-01', 1),  
-- (2, 'Bench Press', 'Strength', '2020-05-01', '2021-05-01', '2022-05-01', 2);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Edge case: Minimum length for name  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (3, 'A', 'Cardio', '2020-01-01', '2021-01-01', '2022-01-01', 3),  
-- (4, 'B', 'Strength', '2019-06-01', '2020-06-01', '2021-06-01', 4);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Edge case: Maximum length for name  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (5, 'ThirtyCharactersLongNameX', 'Cardio', '2018-01-01', '2019-01-01', '2020-01-01', 5),  
-- (6, 'AnotherThirtyCharacterNameY', 'Strength', '2017-07-01', '2018-07-01', '2019-07-01', 6);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Name too short  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (7, '', 'Cardio', '2021-02-01', '2022-02-01', '2023-02-01', 7),  
-- (8, '', 'Strength', '2019-08-01', '2020-08-01', '2021-08-01', 8);  
-- -- Expected result: Both rows should fail due to name length constraint.  
-- -- PASS  
  
-- -- Invalid input: Name too long  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (9, 'ThisNameIsWayTooLongForTheTable', 'Cardio', '2020-03-01', '2021-03-01', '2022-03-01', 9),  
-- (10, 'AnotherWayTooLongNameForTheTable', 'Strength', '2018-09-01', '2019-09-01', '2020-09-01', 10);  
-- -- Expected result: Both rows should fail due to name length constraint.  
-- -- PASS  
  
-- -- Invalid input: Invalid type  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (11, 'Stationary Bike', 'CardioVascular', '2019-04-01', '2020-04-01', '2021-04-01', 11),  
-- (12, 'Leg Press', 'Strengthening', '2017-10-01', '2018-10-01', '2019-10-01', 12);  
-- -- Expected result: Both rows should fail due to type constraint.  
-- -- PASS  
  
-- -- Invalid input: purchase_date not before last_maintenance_date  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (13, 'Rowing Machine', 'Cardio', '2022-05-01', '2021-05-01', '2023-05-01', 13),  
-- (14, 'Dumbbells', 'Strength', '2021-11-01', '2020-11-01', '2022-11-01', 14);  
-- -- Expected result: Both rows should fail due to purchase_date constraint.  
-- -- PASS  
  
-- -- Invalid input: last_maintenance_date not within range  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (15, 'Elliptical', 'Cardio', '2019-06-01', '2018-06-01', '2021-06-01', 15),  
-- (16, 'Barbell', 'Strength', '2017-12-01', '2016-12-01', '2018-12-01', 16);  
-- -- Expected result: Both rows should fail due to last_maintenance_date constraint.  
-- -- PASS  
  
-- -- Invalid input: next_maintenance_date not after last_maintenance_date  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (17, 'Stepper', 'Cardio', '2020-07-01', '2021-07-01', '2020-07-15', 17),  
-- (18, 'Cable Machine', 'Strength', '2018-01-01', '2019-01-01', '2018-12-01', 18);  
-- -- Expected result: Both rows should fail due to next_maintenance_date constraint.  
-- -- PASS  
  
-- -- Duplicate PRIMARY KEY  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (1, 'Duplicate Key Equipment', 'Cardio', '2020-08-01', '2021-08-01', '2022-08-01', 19),  
-- (2, 'Another Duplicate Key', 'Strength', '2017-02-01', '2018-02-01', '2019-02-01', 20);  
-- -- Expected result: Both rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Attempt to insert multiple rows with the same PRIMARY KEY  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (19, 'PrimaryTest1', 'Strength', '2020-09-01', '2021-09-01', '2022-09-01', 21),  
-- (19, 'PrimaryTest2', 'Cardio', '2018-03-01', '2019-03-01', '2020-03-01', 22);  
-- -- Expected result: Both rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (20, 'Final Equipment', 'Strength', '2019-10-01', '2020-10-01', '2021-10-01', 43),  
-- (21, 'Another Final Equipment', 'Cardio', '2018-04-01', '2019-04-01', '2020-04-01', 44);  
-- -- Expected result: All rows should be inserted successfully because equipment_id is unique.  
-- -- PASS  
  
-- -- Foreign Key constraint: Location does not exist  
-- INSERT INTO equipment (equipment_id, name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id) VALUES  
-- (22, 'NonExistentLocation', 'Cardio', '2021-11-01', '2022-11-01', '2023-11-01', 999),  
-- (23, 'AnotherNonExistentLoc', 'Strength', '2019-05-01', '2020-05-01', '2021-05-01', 999);  
-- -- Expected result: Both rows should fail due to foreign key constraint violation.  
-- -- PASS  