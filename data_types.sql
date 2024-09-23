CREATE TABLE inventory(
item_name VARCHAR(159),
price DECIMAL(9,2),
quantity int
);

SELECT CURTIME();

SELECT CURDATE();

SELECT dayofweek(CURDATE());

SELECT NOW(), date_format(NOW(), '%m/%d/%Y') AS with_formating;

SELECT 
    NOW(),
    DATE_FORMAT(NOW(), '%M %D at %H:%i') AS with_formating;

CREATE TABLE tweets(
	content VARCHAR(180),
    username VARCHAR(100),
    created_at TIMESTAMP default NOW()
);
