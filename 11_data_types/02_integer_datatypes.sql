
-- Inserting sample data into the table
INSERT INTO example_integers (age, score, quantity) VALUES
(25, 85, 100),     -- Inserting values for a TINYINT, INT, and BIGINT respectively
(30, 90, 200),
(40, 95, 300);

-- Retrieve all data from the table
SELECT * FROM example_integers;

-- Retrieve specific columns
SELECT id, age, score FROM example_integers;

-- Update the age of a specific record
UPDATE example_integers SET age = 35 WHERE id = 1;

-- Delete a record from the table
DELETE FROM example_integers WHERE id = 2;

-- Calculate the sum of scores
SELECT SUM(score) AS total_score FROM example_integers;

-- Find the maximum age
SELECT MAX(age) AS max_age FROM example_integers;




