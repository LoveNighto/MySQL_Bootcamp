SELECT 
    COUNT(*)
FROM
    books;

SELECT 
    released_year, COUNT(*) AS How_many
FROM
    books
GROUP BY released_year;

SELECT 
    SUM(stock_quantity)
FROM
    books;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    AVG(released_year)
FROM
    books
GROUP BY author;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);

SELECT 
    released_year AS year, COUNT(*) AS '# books', AVG(pages)
FROM
    books
GROUP BY released_year
ORDER BY released_year;
