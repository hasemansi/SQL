-- sql join inner , outer, letft ,right join 
-- sub queries
-- nested sub queries
-- set operator some all
-------------------------------------------------------------------------------------------------

use minskole;
-- 1. Create Tables

-- CUSTOMER
CREATE TABLE customer (
    cname VARCHAR(20),
    ccity VARCHAR(20),
    phone INT
);

-- DEPOSITER
CREATE TABLE depositer (
    cname VARCHAR(20),
    accno VARCHAR(10)
);

-- ACCOUNT
CREATE TABLE account (
    bname VARCHAR(20),
    accno VARCHAR(10),
    bal INT
);

-- LOAN
CREATE TABLE loan (
    lno VARCHAR(10),
    branch_name VARCHAR(20),
    amount INT
);

-- BORROWER
CREATE TABLE borrower (
    cname VARCHAR(20),
    lno VARCHAR(10)
);

-- BRANCH
CREATE TABLE branch (
    bname VARCHAR(20),
    bcity VARCHAR(20)
);

--  2. Insert Values

-- customer VALUES
INSERT INTO customer VALUES
('ram','pune',1111),
('sham','mumbai',2222),
('gita','pune',3333),
('seeta','mumbai',4444),
('maya','delhi',5555),
('ganesh','delhi',6666),
('amar','pune',7777),
('raj','angar',8888),
('mangesh','nagpur',9999);

-- depositer VALUES
INSERT INTO depositer VALUES
('ram','a_01'),
('sham','a_02'),
('mangesh','a_03'),
('seeta','a_04');

-- account VALUES 
INSERT INTO account VALUES
('kondhwa','a_01',35000),
('mgroad','a_02',15000),
('sadashivpeth','a_03',65000),
('katraj','a_04',60000);

-- loan VALUES
INSERT INTO loan VALUES
('l_01','kondhwa',15000),
('l_02','kondhwa',20000),
('l_03','katraj',45000),
('l_04','mgroad',35000),
('l_05','katraj',55000);

-- borrower VALUES
INSERT INTO borrower VALUES
('seeta','l_01'),
('geeta','l_02'),
('amar','l_03'),
('raj','l_04');

-- branch VALUES
INSERT INTO branch VALUES
('kondhwa','pune'),
('katraj','pune'),
('mgroad','angar'),
('sadashivpeth','nagpur');

-- -----------------------------------------------------------------------------------------
Show Tables;

-- 3. Training Queries

-- ---A. Joins  inner , left , right , full ,cross , outer


-- 1. List customers with their name, account numbers and city (INNER JOIN)
-- customer , depositer

-- normal query using where clause
select customer.cname ,ccity, accno from customer,depositer where customer.cname=depositer.cname;

-- inner join
select c.cname ,ccity,accno from customer c inner join depositer d on c.cname=d.cname;

-- 2. List customers even if they don’t have an account (LEFT JOIN)
select c.cname,ccity,accno from customer c left join depositer d on c.cname=d.cname;
insert into depositer values ('neel' , 'a_01'),('tanish','a_04');
select * from depositer;
select c.cname,ccity,accno from customer c left join depositer d on c.cname=d.cname;
-- newly added are not shown 

-- 3. Branch & account details  inner JOIN 
select a.bname ,accno ,bal,bcity from account a inner join branch b on a.bname=b.bname;

-- 4. Right Join taking left table
select c.cname,ccity,accno from customer c right join depositer d on c.cname = d.cname;

-- --- Right Join taking right table
select d.cname,ccity,accno from customer c right join depositer d on c.cname = d.cname;

-- B. Nested Subqueries **********************************************************************

-- 1. Customers who have loan amounts greater than average loan
-- loan, borrower
select * from loan;
select * from borrower;
select cname from borrower
where lno in (
select lno from loan 
where amount > (select avg(amount) from loan));


-- 2. Customers living in cities having a branch
-- customer , branch
select cname,ccity from customer 
where ccity in (select bcity from branch);

-- 3. Accounts whose balance is greater than ALL loan amounts
-- account , loan
select accno ,bal from account where
bal > ALl ( select amount from loan);
-- or 
select accno , bal from account where
bal > (select max(amount) from loan);

-- C. SET Comparison — IN, ANY, ALL
-- 1. Using IN

-- All customers who have an account (are depositers).
select cname from customer where cname in (select cname from depositer);

-- All customers who have an account (are not in depositers). 
select cname from customer where cname not in (select cname from depositer);


-- All depositer who are not custometer.
select cname from depositer where cname not in (select cname from customer); 

-- 2. Using ANY****************************************************************************
 -- Find accounts with balance greater than **any one amount** of loans:
 select accno ,bal from account where bal > any (select amount from loan);
-- a_01 35000 -- oputput
-- a_03	65000
-- a_04	60000

 -- write using min
 select accno ,bal from account where bal > (select min(amount) from loan);
-- output
-- a_01	35000
-- a_03	65000
-- a_04	60000

-- 3. Using ALL
-- Find branches where all loans exceed ₹20,000:
select bname from branch where 20000 < ALL
(select amount from loan where branch.bname = loan.branch_name);




-- Multi-level Nested Query ***********************************************************

-- Customers who borrow from branches located in Pune
-- branch, loan, borrower
-- loan                                     
--  +------+-------------+--------+      
-- | lno  | branch_name | amount |
-- +------+-------------+--------+
-- | l_01 | kondhwa     |  15000 |
-- | l_02 | kondhwa     |  20000 |
-- | l_03 | katraj      |  45000 |
-- | l_04 | mgroad      |  35000 |
-- | l_05 | katraj      |  55000 |

-- borrower        +-------+------+
-- 				| cname | lno  |
-- 				+-------+------+
-- 				| seeta | l_01 |
-- 				| geeta | l_02 |
-- 				| amar  | l_03 |
-- 				| raj   | l_04 |
--                 
-- branch     
-- +--------------+--------+
-- | bname        | bcity  |
-- +--------------+--------+
-- | kondhwa      | pune   |
-- | katraj       | pune   |
-- | mgroad       | angar  |
-- | sadashivpeth | nagpur |
-- +--------------+--------+

-- explanation--------------
-- katraj , kondhwa --- >  l no 1, 2, 3, 5 ---->  1, 2, 3 -----> seeta, geeta , amar
select cname from borrower 
where lno in (
select lno from loan 
where branch_name in(
select bname from branch where bcity='pune'));

