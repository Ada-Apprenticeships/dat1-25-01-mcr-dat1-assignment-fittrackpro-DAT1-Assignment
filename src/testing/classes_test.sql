.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- -- Valid input  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (1, 'Yoga', 'A relaxing yoga class', '2022-01-01', 20, 60, 1),  
-- (2, 'Pilates', 'Strength and flexibility through Pilates', '2022-02-01', 15, 45, 2),  
-- (3, 'Zumba', 'Dance your way to fitness', '2022-03-01', 25, 50, 3);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Edge case: Minimum length for name  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (4, 'A', 'Brief class description', '2022-04-01', 10, 30, 4),  
-- (5, 'B', 'Another brief class description', '2022-05-01', 12, 35, 5),  
-- (6, 'C', 'Yet another brief class description', '2022-06-01', 14, 40, 6);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Edge case: Maximum length for name  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (7, 'ThirtyCharacterNameYogaClass', 'Description of a yoga class with a long name', '2022-07-01', 18, 55, 7),  
-- (8, 'AnotherThirtyCharacterClass', 'Description of another class with a long name', '2022-08-01', 20, 60, 8),  
-- (9, 'MaxLengthNameForClassTest', 'Description of a test class with maximum length name', '2022-09-01', 22, 65, 9);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Name too short  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (10, '', 'Invalid class with empty name', '2022-10-01', 15, 45, 10),  
-- (11, '', 'Another invalid class with empty name', '2022-11-01', 17, 50, 11),  
-- (12, '', 'Third invalid class with empty name', '2022-12-01', 19, 55, 12);  
-- -- Expected result: All rows should fail due to name length constraint.  
-- -- PASS  
  
-- -- Invalid input: Name too long  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (13, 'ThisNameIsWayTooLongForTheClassTable', 'Too long name description', '2023-01-01', 20, 60, 13),  
-- (14, 'AnotherNameThatIsWayTooLongForClass', 'Another too long name description', '2023-02-01', 25, 65, 14),  
-- (15, 'ExcessivelyLongNameForClassTestCase', 'Excessively long name description', '2023-03-01', 30, 70, 15);  
-- -- Expected result: All rows should fail due to name length constraint.  
-- -- PASS  
  
-- -- Invalid input: Capacity below logical limit  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (16, 'InvalidCapacityClass1', 'Class with invalid capacity', '2023-04-01', -1, 30, 16),  
-- (17, 'InvalidCapacityClass2', 'Another class with invalid capacity', '2023-05-01', -10, 40, 17),  
-- (18, 'InvalidCapacityClass3', 'Third class with invalid capacity', '2023-06-01', -15, 50, 18);  
-- -- Expected result: All rows should fail due to invalid capacity constraint (assuming capacity must be non-negative).  
-- -- PASS  

-- -- Invalid input: Duration below logical limit  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (26, 'InvalidDurationClass1', 'Class with invalid capacity', '2023-04-01', 2, -30, 16),  
-- (27, 'InvalidDurationClass2', 'Another class with invalid capacity', '2023-05-01', 10, -40, 17),  
-- (28, 'InvalidDurationClass3', 'Third class with invalid capacity', '2023-06-01', 15, 0, 18);  
-- -- Expected result: All rows should fail due to invalid capacity constraint (assuming capacity must be non-negative).  
-- -- PASS

-- -- Foreign Key constraint: Location does not exist  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (19, 'NonExistentLocationClass1', 'Class with non-existent location', '2023-07-01', 20, 60, 999),  
-- (20, 'NonExistentLocationClass2', 'Another class with non-existent location', '2023-08-01', 25, 65, 999),  
-- (21, 'NonExistentLocationClass3', 'Third class with non-existent location', '2023-09-01', 30, 70, 999);  
-- -- Expected result: All rows should fail due to foreign key constraint violation.  
-- -- PASS  
  
-- -- Duplicate PRIMARY KEY  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (1, 'DuplicateKeyClass1', 'This class has a duplicate key', '2023-10-01', 15, 45, 1),  
-- (2, 'DuplicateKeyClass2', 'Another class with duplicate key', '2023-11-01', 20, 50, 2),  
-- (3, 'DuplicateKeyClass3', 'Third class with duplicate key', '2023-12-01', 25, 55, 3);  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO classes (class_id, name, description, purchase_date, capacity, duration, location_id) VALUES  
-- (32, 'FinalValidClass1', 'Final valid class description', '2024-01-01', 20, 60, 4),  
-- (33, 'FinalValidClass2', 'Another final valid class description', '2024-02-01', 25, 65, 5),  
-- (34, 'FinalValidClass3', 'Third final valid class description', '2024-03-01', 30, 70, 6);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS