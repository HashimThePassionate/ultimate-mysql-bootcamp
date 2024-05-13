## FULL TEXT SEARCH:
A full-text index is a special type of index used in database systems to enable efficient searching of text within large columns of textual data, such as VARCHAR or TEXT columns. Unlike traditional indexes that work well for exact matches or range queries, full-text indexes are optimized for natural language search queries where users might search for words or phrases within a text.
```sql
USE sql_blog;
SELECT * FROM posts;
```
*   Lets look we want to search 'react redux' in post and title field how can we do?
```sql
USE sql_blog;
SELECT * FROM posts
WHERE title LIKE '%react redux%' OR body LIKE '%react redux%';
```
*   Is it works? nope
lets create full text indexes and then search
```sql
CREATE FULLTEXT INDEX idx_title_body ON posts (title,body);
```
Now search react and redux
```sql
SELECT * 
FROM posts 
WHERE MATCH(title,body) AGAINST ('react redux');

SELECT * 
FROM posts 
WHERE MATCH(title,body) AGAINST ('react -redux' IN BOOLEAN MODE);

SELECT * 
FROM posts 
WHERE MATCH(title,body) AGAINST ('react -redux +Form' IN BOOLEAN MODE);

SELECT * 
FROM posts 
WHERE MATCH(title,body) AGAINST ('handling a form, IN BOOLEAN MODE');
```