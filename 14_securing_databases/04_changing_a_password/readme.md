## Changing Password For A User:
```sql
    SET PASSWORD FOR hashim = '*************';
```
### Query Explanation

This query changes the password for the MySQL user account named 'hashim'.

- **SET PASSWORD FOR:** The `SET PASSWORD FOR` statement is used to change the password of a user account.
- **hashim:** Specifies the username of the user account for which the password will be changed.
- **'*************':** Represents the new password for the user account. This should be replaced with the actual desired password.
- **Effect:** Changing the password updates the password hash stored in the MySQL user table for the specified user account.
- **Security:** It's important to ensure that the new password meets security requirements, such as being sufficiently complex and not easily guessable.
- **Authentication:** After changing the password, the user will need to use the new password for authentication when connecting to the MySQL server.

## Changing Password For Current Login User:
```sql
    SET PASSWORD  = '*************';
```
### Query Explanation

This query changes the password for the current user logged into the MySQL server.

- **SET PASSWORD:** The `SET PASSWORD` statement is used to change the password of the current user.
- **= '*************':** Specifies the new password for the current user. Replace `'*************'` with the desired password.
- **Effect:** Changing the password updates the password hash associated with the current user's account in the MySQL user table.
- **Security:** It's crucial to ensure that the new password meets security requirements to enhance system security.
- **Authentication:** After changing the password, the current user will need to use the new password for authentication in subsequent interactions with the MySQL server.

