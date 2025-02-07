.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;
        

-- -- Valid input  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '1990-01-01', '2023-01-01', 'Jane Doe', '0987654321'),  
-- (2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '1985-05-15', '2023-02-01', 'John Smith', '1234567890');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Edge case: Minimum length for first_name and emergency_contact_name  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (3, 'A', 'Brown', 'a.brown@example.com', '1234567890', '2000-02-02', '2023-03-01', 'B C', '0987654321'),  
-- (4, 'C', 'Davis', 'c.davis@example.com', '2345678901', '1995-03-03', '2023-03-15', 'D E', '9876543210');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Edge case: Maximum length for first_name and emergency_contact_name  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (5, 'TwentyCharFirstName', 'LongLastName', 'long.name@example.com', '1112223333', '1975-12-25', '2023-04-01', 'VeryLongEmergencyContactName', '2223334444'),  
-- (6, 'AnotherTwentyCharNam', 'AnotherLongLast', 'another.long@example.com', '3334445555', '1982-06-15', '2023-04-15', 'AnotherVeryLongName', '3334445555');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS 
  
-- -- Invalid input: First name too short  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (7, '', 'Green', 'green@example.com', '3334445555', '1995-07-07', '2023-05-01', 'Sam Green', '3334445555'),  
-- (8, '', 'Blue', 'blue@example.com', '4445556666', '1988-08-08', '2023-05-15', 'Sam Blue', '4445556666');  
-- -- Expected result: Both rows should fail due to first name constraint violation.  
-- -- PASS  
  
-- -- Invalid input: First name too long  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (9, 'ThisFirstNameIsWayTooLong', 'Blue', 'blue@example.com', '4445556666', '1988-08-08', '2023-06-01', 'Sam Blue', '4445556666'),  
-- (10, 'AnotherNameWayTooLong', 'Red', 'red@example.com', '5556667777', '1990-09-09', '2023-06-15', 'Max Red', '5556667777');  
-- -- Expected result: Both rows should fail due to first name length constraint.  
-- -- PASS  
  
-- -- Invalid input: Email without '@' or '.'  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (11, 'Tom', 'White', 'tomwhiteemail.com', '5556667777', '1970-10-10', '2023-07-01', 'Jerry White', '5556667777'),  
-- (12, 'Jerry', 'Black', 'jerryblackemailcom', '6667778888', '1985-11-11', '2023-07-15', 'Tom Black', '6667778888');  
-- -- Expected result: Both rows should fail due to email format constraint.  
-- -- PASS  
  
-- -- Invalid input: Phone number too short  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (13, 'Jerry', 'Black', 'jerry.black@example.com', '12345', '1992-11-11', '2023-08-01', 'Tom Black', '7778889999'),  
-- (14, 'Mark', 'Brown', 'mark.brown@example.com', '54321', '1991-12-12', '2023-08-15', 'Luke Brown', '8889990000');  
-- -- Expected result: Both rows should fail due to phone number length constraint.  
-- -- PASS  
  
-- -- Invalid input: Phone number too long  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (15, 'Sam', 'Yellow', 'sam.yellow@example.com', '123456789012345678901', '1980-09-09', '2023-09-01', 'Max Yellow', '9990001111'),  
-- (16, 'Lucy', 'Green', 'lucy.green@example.com', '123456789012345678902', '1978-05-05', '2023-09-15', 'Anna Green', '0001112222');  
-- -- Expected result: Both rows should fail due to phone number length constraint.  
-- -- PASS  
  
-- -- Special characters in first_name  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (17, 'Spec!al', 'Chars', 'special.chars@example.com', '8889990000', '1999-12-12', '2023-10-01', 'Normal Name', '8889990000'),  
-- (18, 'Uni@que', 'Name', 'unique.name@example.com', '0001112223', '1987-07-07', '2023-10-15', 'Another Normal', '1112223334');  
-- -- Expected result: Rows should be inserted successfully if special characters are allowed.  
-- -- PASS  
  
-- -- Unicode in first_name  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (19, 'ユニコード', 'Name', 'unicode@example.com', '9990001111', '1986-04-04', '2023-11-01', 'Normal Name', '9991112223'),  
-- (20, '测试', '名字', 'test.name@example.com', '2223334445', '1993-02-02', '2023-11-15', 'Emergency Contact', '3334445556');  
-- -- Expected result: Rows should be inserted successfully if Unicode is supported.  
-- -- PASS  
  
-- -- Duplicate PRIMARY KEY  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (19, 'Duplicate', 'Key', 'duplicate.key@example.com', '1112223333', '1983-03-03', '2023-12-01', 'Copy Name', '1112223333'),  
-- (20, 'AnotherDuplicate', 'Key', 'another.duplicate@example.com', '3334445555', '1984-04-04', '2023-12-15', 'Another Copy', '3334445555');  
-- -- Expected result: Both rows should fail due to duplicate primary key.  
-- -- PASS 
  
-- -- Attempt to insert multiple rows with the same PRIMARY KEY  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (21, 'PrimaryTest1', 'Key', 'primary1.key@example.com', '2223334444', '1991-01-01', '2023-01-01', 'Emergency Contact', '2223334444'),  
-- (21, 'PrimaryTest2', 'Key', 'primary2.key@example.com', '3334445555', '2001-02-02', '2023-02-01', 'Emergency Contact', '3334445555');  
-- -- Expected result: Both rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO members (member_id, first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- (22, 'Final', 'Test', 'final.test@example.com', '4445556666', '1994-04-04', '2023-03-01', 'Final Contact', '4445556666'),  
-- (23, 'AnotherFinal', 'Test', 'another.final@example.com', '5556667777', '1996-06-06', '2023-03-15', 'Another Contact', '5556667777');  
-- -- Expected result: All rows should be inserted successfully because member_id is unique.  
-- -- PASS  
  
-- -- Attempt with no member_id  
-- INSERT INTO members (first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone) VALUES  
-- ('NoID', 'Assigned', 'noid.assigned@example.com', '5556667777', '1997-05-05', '2023-04-01', 'Zero Contact', '5556667777'),  
-- ('AnotherNoID', 'Assigned', 'another.noid@example.com', '6667778888', '1998-08-08', '2023-04-15', 'Another Zero', '6667778888');  
-- -- Expected result: Both rows should be inserted and unique member_ids should be assigned.  
-- -- PASS