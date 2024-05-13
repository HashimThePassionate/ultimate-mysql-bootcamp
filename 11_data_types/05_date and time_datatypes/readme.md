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

