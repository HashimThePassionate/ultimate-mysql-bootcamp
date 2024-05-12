 SELECT *  
 FROM customers 
 WHERE birth_date > '2023-08-07' AND points > 1500;

 SELECT *  
 FROM customers 
 WHERE birth_date > '2023-08-07' OR points > 1500;

  SELECT *  
 FROM customers 
 WHERE NOT(birth_date > '2023-08-07' OR points > 1500);

  SELECT * 
 FROM customers 
 WHERE birth_date > '2023-08-07' OR (points > 1500 AND city = 'Chicago');