<<<<<<< HEAD:11_data_types/07_blob_datatypes.sql

=======
-- Inserting sample data into the table
INSERT INTO example_blob (file_name, file_data) VALUES
('example_image.jpg', LOAD_FILE('/path/to/example_image.jpg')),   -- Inserting a BLOB data from a file
('example_document.pdf', LOAD_FILE('/path/to/example_document.pdf'));   -- Another BLOB data from a file

-- Retrieve all data from the table
SELECT * FROM example_blob;

-- Retrieve specific columns
SELECT id, file_name FROM example_blob;

-- Update the file data of a specific record
UPDATE example_blob SET file_data = LOAD_FILE('/path/to/new_image.jpg') WHERE id = 1;

-- Delete a record from the table
DELETE FROM example_blob WHERE id = 2;

>>>>>>> 213b51e59b698c81059e981578f8f21ba8978e9a:11_data_types/07_blob_datatypes

