ALTER TABLE sql_store.products
ADD COLUMN size ENUM('small', 'medium', 'large') NULL AFTER unit_price;
