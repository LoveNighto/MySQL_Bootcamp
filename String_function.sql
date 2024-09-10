SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

show tables;

SELECT 
    *
FROM
    books;

SELECT 
    REPLACE(title, ' ', '->')
FROM
    books;

SELECT 
    UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps'
FROM
    books;

SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;

SELECT 
    CONCAT(title,
            ' was released in ',
            released_year) AS 'blurb'
FROM
    books;

SELECT 
    title, CHAR_LENGTH(title) AS 'character count'
FROM
    books;

SELECT 
    INSERT(title, 11, 99, '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS 'author',
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books
WHERE
    released_year = 2001;
