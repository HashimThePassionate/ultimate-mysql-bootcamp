USE sql_blog;

SELECT
    *
FROM
    posts
WHERE
    title LIKE '%react redux%'
    OR body LIKE '%react redux%';

CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

SELECT
    *, MATCH(title, body) AGAINST('react redux')
FROM
    posts
WHERE
    MATCH(title, body) AGAINST('react redux');

SELECT
    *, MATCH(title, body) AGAINST('react redux')
FROM
    posts
WHERE
    MATCH(title, body) AGAINST('react -redux +form' IN BOOLEAN MODE);

SELECT
    *, MATCH(title, body) AGAINST('react redux')
FROM
    posts
WHERE
    MATCH(title, body) AGAINST('"handling a form"' IN BOOLEAN MODE);

-- MATCH must contain all columns in full-text index.
