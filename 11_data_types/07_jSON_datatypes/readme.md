## 6. Json datatypes:
In MySQL, JSON is a native data type that can store JSON documents. 
It supports all standard JSON operations, including creation, retrieval, and manipulation of JSON data.
```sql
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    properties JSON
);
```

![Jason](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/8f84ca5a-cd14-4b1c-bc7d-80b6d99d362c)



- Method 1
  
 ```sql
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
 ```
#### Output
![Screenshot 2024-05-09 230251](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/60c69aa5-3e44-42b2-9341-9b995af032e3)


- Method 2

```sql
UPDATE products
SET properties = JSON_OBJECT(
'weight',10,
'dimension',JSON_ARRAY(1,2,3),
'manufacturer',JSON_OBJECT('name','Abdullah')
)
WHERE product_id = 2;
```
#### Output
![Screenshot 2024-05-09 230414](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/68f3fa13-1cc5-4975-b43c-2b09ba7c86f3)

- Selection specific property
  
```sql
  SELECT 
product_id,
JSON_EXTRACT(properties,'$.weight')
FROM products
WHERE product_id IN (1,2) ;
```
#### Output
![Screenshot 2024-05-09 230717](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/012bf960-ea38-49f2-8045-75a824e6c52c)

