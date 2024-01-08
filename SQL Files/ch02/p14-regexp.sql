-- Get the customers whose
--    first names are ELKA or AMBUR
SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';

--    last names end with EY OR ON
SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

--    last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';

--    last names contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'B[RU]';
SELECT *
FROM customers
WHERE last_name REGEXP 'BR|BU';

