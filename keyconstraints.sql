show databases;
-- primary key
-- unique key
-- auto incerment key 
-- combined primary key 
-- primary key vs unique key

create database minskole;
use minskole;
create table employee(
fname varchar(15) not null,
mname varchar(15) ,
lname varchar(15) not null,
age int not null,
salary int not null,
location varchar(15) );

insert into employee(fname ,mname ,lname ,age ,salary ,location) 
values ('raj', 'mohan', 'rao', 30, 40000, 'pune'),
('shyam', 'vishal', 'patil', 35, 46000, 'mumbai'),
('alias', 'mohan', 'desai', 40, 70000, 'pune'),
('bob', 'shyamrao', 'kale', 50, 80000, 'banglore');

select * from employee;

insert into employee(fname ,lname ,age ,salary ,location) 
values ('vishal', 'rao', 30, 40000, 'pune');

-- primary key identify each record uniquely and null value not allowed 
-- there can be only one primary key in single table 
-- unique key identify each record uniquely and null value allowed
-- there can be more than one unique key in single table 

drop table employee;

CREATE TABLE employee (
id int PRIMARY Key,
firstname varchar(20) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(20) NOT NULL DEFAULT 'bangalore'
);

INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (1, 'rajesh','sharma', 28, 10000);
INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (2, 'rajesh','sharma', 28, 10000);

select * from employee;
desc employee;
INSERT INTO employee(firstname, lastname, age, salary) VALUES ('kapil','sharma', 45, 45000);
-- 1 row(s) affected, 1 warning(s): 1364 Field 'id' doesn't have a default value

INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (null , 'kapil','sharma', 45, 45000);
-- throw error Error Code: 1048. Column 'id' cannot be null
INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (5 , 'kapil','sharma', 45, 45000);

--  check constraints --------------auto_increment---------------------------------
CREATE TABLE employee (
id int primary key auto_increment,
firstname varchar(20) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL check(age > 17 and age <66),
salary int NOT NULL,
location varchar(20) NOT NULL DEFAULT 'bangalore'
);

INSERT INTO employee(firstname, lastname, age, salary) VALUES ('kapil','sharma', 45, 45000);
INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (4, 'rajesh','sharma', 28, 10000);
INSERT INTO employee(firstname, lastname, age, salary) VALUES ('kapil','sharma', 45, 45000);
INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (6, 'rajesh','sharma', 78, 10000);
-- because of check constraint
-- 16:17:22	INSERT INTO employee(id, firstname, lastname, age, salary) VALUES (6, 'rajesh','sharma', 78, 10000)	Error Code: 4025. CONSTRAINT `employee.age` failed for `minskole`.`employee`	0.000 sec

select * from employee;

SELECT * FROM information_schema.CHECK_CONSTRAINTS;
SELECT * FROM information_schema.CHECK_CONSTRAINTS WHERE CONSTRAINT_SCHEMA='minskole';

drop table employee;
-- ------------------unique key ----------------------------

CREATE TABLE employee (
id int auto_increment,
firstname varchar(20) NOT NULL,
lastname varchar(20) NOT NULL,
emailid varchar(30),
age int NOT NULL,
salary int NOT NULL,
location varchar(20) NOT NULL DEFAULT 'bangalore',
primary key(id),
unique key(emailid)
);

INSERT INTO employee(firstname, lastname, age, salary, emailid) VALUES ('kapil','sharma', 45, 45000, 'kapil@gmail.com');
INSERT INTO employee(firstname, lastname, age, salary, emailid) VALUES ('kapil','rao', 45, 45000, 'kapil@gmail.com');
-- Error Code: 1062. Duplicate entry 'kapil@gmail.com' for key 'emailid'

INSERT INTO employee(firstname, lastname, age, salary, emailid) VALUES ('rajesh','sharma', 45, 45000, 'rajesh@gmail.com');
INSERT INTO employee(firstname, lastname, age, salary, emailid) VALUES ('kapil','rao', 45, 45000, null);
-- unique key accept null values
SELECT * FROM employee;

-- ----------- composit primary key--------------------------
-- A composite primary key in MySQL is a primary key made up of two or more columns.
-- It uniquely identifies each row in a table by combining multiple column values —
--  meaning that no two rows can have the same combination of values for those columns.

create table book(
bookid int,
authorid int,
description varchar(50),
primary key(bookid, authorid)
);

-- 01 01 
-- 01 02
-- 02 01 
-- 02 02

desc book;
INSERT INTO book values
(1,101,'python'),
(1,102,'java'),
(2,101,'mysql');

SELECT * FROM book;
-- INSERT INTO book value (1,101,'abc'); -- Error Code: 1062. Duplicate entry '1-101' for key 'PRIMARY'

SELECT * FROM information_schema.CHECK_CONSTRAINTS WHERE CONSTRAINT_SCHEMA='minskole';
