<<<<<<< HEAD:11_data_types/06_date and time_datatypes.sql

=======
-- Inserting sample data into the table
INSERT INTO example_datetime (event_name, event_date, event_time, event_datetime) VALUES
('Meeting', '2024-05-10', '15:30:00', '2024-05-10 15:30:00'),   -- Inserting a record with date, time, and datetime values
('Conference', '2024-06-15', '09:00:00', '2024-06-15 09:00:00');   -- Another record with date, time, and datetime values

-- Retrieve all data from the table
SELECT * FROM example_datetime;

-- Retrieve specific columns
SELECT id, event_name, event_date FROM example_datetime;

-- Update the date of a specific record
UPDATE example_datetime SET event_date = '2024-07-20' WHERE id = 1;

-- Delete a record from the table
DELETE FROM example_datetime WHERE id = 2;

-- Find events happening after a certain date
SELECT * FROM example_datetime WHERE event_date > '2024-06-01';

-- Calculate the difference in days between two dates
SELECT DATEDIFF('2024-06-15', '2024-05-10') AS days_difference;

>>>>>>> 213b51e59b698c81059e981578f8f21ba8978e9a:11_data_types/06_date and time_datatypes
