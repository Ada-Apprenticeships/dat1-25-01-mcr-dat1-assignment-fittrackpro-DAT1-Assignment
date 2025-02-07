    LOCATIONS {
        location_id - PK - VARCHAR(20) -- used 20 as not sure of the length of the id
        name VARCHAR(50)
        address VARCHAR(255)
        phone_number VARCHAR(20)
        email VARCHAR(50) CHECK(email LIKE '%@%')
        opening_hours VARCHAR(30)
    }
    MEMBERS {
        member_id - PK - VARCHAR(20)
        first_name VARCHAR(30)
        last_name VARCHAR(30)
        email VARCHAR(50) CHECK(email LIKE '%@%') 
        phone_number VARCHAR(20)
        date_of_birth DATE CHECK(date_of_birth < CURRENT_DATE) -- Cannot be born in the future
        join_date DATE CHECK(date_of_birth <= CURRENT_DATE)
        emergency_contact_name VARCHAR(30)
        emergency_contact_phone VARCHAR(30)
    }
    STAFF {
        staff_id - PK - VARCHAR(20)
        first_name VARCHAR(30)
        last_name VARCHAR(30)
        email VARCHAR(50) CHECK(email LIKE '%@%')
        phone_number VARCHAR(20)
        position VARCHAR(20)
        hire_date DATE CHECK(date_of_birth <= CURRENT_DATE)
        location_id VARCHAR(20),
        FOREIGN KEY(location_id) 
            REFERENCES LOCATIONS(location_id) 
            ON UPDATE CASCADE 
            ON DELETE SET NULL -- So that related tuples dont get deleted (I.E if a location 
                                    is closed we still want staff records)
    }
    EQUIPMENT {
        equipment_id - PK - VARCHAR(20)
        name VARCHAR(30)
        type VARCHAR(30)
        purchase_date DATE CHECK(purchase_date < last_maintenance_date)
        last_maintenance_date DATE CHECK(last_maintenance_date > purchase_date)
        next_maintenance_date DATE CHECK (next_maintenance_date > last_maintenance_date)
        location_id VARCHAR(20),
        FOREIGN KEY(location_id) 
            REFERENCES LOCATIONS(location_id) 
            ON UPDATE CASCADE 
            ON DELETE SET NULL -- ensure that the equipment info is not deleted if the location 
                                    is removed(equipment may be moved/handled at a later date)
    }
    CLASSES {
        class_id - PK - VARCHAR(20)
        name VARCHAR(30)
        description TEXT
        capacity INTEGER
        duration DECIMAL(3, 1) -- total 3 digits, to one decimal place
        location_id VARCHAR(20),
        FOREIGN KEY(location_id) 
            REFERENCES LOCATIONS(location_id) 
            ON UPDATE CASCADE 
            ON DELETE SET NULL -- ensure that the class is not removed if the location is 
                                    removed (classes can be ran in a different location)
    }
    CLASS_SCHEDULE {
        schedule_id - PK - VARCHAR(20)
        class_id - PK - VARCHAR(20)
        staff_id - PK - VARCHAR(20)
        start_time DATE CHECK(start_time < end_time)
        end_time CHECK (end_time > start_time),
        FOREIGN KEY(class_id) 
            REFERENCES CLASSES(class_id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE -- if class is deleted then remove from the schedule relation
    }
    MEMBERSHIPS {
        membership_id - PK - VARCHAR(20)
        member_id VARCHAR(20)
        type VARCHAR(20)
        start_date DATE CHECK(start_date < end_date)
        end_date DATE CHECK(end_date > start_date)
        status VARCHAR(20),
        FOREIGN KEY(member_id) 
            REFERENCES MEMBERS(member_id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE
    }
    ATTENDANCE {
        attendance_id VARCHAR(20)
        member_id VARCHAR(20)
        location_id VARCHAR(20)
        check_in_time DATETIME CHECK(check_in_time < check_out_time)
        check_out_time DATETIME CHECK(check_in_time > check_out_time)
        FOREIGN KEY(member_id) 
            REFERENCES MEMBERS(member_id) 
            ON UPDATE CASCADE 
            ON DELETE NULL -- Dont want to delete as this could make future data insights 
                                into attendance inaccurate
        FOREIGN KEY(location_id) 
            REFERENCES LOCATIONS(location_id) 
            ON UPDATE CASCADE 
            ON DELETE NULL -- Dont want to delete as this could make future data insights 
                                into attendance inaccurate
    }
    CLASS_ATTENDANCE {
        class_attendance_id VARCHAR(20)
        schedule_id VARCHAR(20)
        member_id VARCHAR(20)
        attendance_status VARCHAR(20)
        FOREIGN KEY(member_id) 
            REFERENCES MEMBERS(member_id) 
            ON UPDATE CASCADE 
            ON DELETE NULL -- Dont want to delete as this could make future data insights 
                                into attendance inaccurate
    }
    PAYMENTS {
        payment_id VARCHAR(20)
        member_id VARCHAR(20)
        amount DECIMAL CHECK(amount BETWEEN 0.01 and 1000.00)
        payment_date DATE CHECK(payment_date > CURRENT_DATE)
        payment_method VARCHAR(13) CHECK(payment_method IN ('Credit Card','Bank Transfer','PayPal'))
        description
    }
    PERSONAL_TRAINING_SESSIONS {
        session_id
        member_id
        staff_id
        session_date
        start_time
        end_time
        notes
    }
    MEMBER_HEALTH_METRICS {
        metric_id
        member_id
        measurement_date
        weight
        body_fat_percentage
        muscle_mass
        bmi
    }
    EQUIPMENT_MAINTENANCE_LOG {
        log_id
        equipment_id
        maintenance_date
        description
        staff_id
    }