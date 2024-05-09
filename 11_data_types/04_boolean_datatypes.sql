<<<<<<< HEAD:11_data_types/04_boolean_datatypes.sql

=======
-- Inserting sample data into the table
INSERT INTO example_boolean (is_active) VALUES
(TRUE),     -- Inserting a record that is active
(FALSE),    -- Inserting a record that is not active
(TRUE);     -- Inserting another active record

-- Retrieve all data from the table
SELECT * FROM example_boolean;

-- Retrieve specific columns
SELECT id, is_active FROM example_boolean;

-- Update the status of a specific record
UPDATE example_boolean SET is_active = FALSE WHERE id = 1;

-- Delete a record from the table
DELETE FROM example_boolean WHERE id = 2;

-- Count the number of active records
SELECT COUNT(*) AS active_count FROM example_boolean WHERE is_active = TRUE;

-- Check if there are any inactive records
SELECT CASE WHEN EXISTS (SELECT * FROM example_boolean WHERE is_active = FALSE) THEN 'Inactive records exist' ELSE 'No inactive records' END AS status;

>>>>>>> 213b51e59b698c81059e981578f8f21ba8978e9a:11_data_types/04_boolean_datatypes
