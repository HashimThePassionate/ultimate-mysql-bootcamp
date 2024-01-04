ALTER TABLE `sql_store`.`products` 
ADD COLUMN `properties` JSON NULL AFTER `size`;

UPDATE
    products
SET
    properties = '
{
    "dimensions": [1, 3, 3],
    "weight": 10,
    "manufacturer": { "name": "sony"}
}
'
WHERE
    product_id = 1;

-- equals the above
UPDATE
    products
SET
    properties = JSON_OBJECT(
    'weight', 10,
    'dimensions', JSON_ARRAY(1, 2, 3),
    'manufacturer', JSON_OBJECT('name', 'sony')
)
WHERE
    product_id = 1;

-- extract json objects
SELECT
    product_id,
    JSON_EXTRACT(properties, '$.weight') AS weight,
    properties -> '$.weight',
    properties -> '$.dimensions[0]',
    properties -> '$.manufacturer.name',
    properties ->> '$.manufacturer.name'
FROM
    products
WHERE
    product_id = 1
    AND properties ->> '$.manufacturer.name' = 'sony';

-- set json object
UPDATE
    products
SET
    properties = JSON_SET(
    properties,
    '$.weight', 20,
    '$.age', 10
)
WHERE
    product_id = 1;

-- remove json object
UPDATE
    products
SET
    properties = JSON_REMOVE(
    properties,
    '$.age'
)
WHERE
    product_id = 1;

