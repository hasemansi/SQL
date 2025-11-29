-- ------------------
-- CRUD Operations
-- ----------------------

-- create - insert statements
-- read - select statements
-- update - update statements
-- delete - delete statements

use minskole;
describe employee;

drop table employee;

CREATE TABLE employee(
id int PRIMARY Key auto_increment,
firstname varchar(20) NOT NULL,
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(20) NOT NULL DEFAULT 'bangalore'
);

-- -------------truncate and delete------------------------------

-- truncate delets table and re create it
-- restart auto increment 
-- fast

-- delete table delets record one by one
-- slow
-- remenbers last incerment in auto increment
select * from employee;
delete from employee;

INSERT INTO employee(id, firstname, lastname, age, salary) VALUES(1, 'rajesh','sharma', 28, 10000);
INSERT INTO employee(firstname, lastname, age, salary) VALUES ('rajesh','sharma', 28, 10000);
INSERT INTO employee(firstname, lastname, age, salary) VALUES ('Maneesh','sharma', 28, 10000);
INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (4 , 'kapil','sharma', 28, 10000);
INSERT INTO employee (firstname, lastname, age, salary, location) VALUES ('Rahul', 'varma', 30, 60000, 'Bangalore');


SET SQL_SAFE_UPDATES = 1;  -- cant update 
SET SQL_SAFE_UPDATES = 0;  -- able to update
INSERT INTO employee(firstname, lastname, age, salary) VALUES ('rajesh','sharma', 28, 10000);  -- takes id as 6 without forgetting the id increment after deleting all rows

-- truncate table------------------------
truncate table employee; 
--  after truncate the table autoincrement of id starts from begining
select * from employee;

-- -------------------------------------CRUD OPERATIONS ---------------------------------------------------
drop table employee;

CREATE TABLE employee(
id int PRIMARY Key auto_increment,
firstname varchar(20) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(20) NOT NULL DEFAULT 'bangalore'
);

-- --------------INSERT-------------------

INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (1, 'Rahul', NULL, 'Sharma', 30, 60000, 'Bangalore');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (2, 'Sneha', 'K.', 'Verma', 28, 55000, 'Mumbai');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (3, 'Amit', NULL, 'Patel', 35, 75000, 'Delhi');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (4, 'Neha', 'R.', 'Mishra', 42, 68000, 'Bangalore');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (5, 'Vikas', 'L.', 'Gupta', 29, 62000, 'Hyderabad');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (6, 'Divya', NULL, 'Nair', 27, 53000, 'Chennai');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (7, 'Rohit', 'A.', 'Kumar', 33, 70000, 'Pune');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (8, 'Priya', NULL, 'Singh', 41, 64000, 'Kolkata');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (9, 'Ankit', 'B.', 'Yadav', 34, 72000, 'Bangalore');
INSERT INTO employee (id, firstname, middlename, lastname, age, salary, location) VALUES (10, 'Meera', NULL, 'Desai', 26, 50000, 'Ahmedabad');

-- select command
-- -------------------------------------------

-- selecting all columns
select * from employee;

-- selecting specific columns
select firstname, lastname, salary from employee;

-- ---- alias -----
SELECT firstname as Name ,lastname as sirname , salary as Salary from employee;

-- ------ select by applying a where clause (filter condition)------

SELECT firstname as Name ,age FROM employee WHERE age>30;

SELECT firstname ,salary FROM employee WHERE salary <60000;
SELECT firstname ,salary FROM employee WHERE salary > 60000 and salary < 70000 ;

select * from employee where middlename = null; -- wrong
select * from employee where middlename = Null; -- wrong
select * from employee where middlename = 'Null'; -- wrong
select * from employee where middlename = NULL; -- wrong

SELECT * FROM employee WHERE middlename is null;
-- OR--------------------
SELECT * FROM employee WHERE middlename is Null;


select firstname as Name , salary as Salary, location from employee where location = 'delhi'; 

-- case insensitive or sensitive ----------------------
select firstname as Name , salary as Salary, location from employee where location = 'Delhi'; 

