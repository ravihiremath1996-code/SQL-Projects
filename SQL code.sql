SELECT * FROM public.retail_sales
SELECT COUNT (*) FROM retail_sales

SELECT * FROM retail_sales 
WHERE transaction_id IS NULL

SELECT * FROM retail_sales 
WHERE sale_date IS NULL

SELECT * FROM retail_sales 
WHERE sale_time IS NULL

SELECT * FROM retail_sales 
WHERE customer_id IS NULL

SELECT * FROM retail_sales
WHERE 
	transaction_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;
-- Data exploration

-- How many sales we have
SELECT COUNT(*) as total_sale FROM retail_sales

--How many customers we have
SELECT COUNT(customer_id) as total_sale FROM retail_sales

--How many unique customers we have
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales

-- How many unique category we have
SELECT COUNT(DISTINCT category) as total_sale FROM retail_sales

-- Name of the different categories
SELECT DISTINCT category FROM retail_sales 

-- Data analysis & Business Key Problems & answers
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' 
SELECT * FROM retail_sales
WHERE total_sale > 1000

SELECT 
	category,
	gender,
	count(*) as total_trans
	FROM retail_sales
GROUP BY category, gender

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

SELECT 
     EXTRACT(YEAR FROM sale_date) as year,
	 EXTRACT(MONTH FROM sale_date) as month,
	 SUM(total_sale) as total_sale
FROM retail_sales
GROUP BY 1, 2;

-- Write a SQL query to find the number of unique customers wh purchased items from each category.

SELECT 
     customer_id, 
	 SUM(total sale) as total_sales
	 FROM retail_sales
	 GROUP BY 1
	 ORDER BY 2 DESC
LIMIT 5

-- Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT category,
      COUNT(DISTINCT customer_id),
	  FROM retail_sales
      GROUP BY category

GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

CREATE DATABASE temp1;
DROP DATABASE temp1;

CREATE DATABASE IF NOT EXISTS temp1;

CREATE TABLE students (
rollno INT PRIMARY KEY,
nam VARCHAR (50)
);

SELECT * FROM students;

INSERT INTO students
VALUES
(102, 'samesh');

INSERT INTO students
VALUES
(101, 'suvesh');

INSERT INTO students
VALUES
(103, 'javesh'),
(104, 'daresh');

-- Primary key: It is a column (or set of columns) in a table that uniquely identifies each row. ( a unique id)
--ther is only one PK & it should NOT be null.

-- Foreign Key: A foreign key is a column (or set of columns) in a table that refers to the primary key in another table.
-- There can be multiple FKs.
-- FKs can have multiple & null values.

CREATE TABLE city(
id INT PRIMARY KEY,
city_name VARCHAR (50)
);

SELECT * FROM city;

INSERT INTO city
VALUES
(1, 'Pune'),
(2, 'Mumbai'),
(3, 'Delhi');

--SQL constraints are used to specify rules for data in a table.
-- NOT NULL: columns cannot have a null value -- Col1 int NOT NULL
-- UNIQUE: All values in column are different -- Col2 int UNIQUE
-- PRIMARY KEY: makes a column unique & not null but used only for one

CREATE TABLE temp (
id int not null,
PRIMARY KEY (id)
);

SELECT * FROM temp;

-- FOREIGN KEY: Prevent actions that would break the link between tables,
-- CHECK it can limit the values allowed in acolumn;

CREATE TABLE city (
id INT PRIMARY KEY,
city VARCHAR (50),
age INT,
CONSTRAINT age_check CHECK (age >= 18 AND city = 'Delhi')
);

SELECT * FROM city;

INSERT INTO city
VALUES
(1, 'Delhi', 19);

INSERT INTO city
VALUES
(4, 'Delhi', 30),
(3, 'Delhi', 29);

DROP TABLE city;

CREATE TABLE newTab (
age INT CHECK (age >= 18)
);

SELECT * FROM newTab;

INSERT INTO newTab (
VALUES
(20)
);

CREATE DATABASE collage;

CREATE TABLE student1 (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student1 (
VALUES
(101, 'anil', 78, 'C', 'Pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Mumbai'),
(104, 'dhruv', 96, 'A', 'Delhi'),
(105, 'emanuel', 12, 'P', 'Delhi'),
(106, 'farah', 82, 'B', 'Delhi')
);

SELECT rollno, name FROM student1;
SELECT * FROM student1;

-- WHERE Clause, Select all columns where marks are greater than
SELECT * FROM student1 WHERE marks > 80;

SELECT * FROM student1 WHERE city = 'Mumbai';
SELECT * FROM student1 WHERE marks = 96;

--Operators: AND (to check for both conditions to be true)
-- AND (to check for both conditions to be true)
SELECT * FROM student1 WHERE marks > 80 AND city = 'Mumbai';
-- OR (to check for one of the conditions to be true)
SELECT * FROM student1 WHERE marks > 90 OR city = 'Mumbai';
-- Between (selects for a given range)
SELECT * FROM student1 WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student1 WHERE rollno BETWEEN 101 AND 106;
-- In (matches any value in the list)
SELECT * FROM student1 WHERE city IN ('Delhi', 'Mumbai');
SELECT * FROM student1 WHERE grade IN ('A', 'B', 'P');
-- NOT (to negate the given condition)
SELECT * FROM student1 WHERE city NOT IN ('Delhi', 'Mumbai');
-- LIMIT, Sets an upper limit on number of (tuples) rows to be returned
SELECT * FROM student1 LIMIT 3;
SELECT rollno, name FROM student1 LIMIT 4;
SELECT rollno, name, marks, grade FROM student1 LIMIT 3;
SELECT rollno, city FROM student1 LIMIT 3;
-- Order By Clause; To sort in ascending (ASC), or descending orders (DESC)
SELECT * FROM student1 ORDER BY city ASC;
SELECT * FROM student1 ORDER BY grade DESC;
SELECT name, rollno FROM student1 ORDER BY marks ASC;
SELECT rollno, name FROM student1 ORDER BY city DESC;
-- Aggregate functions; performs a calculation on a set of values, and return a single value.
-- COUNT(), MAX(), MIN(), SUM(), AVG()
SELECT max(marks) FROM student1;
SELECT avg(marks) FROM student1;
SELECT COUNT(rollno) FROM student1;
SELECT sum(marks) FROM student1;
-- Group By Clause; Groups rows that have the same values into summary rows.
-- It collects data from multiple records and groups the result by one or more column.
--* Generally we use group by with some aggregation function.
--count number of students in each city
SELECT city, count(name) FROM student1 GROUP BY city;
--count number of students wrt grade
SELECT grade, count(rollno) FROM student1 GROUP BY grade;
--Having Clause, similar to where i.e. appllies some conditions on rows.
--Used when we want to apply any condition after grouping.
--Count number of students in each city where max marks cross 90.
SELECT count(name), city FROM student1 GROUP BY city HAVING max(marks) > 90;
SELECT grade, count(rollno) FROM student1 GROUP BY grade HAVING avg(marks) > 60;
-- General Order
-- SELECT column(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column(s)
-- HAVING condition
-- ORDER BY column(s) ASC;






