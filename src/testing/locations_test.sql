.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;
        
        
        -- LOCATIONS TABLE
-- Valid input  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(1, 'ValidName', '123 Main St', '123-456-7890', 'email@example.com', '09:00-17:00'),  
(2, 'ValidNameExtra', '124 Main St', '098-765-4321', 'extra@example.com', '10:00-18:00'),  
(3, 'AnotherValidName', '125 Main St', '567-890-1234', 'another@example.com', '08:00-16:00');  
-- Expected result: All rows should be inserted successfully.  
-- PASS
  
-- Edge case: Minimum length for name and phone_number  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(4, 'A', '456 Elm St', '012-345-6789', 'test@domain.com', '08:00-16:00'),  
(5, 'B', '457 Elm St', '987-654-3210', 'test2@domain.com', '09:00-17:00'),  
(6, 'C', '458 Elm St', '567-890-1234', 'test3@domain.com', '07:00-15:00');  
-- Expected result: All rows should be inserted successfully.  
-- PASS  
  
-- Edge case: Maximum length for name and phone_number  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(7, 'TwentyCharNameHere', '789 Oak St', '01234567890123456789', 'longemail@sample.org', '10:00-18:00'),  
(8, 'AnotherTwentyChar', '790 Oak St', '98765432109876543210', 'anotherlong@sample.org', '11:00-19:00'),  
(9, 'MaxTwentyCharName!', '791 Oak St', '12345678901234567890', 'maxlong@sample.org', '12:00-20:00');  
-- Expected result: All rows should be inserted successfully.  
-- PASS  
  
-- Edge case: Minimum length for opening_hours  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(10, 'EdgeCase', '321 Pine St', '0987654321', 'edge@cases.com', '1:00-1:00'),  
(11, 'EdgeHours', '322 Pine St', '0123456789', 'hours@cases.com', '0:00-0:00'),  
(12, 'MinHoursEdge', '323 Pine St', '1112223333', 'minhours@cases.com', '2:00-3:00');  
-- Expected result: All rows should be inserted successfully.  
-- PASS
                -- NOTES: ERROR RESOLVED - changed values in CHECK constraint
  
-- Edge case: Maximum length for opening_hours  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(13, 'MaxHours', '654 Spruce St', '1112223333', 'max@hours.com', '12:00-12:00'),  
(14, 'MaxHoursOne', '655 Spruce St', '2223334444', 'max1@hours.com', '23:59-23:59'),  
(15, 'MaxHoursTwo', '656 Spruce St', '3334445555', 'max2@hours.com', '11:11-11:11');  
-- Expected result: All rows should be inserted successfully.  
-- PASS
  
-- -- Invalid input: Name too short  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (16, '', '101 Maple St', '2223334444', 'invalid@name.com', '09:00-17:00'),  
-- (17, '', '102 Maple St', '3334445555', 'invalid2@name.com', '10:00-18:00'),  
-- (18, '', '103 Maple St', '4445556666', 'invalid3@name.com', '11:00-19:00');  
-- -- Expected result: All rows should fail due to name constraint violation.  
-- -- PASS  
  
-- -- Invalid input: Name too long  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (19, 'ThisNameIsWayTooLongForCheck', '202 Birch St', '3334445555', 'toolong@name.com', '09:00-17:00'),  
-- (20, 'AnotherNameThatIsWayTooLong', '203 Birch St', '4445556666', 'toolong2@name.com', '10:00-18:00'),  
-- (21, 'YetAnotherLongNameInvalid', '204 Birch St', '5556667777', 'toolong3@name.com', '11:00-19:00');  
-- -- Expected result: All rows should fail due to name length constraint.  
-- -- PASS
  
-- -- Invalid input: Phone number too short  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (22, 'ShortPhone', '303 Cedar St', '12345', 'short@phone.com', '09:00-17:00'),  
-- (23, 'ShortPhoneTwo', '304 Cedar St', '6789', 'short2@phone.com', '10:00-18:00'),  
-- (24, 'ShortPhoneThree', '305 Cedar St', '123', 'short3@phone.com', '11:00-19:00');  
-- -- Expected result: All rows should fail due to phone number length constraint.  
-- -- PASS  
  
-- -- Invalid input: Phone number too long  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (25, 'LongPhone', '404 Willow St', '123456789012345678901', 'long@phone.com', '09:00-17:00'),  
-- (26, 'LongPhoneTwo', '405 Willow St', '987654321098765432101', 'long2@phone.com', '10:00-18:00'),  
-- (27, 'LongPhoneThree', '406 Willow St', '111222333444555666777', 'long3@phone.com', '11:00-19:00');  
-- -- Expected result: All rows should fail due to phone number length constraint.  
-- -- PASS  
  
-- -- Invalid input: Email without '@' 
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (28, 'NoAtEmail', '505 Aspen St', '4445556666', 'noatsymbol.com', '09:00-17:00'),  
-- (29, 'NoAtEmailTwo', '506 Aspen St', '5556667777', 'noat@symbolcom', '10:00-18:00'),  
-- (30, 'NoAtEmailThree', '507 Aspen St', '6667778888', 'noatsymbolcom', '11:00-19:00');  
-- -- Expected result: All rows should fail due to email format constraint.  
-- -- PASS 
  
-- -- Invalid input: Email without '.'  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (31, 'NoDotEmail', '606 Walnut St', '5556667777', 'nodot@com', '09:00-17:00'),  
-- (32, 'NoDotEmailTwo', '607 Walnut St', '6667778888', 'nodot@comcom', '10:00-18:00'),  
-- (33, 'NoDotEmailThree', '608 Walnut St', '7778889999', 'nodot@domain', '11:00-19:00');  
-- -- Expected result: All rows should fail due to email format constraint.  
-- -- PASS  
  
-- -- Invalid input: Opening hours too short  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (34, 'ShortHours', '707 Chestnut St', '6667778888', 'shorthours@time.com', '9-5'),  
-- (35, 'ShortHoursTwo', '708 Chestnut St', '7778889999', 'shorthours2@time.com', '8-4'),  
-- (36, 'ShortHoursThree', '709 Chestnut St', '8889990000', 'shorthours3@time.com', '10-6');  
-- -- Expected result: All rows should fail due to opening hours format constraint.  
-- -- PASS  
  
-- -- Invalid input: Opening hours too long  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (37, 'LongHours', '808 Poplar St', '7778889999', 'longhours@time.com', '09:00-17:00-01'),  
-- (38, 'LongHoursTwo', '809 Poplar St', '8889990000', 'longhours2@time.com', '08:00-16:00-02'),  
-- (39, 'LongHoursThree', '810 Poplar St', '9990001111', 'longhours3@time.com', '07:00-15:00-03');  
-- -- Expected result: All rows should fail due to opening hours format constraint.  
-- -- PASS  
  
-- Special characters in name  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(40, 'Special!@#', '909 Beech St', '8889990000', 'special@chars.com', '09:00-17:00'),  
(41, 'Special$%^', '910 Beech St', '9990001111', 'special2@chars.com', '10:00-18:00'),  
(42, 'Special&*()', '911 Beech St', '0001112222', 'special3@chars.com', '11:00-19:00');  
-- Expected result: All rows should be inserted successfully if special characters are allowed.  
-- PASS 
  
-- Unicode in name  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(43, 'ユニコード', '1010 Cherry St', '9990001111', 'unicode@chars.com', '09:00-17:00'),  
(44, '编码', '1011 Cherry St', '0001112222', 'unicode2@chars.com', '10:00-18:00'),  
(45, 'Кодировка', '1012 Cherry St', '1112223333', 'unicode3@chars.com', '11:00-19:00');  
-- Expected result: All rows should be inserted successfully if Unicode is supported.  
-- PASS/FAIL  
  
-- Special characters in email  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(46, 'SpecialEmail', '1111 Maple St', '0001112222', 'special+email@chars.com', '09:00-17:00'),  
(47, 'SpecialEmailTwo', '1112 Maple St', '1112223333', 'special.email@chars.com', '10:00-18:00'),  
(48, 'SpecialEmailThree', '1113 Maple St', '2223334444', 'special-email@chars.com', '11:00-19:00');  
-- Expected result: All rows should be inserted successfully if special characters in emails are allowed.  
-- PASS

-- Valid input  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(49, 'PrimaryTest1', '1212 Cedar St', '9991112222', 'primary@test.com', '09:00-17:00');  
-- Expected result: Row should be inserted successfully.  
-- PASS  
  
-- -- Duplicate PRIMARY KEY  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (49, 'PrimaryTestDuplicate', '1213 Cedar St', '8881112222', 'duplicate@test.com', '10:00-18:00');  
-- -- Expected result: Row should fail to insert due to duplicate primary key (location_id = 49).  
-- -- PASS 
  
-- Another valid input after failure  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(50, 'PrimaryTest2', '1214 Cedar St', '7771112222', 'primary2@test.com', '08:00-16:00');  
-- Expected result: Row should be inserted successfully because location_id is unique.  
-- PASS  
  
-- -- Attempt to insert multiple rows with the same PRIMARY KEY  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (51, 'PrimaryTest3', '1215 Cedar St', '6661112222', 'primary3@test.com', '07:00-15:00'),  
-- (51, 'PrimaryTest4', '1216 Cedar St', '5551112222', 'primary4@test.com', '06:00-14:00');  
-- -- Expected result: Both rows should fail due to duplicate primary key (location_id = 51).  
-- -- PASS 
  
-- Valid input after previous duplicate attempt  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(52, 'PrimaryTest5', '1217 Cedar St', '4441112222', 'primary5@test.com', '05:00-13:00');  
-- Expected result: Row should be inserted successfully because location_id is unique.  
-- PASS  
  
-- Valid input with special characters in name, testing primary key uniqueness  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(53, 'Special&^%Name', '1218 Cedar St', '3331112222', 'special@test.com', '04:00-12:00');  
-- Expected result: Row should be inserted successfully because location_id is unique.  
-- PASS 
  
-- -- Repeated attempt with previous location_id  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (53, 'RepeatName', '1219 Cedar St', '2221112222', 'repeat@test.com', '03:00-11:00');  
-- -- Expected result: Row should fail due to duplicate primary key (location_id = 53).  
-- -- PASS 
  
-- Valid input to verify successful insertion after handling previous errors  
INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
(54, 'FinalTest', '1220 Cedar St', '1111112222', 'final@test.com', '02:00-10:00');  
-- Expected result: Row should be inserted successfully because location_id is unique.  
-- PASS  

-- Attempt with no location_id
INSERT INTO locations (name, address, phone_number, email, opening_hours) VALUES  
('RepeatName', '1219 Cedar St', '2221112222', 'repeat@test.com', '03:00-11:00');  
-- Expected result: Row should be inserted and a unique location_id should be assigned  
-- PASS

-- -- Repeated attempt with previous location_id  
-- INSERT INTO locations (location_id, name, address, phone_number, email, opening_hours) VALUES  
-- (55, 'RepeatName', '1219 Cedar St', '2221112222', 'repeat@test.com', '03:00-11:00');  
-- -- Expected result: Row should fail due to duplicate primary key (location_id = 53).  
-- -- PASS 
