## Creating A User
To create a user in MySQL, you can use the CREATE USER statement. Here's a basic example of how to 
```sql
    CREATE USER 'hashim'@'localhost' IDENTIFIED BY '*******';
```

This command creates a user with the username 'username' and password 'password', and allows connections only from the local machine ('localhost'). If you want to allow connections for specific

```sql
    CREATE USER hashim@codewithhashim.com IDENTIFIED BY '*********************';
```

for subdomain
```sql
    CREATE USER hashim@'%codewithhashim.com' IDENTIFIED BY '*********************';
```

For simplicity we can sue
```sql
    CREATE USER hashim IDENTIFIED BY '*******';
```