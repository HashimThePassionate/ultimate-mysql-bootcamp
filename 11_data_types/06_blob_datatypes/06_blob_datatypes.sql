CREATE TABLE image_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_data LONGBLOB
);
-- Inserting an image
INSERT INTO image_table (image_data) VALUES (LOAD_FILE('/path/to/image.jpg'));

-- Retrieving an image
SELECT image_data FROM image_table WHERE id = 1;
