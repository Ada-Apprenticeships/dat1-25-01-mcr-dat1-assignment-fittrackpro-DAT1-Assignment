.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;


-- -- Valid input  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', 'Trainer', '2022-01-01', 1),  
-- (2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'Manager', '2022-02-01', 2);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS
  
-- -- Edge case: Minimum length for first_name and last_name  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (3, 'A', 'B', 'a.b@example.com', '1234567890', 'Receptionist', '2022-03-01', 3),  
-- (4, 'C', 'D', 'c.d@example.com', '2345678901', 'Trainer', '2022-03-15', 4);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Edge case: Maximum length for first_name and last_name  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (5, 'TwentyCharFirstName', 'TwentyCharLastNam', 'long.name@example.com', '3334445555', 'Manager', '2022-04-01', 5),  
-- (6, 'AnotherTwentyCharNa', 'AnotherTwentyChar', 'another.long@example.com', '4445556666', 'Receptionist', '2022-04-15', 6);  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS
  
-- -- Invalid input: First name too short  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (7, '', 'Green', 'green@example.com', '3334445555', 'Trainer', '2022-05-01', 7),  
-- (8, '', 'Blue', 'blue@example.com', '4445556666', 'Manager', '2022-05-15', 8);  
-- -- Expected result: Both rows should fail due to first name length constraint.  
-- -- PASS  
  
-- -- Invalid input: First name too long  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (9, 'ThisFirstNameIsWayTooLong', 'Blue', 'blue@example.com', '4445556666', 'Receptionist', '2022-06-01', 9),  
-- (10, 'AnotherNameWayTooLong', 'Red', 'red@example.com', '5556667777', 'Trainer', '2022-06-15', 10);  
-- -- Expected result: Both rows should fail due to first name length constraint.  
-- -- PASS  
  
-- -- Invalid input: Email without '@' or '.'  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (11, 'Tom', 'White', 'tomwhiteemail.com', '5556667777', 'Manager', '2022-07-01', 11),  
-- (12, 'Jerry', 'Black', 'jerryblackemailcom', '6667778888', 'Receptionist', '2022-07-15', 12);  
-- -- Expected result: Both rows should fail due to email format constraint.  
-- -- PASS
  
-- -- Invalid input: Phone number too short  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (13, 'Jerry', 'Black', 'jerry.black@example.com', '12345', 'Trainer', '2022-08-01', 13),  
-- (14, 'Mark', 'Brown', 'mark.brown@example.com', '54321', 'Manager', '2022-08-15', 14);  
-- -- Expected result: Both rows should fail due to phone number length constraint.  
-- -- PASS  
  
-- -- Invalid input: Phone number too long  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (15, 'Sam', 'Yellow', 'sam.yellow@example.com', '123456789012345678901', 'Receptionist', '2022-09-01', 15),  
-- (16, 'Lucy', 'Green', 'lucy.green@example.com', '123456789012345678902', 'Trainer', '2022-09-15', 16);  
-- -- Expected result: Both rows should fail due to phone number length constraint.  
-- -- PASS
  
-- -- Invalid input: Invalid position  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (17, 'Spec!al', 'Chars', 'special.chars@example.com', '8889990000', 'InvalidPosition', '2022-10-01', 17),  
-- (18, 'Uni@que', 'Name', 'unique.name@example.com', '0001112223', 'AnotherInvalid', '2022-10-15', 18);  
-- -- Expected result: Both rows should fail due to invalid position constraint.  
-- -- PASS  
  
-- -- Duplicate PRIMARY KEY  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (1, 'Duplicate', 'Key', 'duplicate.key@example.com', '1112223333', 'Trainer', '2022-12-01', 19),  
-- (2, 'AnotherDuplicate', 'Key', 'another.duplicate@example.com', '3334445555', 'Manager', '2022-12-15', 20);  
-- -- Expected result: Both rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Attempt to insert multiple rows with the same PRIMARY KEY  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (21, 'PrimaryTest1', 'Key', 'primary1.key@example.com', '2223334444', 'Receptionist', '2022-01-01', 21),  
-- (21, 'PrimaryTest2', 'Key', 'primary2.key@example.com', '3334445555', 'Trainer', '2022-02-01', 22);  
-- -- Expected result: Both rows should fail due to duplicate primary key.  
-- -- PASS
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO staff (staff_id, first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- (22, 'Final', 'Test', 'final.test@example.com', '4445556666', 'Manager', '2022-03-01', 43),  
-- (23, 'AnotherFinal', 'Test', 'another.final@example.com', '5556667777', 'Receptionist', '2022-03-15', 44);  
-- -- Expected result: All rows should be inserted successfully because staff_id is unique.  
-- -- PASS 
  
-- -- Attempt with no staff_id (assuming auto-increment or similar)  
-- INSERT INTO staff (first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- ('NoID', 'Assigned', 'noid.assigned@example.com', '5556667777', 'Trainer', '2022-04-01', 45),  
-- ('AnotherNoID', 'Assigned', 'another.noid@example.com', '6667778888', 'Manager', '2022-04-15', 46);  
-- -- Expected result: Both rows should be inserted and unique staff_ids should be assigned.  
-- -- PASS  

-- -- Invalid Attempt with no wrong position  
-- INSERT INTO staff (first_name, last_name, email, phone_number, position, hire_date, location_id) VALUES  
-- ('wrongRole', 'Assigned', 'wrongRole.assigned@example.com', '555-666-7777', 'Trainr', '2022-04-01', 47),  
-- ('AnotherWrongRole', 'Assigned', 'AnotherWrongRole.assigned@example.com', '666-777-8888', 'Manger', '2022-04-15', 48);  
-- -- Expected result: Both rows should be inserted and unique staff_ids should be assigned.  
-- -- PASS
