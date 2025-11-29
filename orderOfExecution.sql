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

-- ----------------------------------------------
use minskole;
select * from students;

select distinct  source_of_joining from students order by years_of_exp;
SELECT source_of_joining from students;   -- order of execusion

-- FROM (loading table)

-- SELECT (projecting source_of_joining)
SELECT source_of_joining,enrollment_date from students;   -- order of execusion

-- FROM (loading table)

-- SELECT (projecting source_of_joining,enrollment_date)

SELECT source_of_joining, enrollment_date FROM students order by enrollment_date;

-- FROM (loading table)
select * from students;

-- SELECT (projecting source_of_joining, enrollment_date)
SELECT source_of_joining, enrollment_date FROM students;

-- ORDER BY  (based on enrollment_date it will order by)
 SELECT source_of_joining, enrollment_date FROM students order by enrollment_date;
 
-- -----------------------------------------------------------------------------------------
 SELECT DISTINCT source_of_joining  FROM students order by enrollment_date;  -- this wont work
 
 -- DISTINCT (Duplicates on source_of_joining are removed)
 select DISTINCT source_of_joining from students; 
-- SQL can internally keep extra columns only up to the DISTINCT stage.
-- Once DISTINCT is applied, the rowset is reduced to only the DISTINCT columns.
select DISTINCT source_of_joining from students; 
select DISTINCT source_of_joining, enrollment_date from students; 

-- ORDER BY  (based on enrollment_date it will try order but enrollment date column is missing)
 SELECT source_of_joining FROM students order by enrollment_date; 
-- ORDER BY tries to sort by enrollment_date
-- ORDER BY (But enrollment_date is not present now)
-- ERROR: enrollment_date is unknown in ORDER BY
-- This is why MySQL does NOT allow this query.
-- ------------------------------------------------------------------------------------------------------------------------------
select DISTINCT source_of_joining, enrollment_date from students order by enrollment_date; -- this will work but may not the required output

