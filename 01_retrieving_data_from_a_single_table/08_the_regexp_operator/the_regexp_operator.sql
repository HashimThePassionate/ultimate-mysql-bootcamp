 SELECT *  
 FROM customers 
 WHERE first_name REGEXP 'hr'

  SELECT * 
 FROM customers 
 WHERE first_name REGEXP 't$'

  SELECT *  
 FROM customers 
 WHERE first_name REGEXP '^cl|t$'

  SELECT * 
 FROM customers 
 WHERE first_name REGEXP '[agc]t'

  SELECT *  
 FROM customers 
 WHERE first_name REGEXP '[a-h]t'