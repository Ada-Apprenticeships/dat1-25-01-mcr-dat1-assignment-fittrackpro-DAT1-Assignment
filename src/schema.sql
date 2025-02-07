-- FitTrack Pro Database Schema

-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- DROP TABLE IF EXISTS locations;
-- DROP TABLE IF EXISTS members;
-- DROP TABLE IF EXISTS staff;
-- DROP TABLE IF EXISTS equipment;
-- DROP TABLE IF EXISTS classes;
-- DROP TABLE IF EXISTS class_schedule;
-- DROP TABLE IF EXISTS memberships;
-- DROP TABLE IF EXISTS attendance;
-- DROP TABLE IF EXISTS class_attendance;
-- DROP TABLE IF EXISTS payments;
-- DROP TABLE IF EXISTS personal_training_sessions;
-- DROP TABLE IF EXISTS member_health_metrics;
-- DROP TABLE IF EXISTS equipment_maintenance_log;

-- Create your tables here
-- Example:
-- CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype,
--     ...
-- );

-- CREATE TABLE locations (
--     location_id INTEGER PRIMARY KEY, -- Do not need to specify auto increment in sqlite, as i would in other SQL
--     name VARCHAR CHECK(LENGTH(name) BETWEEN 1 and 20), -- Changed to check constraint instead of specifying no. chars, as this is not supported in sqlite
--     address VARCHAR,
--     phone_number VARCHAR CHECK(LENGTH(phone_number) BETWEEN 8 and 20), 
--     email VARCHAR(50) CHECK(email LIKE '%@%\.%' ESCAPE '\'),
--     opening_hours VARCHAR CHECK(LENGTH(opening_hours) BETWEEN 9 and 11) -- 'x:xx-x:xx' up to 'xx:xx-xx:xx'
-- );

-- CREATE TABLE members (
--     member_id INTEGER PRIMARY KEY,
--     first_name VARCHAR CHECK(LENGTH(first_name) BETWEEN 1 and 20),
--     last_name VARCHAR CHECK(LENGTH(last_name) BETWEEN 1 and 20),
--     email VARCHAR(50) CHECK(email LIKE '%@%\.%' ESCAPE '\'),
--     phone_number VARCHAR CHECK(LENGTH(phone_number) BETWEEN 8 and 20),
--     date_of_birth DATE, -- NEEDS CHECK CONSTRAINT
--     join_date DATE, -- NEEDS CHECK CONSTRAINT
--     emergency_contact_name VARCHAR CHECK(LENGTH(emergency_contact_name) BETWEEN 2 and 40),
--     emergency_contact_phone VARCHAR CHECK(LENGTH(emergency_contact_phone) BETWEEN 8 and 20)
-- );

-- CREATE TABLE staff (
--     staff_id INTEGER PRIMARY KEY,
--     first_name VARCHAR CHECK(LENGTH(first_name) BETWEEN 1 and 20),
--     last_name VARCHAR CHECK(LENGTH(last_name) BETWEEN 1 and 20),
--     email VARCHAR(50) CHECK(email LIKE '%@%\.%' ESCAPE '\'),
--     phone_number VARCHAR CHECK(LENGTH(phone_number) BETWEEN 8 and 20),
--     position VARCHAR CHECK(position IN ('Trainer', 'Manager', 'Receptionist', 'Maintenance')),
--     hire_date DATE, --NEEDS CHECK CONSTRAINT
--     location_id INTEGER,
--     FOREIGN KEY (location_id) REFERENCES locations(location_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL
-- );

-- CREATE TABLE equipment (
--     equipment_id INTEGER PRIMARY KEY,
--     name VARCHAR CHECK(LENGTH(name) BETWEEN 1 and 30),
--     type VARCHAR CHECK(type IN ('Cardio','Strength')),
--     purchase_date DATE CHECK(purchase_date < last_maintenance_date),
--     last_maintenance_date DATE CHECK(last_maintenance_date BETWEEN purchase_date and next_maintenance_date),
--     next_maintenance_date DATE CHECK(next_maintenance_date > last_maintenance_date),
--     location_id INTEGER,
--     FOREIGN KEY (location_id) REFERENCES locations(location_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL
-- );

--  CREATE TABLE classes (
--     class_id INTEGER PRIMARY KEY,
--     name VARCHAR CHECK(LENGTH(name) BETWEEN 1 and 30),
--     description TEXT,
--     purchase_date DATE,
--     capacity INTEGER CHECK(capacity >= 0),
--     duration INTEGER CHECK(duration > 0),
--     location_id INTEGER,
--     FOREIGN KEY (location_id) REFERENCES locations(location_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL
-- );

-- CREATE TABLE class_schedule(
--     schedule_id INTEGER PRIMARY KEY,
--     class_id INTEGER,
--     staff_id INTEGER,
--     start_time VARCHAR CHECK(start_time LIKE '%-%-% %:%:%'), --match pattern 'YYYY-MM-DD HH:MM:SS'
--     end_time VARCHAR CHECK(end_time LIKE '%-%-% %:%:%'),
--     FOREIGN KEY (class_id) REFERENCES classes(class_id)
--         ON UPDATE CASCADE
--         ON DELETE CASCADE, -- IF class removed then remove from schedule
--     FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL -- if staff record deleted, keep class in schedule

-- );

-- CREATE TABLE memberships (
--     membership_id INTEGER PRIMARY KEY,
--     member_id INTEGER,
--     type VARCHAR CHECK(type IN ('Premium', 'Basic')),
--     start_date DATE CHECK(start_date < end_date),
--     end_date DATE CHECK (end_date > start_date),
--     status VARCHAR CHECK(status IN ('Active', 'Inactive')),
--     FOREIGN KEY (member_id) REFERENCES members(member_id)
--         ON UPDATE CASCADE
--         ON DELETE CASCADE -- if no member then no membership
-- );

-- CREATE TABLE attendance(
--     attendance_id INTEGER PRIMARY KEY,
--     member_id INTEGER,
--     location_id INTEGER,
--     check_in_time VARCHAR CHECK(check_in_time LIKE '%-%-% %:%:%'),
--     check_out_time VARCHAR CHECK(check_out_time LIKE '%-%-% %:%:%'),
--     FOREIGN KEY (member_id) REFERENCES members(member_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL -- want to retain records for analytics purposes in future
-- );

-- CREATE TABLE class_attendance(
--     class_attendance_id INTEGER PRIMARY KEY,
--     schedule_id INTEGER,
--     member_id INTEGER,
--     attendance_status VARCHAR CHECK(attendance_status IN ('Registered', 'Attended', 'Unattended')),
--     FOREIGN KEY (schedule_id) REFERENCES class_schedule(schedule_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL, -- in case needed in future for analytics purposes
--     FOREIGN KEY (member_id) REFERENCES members(member_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL -- in case needed in future for analytics purposes
-- );

-- CREATE TABLE payments(
--     payment_id INTEGER PRIMARY KEY,
--     member_id INTEGER, 
--     amount REAL NOT NULL CHECK (amount BETWEEN 0 AND 1000 AND (CAST(amount * 100 AS INTEGER) = amount * 100)),     
--     payment_date DATE VARCHAR CHECK(payment_date LIKE '%-%-% %:%:%'),
--     payment_method VARCHAR CHECK(payment_method IN ('Credit Card', 'Bank Transfer', 'PayPal', 'Cash')),
--     payment_type VARCHAR CHECK(payment_type IN ('Monthly membership fee', 'Day pass')),
--     FOREIGN KEY (member_id) REFERENCES members(member_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL   -- keep for accounting/analytics pruposes
-- );

-- CREATE TABLE personal_training_sessions(
--     session_id INTEGER PRIMARY KEY,
--     member_id INTEGER,
--     staff_id INTEGER,
--     session_date DATE,
--     start_time VARCHAR
--         CHECK (start_time GLOB '[0-9][0-9]:[0-9][0-9]:[0-9][0-9]' AND  
--         CAST(SUBSTR(start_time, 1, 2) AS INTEGER) BETWEEN 0 AND 23 AND  
--         CAST(SUBSTR(start_time, 4, 2) AS INTEGER) BETWEEN 0 AND 59 AND  
--         CAST(SUBSTR(start_time, 7, 2) AS INTEGER) BETWEEN 0 AND 59),
--         -- Ensure the format is correct  
--     end_time VARCHAR
--         CHECK (end_time GLOB '[0-9][0-9]:[0-9][0-9]:[0-9][0-9]' AND  
--         CAST(SUBSTR(end_time, 1, 2) AS INTEGER) BETWEEN 0 AND 23 AND  
--         CAST(SUBSTR(end_time, 4, 2) AS INTEGER) BETWEEN 0 AND 59 AND  
--         CAST(SUBSTR(end_time, 7, 2) AS INTEGER) BETWEEN 0 AND 59),
--     notes TEXT,
--     FOREIGN KEY (member_id) REFERENCES members(member_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL,
--     FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL
    
    
--        /*left both foreign keys as "ON DELETE SET NULL" so that
--     either member data or staff data can be tracked in future
--     regardless of if people leave*/
-- );

-- CREATE TABLE member_health_metrics(
--     metric_id INTEGER PRIMARY KEY,
--     member_id INTEGER,
--     measurement_date DATE,
--     weight VARCHAR
--         CHECK (weight GLOB '[0-9][0-9].[0-9]' AND  
--         CAST(SUBSTR(weight, 1, 2) AS INTEGER) BETWEEN 0 AND 99 AND  
--         CAST(SUBSTR(weight, 4, 1) AS INTEGER) BETWEEN 0 AND 9),
--     body_fat_percentage VARCHAR
--         CHECK (body_fat_percentage GLOB '[0-9][0-9].[0-9]' AND  
--         CAST(SUBSTR(body_fat_percentage, 1, 2) AS INTEGER) BETWEEN 0 AND 99 AND  
--         CAST(SUBSTR(body_fat_percentage, 4, 1) AS INTEGER) BETWEEN 0 AND 9),
--     muscle_mass VARCHAR
--         CHECK (muscle_mass GLOB '[0-9][0-9].[0-9]' AND  
--         CAST(SUBSTR(muscle_mass, 1, 2) AS INTEGER) BETWEEN 0 AND 99 AND  
--         CAST(SUBSTR(muscle_mass, 4, 1) AS INTEGER) BETWEEN 0 AND 9),
--     bmi VARCHAR
--         CHECK (bmi GLOB '[0-9][0-9].[0-9]' AND  
--         CAST(SUBSTR(bmi, 1, 2) AS INTEGER) BETWEEN 0 AND 99 AND  
--         CAST(SUBSTR(bmi, 4, 1) AS INTEGER) BETWEEN 0 AND 9),
--     FOREIGN KEY (member_id) REFERENCES members(member_id)
--         ON UPDATE CASCADE
--         ON DELETE CASCADE
-- );

-- CREATE TABLE equipment_maintenance_log(
--     log_id INTEGER PRIMARY KEY,
--     equipment_id INTEGER,
--     maintenance_date DATE,
--     description TEXT,
--     staff_id INTEGER,
--     FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
--         ON UPDATE CASCADE
--         ON DELETE CASCADE, -- if equipment no ,longer exists, no need for maintenance info
--     FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
--         ON UPDATE CASCADE
--         ON DELETE SET NULL -- Equipment may outlive staff within the org
-- );

-- TODO: Create the following tables:
-- 1. locations
-- 2. members
-- 3. staff
-- 4. equipment
-- 5. classes
-- 6. class_schedule
-- 7. memberships
-- 8. attendance
-- 9. class_attendance
-- 10. payments
-- 11. personal_training_sessions
-- 12. member_health_metrics
-- 13. equipment_maintenance_log

-- After creating the tables, you can import the sample data using:
-- `.read data/sample_data.sql` in a sql file or `npm run import` in the terminal