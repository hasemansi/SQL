-- having clause
-- | Feature             | **WHERE**                                   | **HAVING**                                                  |
-- | ------------------- | ------------------------------------------- | ----------------------------------------------------------- |
-- | **Purpose**         | Filters **rows** before grouping            | Filters **groups** after grouping                           |
-- | **Used With**       | Can be used with **SELECT, UPDATE, DELETE** | Used only with **GROUP BY**                                 |
-- | **Works On**        | **Individual rows**                         | **Aggregate functions** (`SUM()`, `AVG()`, `COUNT()`, etc.) |
-- | **Execution Order** | Applied **before** `GROUP BY`               | Applied **after** `GROUP BY`                                |
-- | **Example Use**     | Filter rows where `amount > 20000`          | Filter branches where `AVG(amount) > 20000`                 |

-- ORDER OF EXECUTION
-- ------------------------------------------------
-- SQL executes in the following logical order:

-- 1. FROM
-- 2. WHERE (if present)
-- 3. GROUP BY (if present)
-- 4. HAVING (if present)
-- 5. SELECT
-- 6. DISTINCT (if present)
-- 7. ORDER BY
-- 8. LIMIT (if present)

-- Where vs Having clause in SQL
-- ------------------------------

use minskole;
-- 1)
-- want a count of student joined from different sources
select * from students;
SELECT source_of_joining ,count(*) as total from students group by source_of_joining;

-- I want to know the lead sources through with more  than 2 person has registered.
-- SELECT source_of_joining ,count(*) as total from students group by source_of_joining where total>2; -- error
-- where clause is used to filter the individual records before aggregation ..work befor aggregation ...cant understand grouping...
-- if i want to filter after aggregation use " having " 

SELECT source_of_joining ,count(*) as total from students group by source_of_joining having total>2;


-- 2)
-- I want to know the count of people who registered through linkedIN
select student_fname ,count(*) as total from students group by source_of_joining having source_of_joining='linkedin';
-- using where
select student_fname,source_of_joining , count(*) as total from students where source_of_joining = "linkedin" group by source_of_joining;

-- 3)
-- the locations from which more than 2 student has joined & the students experience is more than 10 years
select location  ,count(*) as total from students where years_of_exp >10 group by location having total>2;
select * from students;

-- important do filtering as soon as possible so we do not do havy crunching and latter filtering.
-- 1.where is used before group by and do filtering on individual records

-- 2.having is used after group by and do filtering on aggregated records.

-- 3.we can use where and having in the same query also. 

-- 4.where is more performant than having ..



