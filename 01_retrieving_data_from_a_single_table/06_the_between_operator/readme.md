## The BETWEEN Operator

**Introduction**
- The `BETWEEN Operator` is a logical operator in SQL used to specify a range of values in a WHERE clause.
- It allows you to filter rows based on a specified range of values, inclusively.

## Syntax

```sql 
SELECT * 
FROM customers 
WHERE points BETWEEN 1000 AND 1500;
```
- `points`: The column to be compared with the range of values.
- `value1` AND `value2`: The lower and upper bounds of the range, respectively.
  
- We use `BETWEEN Operator`, note that we can also use >= <= operators but BETWEEN is shorter.

## Additional Notes
- The `BETWEEN Operator` includes both the lower and upper bounds of the range. 
- The values specified in the `BETWEEN Operator` can be numeric, string, or date values, depending on the data type of the column being 
  compared.


