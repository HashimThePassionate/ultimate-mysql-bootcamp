## How to select those points >= 1000 and <= 1500

 - We use BETWEEN operator, note we can also use >= <= operators but BETWEEN is shorter.

```sql 
SELECT * 
FROM customers 
WHERE points BETWEEN 1000 AND 1500;
```
