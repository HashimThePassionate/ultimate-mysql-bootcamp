##  Lets Create A New User And Grant privileges:
```sql
    CREATE USER farooq IDENTIFIED BY '******'
    GRANT SELECT, INSERT 
    ON sql_store.*
    To farooq
```
-   **CREATE USER**: This statement creates a new user named 'farooq' in the MySQL server.
-   **farooq**: Specifies the username for the new user.
-   **IDENTIFIED BY '****':** Sets the password for the new user. Replace '******' with the desired password.
-   **GRANT SELECT, INSERT**: This grants the SELECT and INSERT privileges to the user.
-   ***ON sql_store.***: Specifies the database and table(s) on which the privileges are granted. In this case, it grants privileges on all tables within the sql_store database.
-   **TO farooq**: Assigns the privileges to the 'farooq' user.

For Admin
```sql
    GRANT ALL ON *.*
    TO farooq
```
-   **GRANT ALL**: This grants all privileges on all databases and tables.
-   **ON .**: Specifies that privileges are granted on all databases and tables.
-   **TO farooq**: Assigns all privileges to the 'farooq' user.
*   These SQL statements create a new user named 'farooq' with specified privileges.
*   The first grant statement assigns SELECT and INSERT privileges on all tables within the sql_store database to the user 'farooq'.
*   The second grant statement grants all privileges on all databases and tables to the user 'farooq', essentially making them an admin user.