.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;


-- -- Valid input  
-- INSERT INTO memberships (membership_id, member_id, type, start_date, end_date, status) VALUES  
-- (1, 1, 'Premium', '2023-01-01', '2024-01-01', 'Active'),  
-- (2, 2, 'Basic', '2023-02-01', '2024-02-01', 'Inactive'),  
-- (3, 3, 'Premium', '2023-03-01', '2024-03-01', 'Active');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  
  
-- -- Invalid input: Duplicate PRIMARY KEY  
-- INSERT INTO memberships (membership_id, member_id, type, start_date, end_date, status) VALUES  
-- (1, 4, 'Basic', '2023-04-01', '2024-04-01', 'Inactive'),  
-- (2, 5, 'Premium', '2023-05-01', '2024-05-01', 'Active'),  
-- (3, 6, 'Basic', '2023-06-01', '2024-06-01', 'Inactive');  
-- -- Expected result: All rows should fail due to duplicate primary key.  
-- -- PASS  
  
-- -- Invalid input: Non-existent member_id (Foreign Key Constraint)  
-- INSERT INTO memberships (membership_id, member_id, type, start_date, end_date, status) VALUES  
-- (4, 999, 'Premium', '2023-07-01', '2024-07-01', 'Active'),  
-- (5, 998, 'Basic', '2023-08-01', '2024-08-01', 'Inactive'),  
-- (6, 997, 'Premium', '2023-09-01', '2024-09-01', 'Active');  
-- -- Expected result: All rows should fail due to foreign key constraint violation.  
-- -- PASS  
  
-- -- Invalid input: Incorrect type  
-- INSERT INTO memberships (membership_id, member_id, type, start_date, end_date, status) VALUES  
-- (7, 1, 'Gold', '2023-10-01', '2024-10-01', 'Active'),  
-- (8, 2, 'Silver', '2023-11-01', '2024-11-01', 'Inactive'),  
-- (9, 3, 'Platinum', '2023-12-01', '2024-12-01', 'Active');  
-- -- Expected result: All rows should fail due to type check constraint.  
-- -- PASS  
  
-- -- Invalid input: Incorrect status  
-- INSERT INTO memberships (membership_id, member_id, type, start_date, end_date, status) VALUES  
-- (10, 1, 'Premium', '2023-01-01', '2024-01-01', 'Pending'),  
-- (11, 2, 'Basic', '2023-02-01', '2024-02-01', 'Suspended'),  
-- (12, 3, 'Premium', '2023-03-01', '2024-03-01', 'Expired');  
-- -- Expected result: All rows should fail due to status check constraint.  
-- -- PASS  
  
-- -- Invalid input: start_date >= end_date  
-- INSERT INTO memberships (membership_id, member_id, type, start_date, end_date, status) VALUES  
-- (13, 1, 'Premium', '2024-01-01', '2023-01-01', 'Active'),  
-- (14, 2, 'Basic', '2023-02-01', '2023-02-01', 'Inactive'),  
-- (15, 3, 'Premium', '2024-03-01', '2023-03-01', 'Active');  
-- -- Expected result: All rows should fail due to date logical constraint.  
-- -- PASS  
  
-- -- Valid input to verify successful insertion after handling previous errors  
-- INSERT INTO memberships (membership_id, member_id, type, start_date, end_date, status) VALUES  
-- (16, 1, 'Basic', '2023-04-01', '2024-04-01', 'Inactive'),  
-- (17, 2, 'Premium', '2023-05-01', '2024-05-01', 'Active'),  
-- (18, 3, 'Basic', '2023-06-01', '2024-06-01', 'Inactive');  
-- -- Expected result: All rows should be inserted successfully.  
-- -- PASS  