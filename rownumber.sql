-- Row Number
-- | Use Case                              | Description                         |
-- | ------------------------------------- | ----------------------------------- |
-- | ✅ To assign unique numbers to rows    | Even if rows have same values       |
-- | ✅ To find **top N** records per group | e.g., highest salary per department |
-- | ✅ To remove duplicates                | Keep only the first record          |
-- | ✅ For pagination                      | Display rows 1–10, 11–20, etc.      |
-- | ✅ For ordering results                | Create a row index based on sorting |

-- basic syntax
-- ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name)


USE minskole;
CREATE TABLE employee (
firstname varchar(20),
lastname varchar(20),
age int,
salary int,
location varchar(20)
);

-- for rank and dense rank 
-- INSERT INTO employee_over VALUES ('Sunil', 'Chhetri', 39, 150000, 'Bengaluru');
-- INSERT INTO employee_over VALUES ('Sandesh', 'Jhingan', 31, 45000, 'Goa');
-- INSERT INTO employee_over VALUES ('Gurpreet', 'SinghSandhu', 33, 150000, 'Bengaluru');
-- INSERT INTO employee_over VALUES ('Anirudh', 'Thapa', 27, 90000, 'Kolkota');
-- INSERT INTO employee_over VALUES ('Udanta', 'Singh', 29, 90000, 'Goa');

-- want to give numbering according to salary
select firstname,lastname,age,salary,
row_number() over (order by salary),
location from employee;

select firstname,lastname,age,salary,
row_number() over (order by salary desc),
location from employee;

-- find the 5th highest salary
select * from ( select firstname,lastname,age,salary ,
row_number() over (order by salary) as rownum ,location from employee) temptable
where rownum=5;

-- the problem statement is to assign row number for partitions based on each location ..
select * , row_number() over(partition by location order by salary) as rownum from employee; 

-- the problem statement is to assign row number for partitions based on each location and salary ..

-- I want to find the highest salary getters at each location
select * from (select firstname,lastname,age,salary,location ,row_number() over (partition by location order by salary desc) as rownum from employee) temptable
where rownum=1;

-- I want to find the lowest salary getters at each location
select * from (select firstname,lastname,age,salary,location ,row_number() over (partition by location order by salary) as rownum from employee) temptable
where rownum=1;

-- when we use row_number
    -- we should be using the order by clause 
    -- we can also use the partition by - optional
    -- the rownumber starts from 1 for every partition