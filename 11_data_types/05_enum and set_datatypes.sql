<<<<<<< HEAD:11_data_types/05_enum and set_datatypes.sql

=======
ALTER TABLE sql_store.products
ADD COLUMN size ENUM('small', 'medium', 'large') NULL AFTER unit_price;

-- Inserting sample data into the table
INSERT INTO example_enum (status) VALUES
('active'),     -- Inserting a record with 'active' status
('inactive'),   -- Inserting a record with 'inactive' status
('pending');    -- Inserting a record with 'pending' status

-- Retrieve all data from the table
SELECT * FROM example_enum;

-- Retrieve specific columns
SELECT id, status FROM example_enum;

-- Update the status of a specific record
UPDATE example_enum SET status = 'pending' WHERE id = 1;

-- Delete a record from the table
DELETE FROM example_enum WHERE id = 2;

-- Count the number of records with each status
SELECT status, COUNT(*) AS count FROM example_enum GROUP BY status;

-- Check if 'pending' status exists in the table
SELECT IF('pending' IN (SELECT status FROM example_enum), 'Yes', 'No') AS status_exists;

>>>>>>> 213b51e59b698c81059e981578f8f21ba8978e9a:11_data_types/05_enum and set_datatypes
