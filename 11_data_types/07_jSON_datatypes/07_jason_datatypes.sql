CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    properties JSON
);

---Method 1

UPDATE products
SET properties = 
'
{
   "dimension" : [1,2,3],
   "weight" : 10,
   "manufacturer":{
   "name":"Ahmed"
   }
}
'
WHERE product_id = 1 ;
---Method 2

UPDATE products
SET properties = JSON_OBJECT(
'weight',10,
'dimension',JSON_ARRAY(1,2,3),
'manufacturer',JSON_OBJECT('name','Abdullah')
)
WHERE product_id = 2;

--- Selection 
  SELECT 
product_id,
JSON_EXTRACT(properties,'$.weight')
FROM products
WHERE product_id IN (1,2) ;

