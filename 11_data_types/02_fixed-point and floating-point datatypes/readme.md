## 3. Fixed point and Floating datatypes:

- DECIMAL(p,s) precision,scale --> DECIMAL(9,2) => 1234567.89
- DEC, NUMERIC, FIXED are exactly same as decimal
- FLOAT 4bytes, 8bytes, DOUBLE -- used for scientific calculation and are approximately values.




```sql 
CREATE TABLE numeric_types_table (
    decimal_column DECIMAL(9,2),
    dec_column DEC(9,2),
    numeric_column NUMERIC(9,2),
    fixed_column FIXED(9,2),
    float_column FLOAT,
    double_column DOUBLE);
```


