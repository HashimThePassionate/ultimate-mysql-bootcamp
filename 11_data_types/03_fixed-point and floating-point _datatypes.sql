<<<<<<< HEAD:11_data_types/03_fixed_point and float_point_datatypes.sql

=======
-- Inserting sample data into the table
INSERT INTO example_fp_float (price, temperature) VALUES
(99.99, 25.50),     -- Inserting values for price and temperature respectively
(49.50, 20.75),
(149.75, 30.00);

-- Retrieve all data from the table
SELECT * FROM example_fp_float;

-- Retrieve specific columns
SELECT id, price FROM example_fp_float;

-- Update the price of a specific record
UPDATE example_fp_float SET price = 129.99 WHERE id = 1;

-- Delete a record from the table
DELETE FROM example_fp_float WHERE id = 2;

-- Calculate the average temperature
SELECT AVG(temperature) AS avg_temperature FROM example_fp_float;

-- Find the maximum price
SELECT MAX(price) AS max_price FROM example_fp_float;


>>>>>>> 213b51e59b698c81059e981578f8f21ba8978e9a:11_data_types/01_string_datatypes
