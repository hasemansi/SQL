-- RANK AND DENSRANK
-- Both functions are window functions used to assign ranks to rows based on a specific order, such as salary, marks, score, etc.

-- They are mainly used to:

-- Identify top performers (top N salaries, top N students, etc.)

-- Handle ties (rows with equal values)

-- Generate ranking reports per group (e.g., top 3 employees per city)

-- syntax

-- RANK() OVER (PARTITION BY column_name ORDER BY column_name DESC)
-- DENSE_RANK() OVER (PARTITION BY column_name ORDER BY column_name DESC)

USE minskole;
SELECT * FROM employee;
-- 1	Rahul		Sharma	30	60000	Bangalore
-- 2	Sneha	K.	Verma	28	55000	Mumbai
-- 3	Amit		Patel	35	75000	Delhi
-- 4	Neha	R.	Mishra	42	68000	Bangalore
-- 5	Vikas	L.	Gupta	29	62000	Hyderabad
-- 6	Divya		Nair	27	53000	Chennai
-- 7	Rohit	A.	Kumar	33	70000	Pune
-- 8	Priya		Singh	41	64000	Kolkata
-- 9	Ankit	B.	Yadav	34	72000	Bangalore
-- 10	Meera		Desai	26	50000	Ahmedabad
-- 15	Kapil	Raj	Sharma	40	100000	9000

-- RANK 
SELECT firstname,lastname,salary,RANK() OVER(ORDER BY salary DESC) as sal_rank from employee;

-- DENSE_RANK
SELECT firstname,lastname,salary,DENSE_RANK() OVER(ORDER BY salary DESC) as denseRank from employee;

INSERT INTO employee values(16,'Rahul','C','Patel',	35	,75000	,'Delhi');
SELECT * FROM employee;

SELECT firstname,lastname,salary,
RANK() OVER(ORDER BY salary DESC) as sal_rank,
DENSE_RANK() OVER(ORDER BY salary DESC) as denseRank
from employee;

-- difference between rank and dense rank

-- Kapil	Sharma	100000	1	1
-- Rahul	Patel	75000	2	2
-- Amit	    Patel	75000	2	2   here is the difference of 
-- Ankit	Yadav	72000	4	3   using rank and dense rank
-- Rohit	Kumar	70000	5	4
-- Neha	    Mishra	68000	6	5
-- Priya	Singh	64000	7	6
-- Vikas	Gupta	62000	8	7
-- Rahul	Sharma	60000	9	8
-- Sneha	Verma	55000	10	9
-- Divya	Nair	53000	11	10
-- Meera	Desai	50000	12	11
