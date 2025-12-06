-- over partition by
create database company;
use company;

CREATE TABLE employees (
firstname varchar(20),
lastname varchar(20),
age int,
salary int,
location varchar(20)
);


INSERT INTO employees VALUES ('Lionel', 'Messi', 37, 120000, 'Miami');
INSERT INTO employees VALUES ('Cristiano', 'Ronaldo', 40, 150000, 'Riyadh');
INSERT INTO employees VALUES ('Neymar', 'Jr', 33, 110000, 'Riyadh');
INSERT INTO employees VALUES ('Kylian', 'Mbappe', 26, 95000, 'Madrid');
INSERT INTO employees VALUES ('Erling', 'Haaland', 25, 90000, 'Manchester');
INSERT INTO employees VALUES ('Luka', 'Modric', 39, 85000, 'Madrid');
INSERT INTO employees VALUES ('Robert', 'Lewandowski', 37, 92000, 'Barcelona');
INSERT INTO employees VALUES ('Kevin', 'DeBruyne', 34, 88000, 'Manchester');
INSERT INTO employees VALUES ('Mohamed', 'Salah', 33, 87000, 'Liverpool');
INSERT INTO employees VALUES ('Virgil', 'vanDijk', 34, 86000, 'Liverpool');

select * from employees;

-- how many people are from each location and avg salary at each location like bangalore, 3, 16666
select location , count(location) as total ,avg(salary) from employees group by location;
-- fname , lastname , count of location, average salary 
select firstname,lastname,location , count(location) as total ,avg(salary) from employees group by location; -- error

-- using join
select firstname,lastname,employees.location,total_loc,avgSal from employees
join
(select location , count(location) as total_loc ,avg(salary) as avgSal 
from employees group by location) temptable
on employees.location=temptable.location;

-- use over partition by

select firstname,lastname,location ,
count(location) over (partition by location) as total_location,
avg(salary) over (partition by location) as avgSal
from employees;

-- this works like syntact sugur .. that means you are able to achive it with minimum synatxt 
-- ------theory-----------------

-- OVER & PARTITION BY in SQL
-- 1. What is OVER?

-- The OVER clause is used with window functions like SUM(), AVG(), COUNT(), ROW_NUMBER(), etc.

-- It tells SQL:
--  “Do this calculation across a set of rows, but still keep each row in the result.”

-- Unlike GROUP BY, which reduces rows, OVER lets you see detail + aggregate at the same time.

-- 2. What is PARTITION BY?

-- PARTITION BY is like a grouping inside the window function.

-- It divides the data into partitions (subsets), and the window function runs separately on each partition.

-- Think of it like saying:
-- “Do this calculation per location, per department, per age group, etc.”

-- 3. Example
-- SELECT firstname, lastname, location, salary,
--        COUNT(*) OVER (PARTITION BY location) AS total_in_location,
--        AVG(salary) OVER (PARTITION BY location) AS avg_salary_location
--        SUM(salary) over (partition by location) as total_salary
-- FROM employee_over;

-- Here’s what happens:

-- COUNT(*) OVER (PARTITION BY location)
-- → Counts employees per location but shows the count in every row.

-- AVG(salary) OVER (PARTITION BY location)
-- → Calculates average salary per location, and displays it next to each employee.

-- 4. Difference from GROUP BY
-- Feature	                        GROUP BY	                                         OVER (PARTITION BY …)
-- Keeps individual rows?	        ❌ No (rows collapse into one per group)	            ✅ Yes
-- Shows group aggregates?       	✅ Yes	                                                ✅ Yes
-- Good for…	                    Summarized reports	                                    Row-level + aggregate info together


-- 5. Key Points to Remember

-- OVER = activates window functions.

-- PARTITION BY = defines how rows are grouped for calculation.

-- If you skip PARTITION BY, the calculation is done on the entire table.

-- Different window functions in the same query can use different PARTITION BY conditions.