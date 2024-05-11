CREATE TABLE numeric_types_table (
    decimal_column DECIMAL(9,2),
    dec_column DEC(9,2),
    numeric_column NUMERIC(9,2),
    fixed_column FIXED(9,2),
    float_column FLOAT,
    double_column DOUBLE);

-- Insert values into the table
INSERT INTO numeric_types_table 
    (decimal_column, dec_column, numeric_column, fixed_column, float_column, double_column)
VALUES 
    (1234.56, 1234.56, 1234.56, 1234.56, 1234.56, 1234.56),
    (5678.90, 5678.90, 5678.90, 5678.90, 5678.90, 5678.90);
