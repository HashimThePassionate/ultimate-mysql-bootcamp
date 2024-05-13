## 5. Date and Time types datatypes:

- DATE storing date without time component
- Time time for storing time value
- DATETIME 8bytes
- TIMESTAMP 4bytes (0 upto 2038) -- track of a row when inserted to last updated
- YEAR year for storing 4 digit year

  
  
  ```sql
  CREATE TABLE date_time_table (
    date_column DATE,
    time_column TIME,
    datetime_column DATETIME,
    timestamp_column TIMESTAMP,
    year_column YEAR);
  ```

- `date_column`: Used for storing dates without a time component.
- `time_column`: Used for storing time values.
- `datetime_column`: Used for storing date and time together.
- `timestamp_column`: Typically used to track the timestamp of when a row was inserted or last updated.
- `year_column`: Used for storing four-digit year values.

![date and time datatypes](https://github.com/Techwiz-Laraib/ultimate-mysql-bootcamp/assets/159939710/efdc5467-d923-4204-9e57-9b22060c988f)

```sql
USE sql_inventory;
-- Create the table
CREATE TABLE enroll (
    enroll_at TIMESTAMP, -- when we update a record than record time will updated automatically every time  
    admission_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert 20 records with the current timestamp for enroll_at
INSERT INTO enroll (enroll_at) VALUES 
    (NOW()),
    (NOW() - INTERVAL 1 DAY),
    (NOW() - INTERVAL 2 DAY),
    (NOW() - INTERVAL 3 DAY),
    (NOW() - INTERVAL 4 DAY),
    (NOW() - INTERVAL 5 DAY),
    (NOW() - INTERVAL 6 DAY),
    (NOW() - INTERVAL 7 DAY),
    (NOW() - INTERVAL 8 DAY),
    (NOW() - INTERVAL 9 DAY),
    (NOW() - INTERVAL 10 DAY),
    (NOW() - INTERVAL 11 DAY),
    (NOW() - INTERVAL 12 DAY),
    (NOW() - INTERVAL 13 DAY),
    (NOW() - INTERVAL 14 DAY),
    (NOW() - INTERVAL 15 DAY),
    (NOW() - INTERVAL 16 DAY),
    (NOW() - INTERVAL 17 DAY),
    (NOW() - INTERVAL 18 DAY),
    (NOW() - INTERVAL 19 DAY);

```
