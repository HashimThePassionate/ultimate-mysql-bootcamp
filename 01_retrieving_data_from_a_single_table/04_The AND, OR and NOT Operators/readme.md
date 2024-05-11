## The AND, OR, and NOT Operators 

**Introduction**
- The `AND Operator` is a logical operator in SQL used to combine multiple conditions in a WHERE clause.
- It allows you to specify that all conditions must be true for a row to be included in the result set.

## Syntax

```sql
 SELECT *  
 FROM customers 
 WHERE birth_date < '2023-08-07' AND points > 1500;
 ```
- `Condition1` and `Condition2`:Both Conditions must be true for a row to be included in the result set.
- We use `AND operator` it will return true if both condition meets true.

**Introduction**
- The `OR operator` is a logical operator in SQL used to combine multiple conditions in a WHERE clause.
- It allows you to specify that at least one of the conditions must be true for a row to be included in the result set.

## Syntax

 ```sql
 SELECT *  
 FROM customers 
 WHERE phone > '719-724-7869' OR birth_date > '2023-08-07' ;
```
- `Condition1` and `Condition2`: Conditions of which at least one must be true for a row to be included in the result set.
- We use `OR Operator` it will return true if at least one condition meets true.

## Introduction

- The `NOT operator` is a logical operator in SQL used to negate a condition in a WHERE clause.
-  It allows you to specify that a condition must not be true for a row to be included in the result set.

## Syntax

 ```sql
 SELECT *  
 FROM customers 
 WHERE NOT(birth_date > '2023-08-07' OR points > 900);
 ```
- `Condition`: The condition that must not be true for a row to be included in the result set.
- We use `NOT operator` to reverse.

## How to Filter Records Using Multiple Operators

 ```sql
 SELECT * 
 FROM customers 
 WHERE birth_date > '2023-08-07' OR (points > 1500 AND city = 'Chicago');
 ```
- We use OR and AND both to add multiple conditions.
