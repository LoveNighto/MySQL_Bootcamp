show databases;

create database uni;

use uni;

CREATE TABLE customers(
	id INT NOT NULL auto_increment PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50) NOT NULL
);

CREATE TABLE orders(
	id INT NOT NULL auto_increment PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    foreign key(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
INSERT INTO orders(order_date, amount, customer_id)
VALUES	('2026-02-28', 50, 90);
       
SELECT * FROM customers;
    
CREATE TABLE students(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)
);

CREATE TABLE papers(
	title VARCHAR(100),
    grade CHAR(3),
    student_id INT,
    foreign key(student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name,title,grade 
FROM students 
JOIN papers
	ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT first_name,IFNULL(title,'MISSING'),IFNULL(grade,0)
FROM students 
LEFT JOIN papers
	ON students.id = papers.student_id;
    
SELECT first_name, IFNULL(AVG(grade),0) AS average 
FROM students
LEFT JOIN papers
	on students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

SELECT first_name, IFNULL(AVG(grade),0) AS average, 
CASE
	WHEN IFNULL(AVG(grade),0) THEN 'PASSING'
	ELSE 'FAILING'
END AS passing_status
FROM students
LEFT JOIN papers
	on students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;
