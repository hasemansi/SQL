-- Logical operator

use minskole;
select * from students;
-- get student from bangalore 
SELECT * FROM students WHERE location='bangalore';

-- to get people who are not from bangalore (!=)
SELECT * FROM students WHERE location != 'bangalore';

-- get all courses which has the word 'data'
SELECT * FROM course;
select cname from course where cname like '%data%';

-- get all courses which do not have the word 'data'
select cname from course where cname not like '%data%';

-- all students from bangalore who joined through linkedin and have less than 8 years of experience(and)
select * from students;
SELECT * from students where location='bangalore' and source_of_joining='linkedin' and years_of_exp > 8;
set sql_safe_updates=0;
update students set location='bangalore' where student_id='1';


-- I want all people who do not fall between 8 to 12 years of experience.
select * from students where years_of_exp not >8 and years_of_exp not <12; -- wrong

select * from students where years_of_exp not between 1 and 8;

-- if both condn true then only true otherwine false

-- want student between 8 1nd 12
select * from students where years_of_exp between 1 and 12;

-- get list of students who are working for flipkart, infosys or microsoft
select * from students where student_company='flipkart' or student_company='infosys' or student_company='microsoft';
-- another way
select * from students where student_company in ('flipkart','infosys','microsoft');

-- get list of students who are not working for flipkart, infosys or microsoft
select * from students where student_company not in ('flipkart','infosys','microsoft');


-- CASE 
-- --------------

-- if a course is more than 4 months we categorize it as masters program else it is a diploma

-- time > 4 masters 
--      < 4 deploma



alter table course add column course_duration int;
select * from course;
update course set course_duration = 4 where cname = 'python';
update course set course_duration = 6 where cname = 'mysql'; 
update course set course_duration = 3 where cname = 'javascript'; 
update course set course_duration = 9 where cname = 'aiml'; 
update course set course_duration = 10 where cname = 'data science'; 
update course set course_duration = 8 where cname = 'full stack'; 
update course set course_duration = 7 where cname = 'automation testing'; 

-- if a course is more than 4 months we categorize it as masters program else it is a diploma
-- case  --- when-then --- when -then--- else --- end as new column name
SELECT cname,course_duration,
CASE
WHEN course_duration > 4 THEN 'masters'
ELSE 'bachelors'
END AS course_type
FROM course;

-- people working for flipkart, infosys or microsoft we want to say product based and all others service based.
select * from students;
SELECT student_fname,student_company,
CASE
WHEN student_company IN ('flipkart','infosys','microsoft') THEN 'Product based'
ELSE 'service based'
END AS Company_type 
from students;

-- multiple logics
-- if company not given then set to null
SELECT *,
CASE
WHEN student_company IN ('flipkart','infosys','microsoft') THEN 'Product based'
WHEN student_company IS NULL THEN 'company not statisfied'
ELSE 'service based'
END AS company_type
FROM students;

-- update using case
select * from course;

update course 
set 
course_duration=case
when cname='java' then 4
when cname='django' then 5
else course_duration
end,
cname=case
when cid = '4' then 'full stack'
when cid = '5' then 'software testing'
else cname
end;

-- ---------more operator---------------------
-- <> is a comparison operator in SQL.
select student_fname, location from students where location <> 'pune';
-- It means “not equal to” (same as !=).
select student_fname, location,source_of_joining from students where source_of_joining <> 'facebook';


-- -------------------------------------------------------------------------
-- In MySQL, REGEXP (or RLIKE, they’re the same) is used in the WHERE clause to match a string column against a regular expression pattern.

-- It’s more powerful than LIKE, because you can define flexible rules.
-- Some common regex patterns in MySQL:

-- ^ → start of string
-- Find names starting with 'A'
select * from students where student_fname regexp '^A';

-- $ → end of string
select * from students where student_fname regexp 'a$';

-- names containing sh
select * from students where student_fname regexp 'sh';

-- . → any single character
-- [...] → any character in the set
-- Find names that start with J and are exactly 4 letters
select * from students where student_fname regexp '^j..';
select * from students where student_fname regexp '^j....$';
select * from students where student_fname regexp '^j..$'; -- if not then return null row




-- | → OR
-- *, +, {n,m} → repetition
-- Find names containing 'Ann' or 'Anna'
select * from students;
select * from students where student_fname regexp 'dhaw(a)n?';
-- Ann → must appear
-- (a)? → optional a (can appear 0 or 1 time)

SELECT name FROM employees WHERE name REGEXP 'nit(h)?in';  -- nitin nithin  tanish thanish
-- nit → required
-- (h)? → optional h
-- in → required

-- ✔ Matches names:
-- nitin
-- nithin

-- Match 'color' or 'colour'
-- WHERE word REGEXP 'colou?r';

-- matches shi, shu, or sha
-- REGEXP 'sh(i|u|a)'

-- matches ab, abab, ababab, etc.
-- REGEXP '(ab)+'  

-- Without parentheses, ab+ would mean a followed by one or more b's (abb, abbb …).


