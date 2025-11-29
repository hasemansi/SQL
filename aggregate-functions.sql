-- Aggregate Functions
-- ----------------------

-- group by , count , min, max, avg, sum 
-- --------------------------------------

SELECT * FROM students;

-- 1)
select count(*) from students;
-- 2)
select count(student_company) from students;
-- 3)
select count(distinct student_company) as company_cnt from students;
-- 4)
select count(distinct source_of_joining) as joining_source from students;
-- 5)
select count(*) from students where batch_date like '%-06-%';
-- 6)
select count(*) from students where batch_date like '%5-02-%';

-- group by
-- ------------------
-- I want is to know that how many people have joined my course got to know about me through
-- linkdin   6
-- insta   2
-- youtube 1 

-- The GROUP BY clause in MySQL is used to group rows that have the same values in one or more columns — 
-- typically for performing aggregate functions like COUNT(), SUM(), AVG(), MAX(), or MIN()

SELECT  source_of_joining ,count(*) as number_of_source from students group by source_of_joining;

SELECT  source_of_joining ,count(*) as number_of_source from students group by source_of_joining order by source_of_joining;

SELECT  source_of_joining ,count(*) as number_of_source from students group by source_of_joining order by source_of_joining desc;

-- group by on 2 column 
-- want to know the Count the number of students for each unique combination of location and source of joining.

 SELECT location, source_of_joining ,count(*)  from students group by source_of_joining,location order by location;
 
 -- how many people enroll for verious courses-------
 select * from students;
 
 select * from course;
 
 select selected_course ,count(*) from students group by selected_course order by selected_course;
 
 select s.selected_course ,c.cname ,count(*) from
 students s,course c where s.selected_course=c.cid group by s.selected_course , c.cname order by s.selected_course;
 
 -- how many courses sold on dates count 
--     when         which           how many

select batch_date , selected_course ,count(*) from students group by selected_course,batch_date;

select batch_date,count(*) from students group by batch_date;


-- Count the number of students per course for each month and year.

-- group by year, month, seleted_course

select year(batch_date) as year,monthname(batch_date) as month,selected_course,count(*) from students 
group by year(batch_date),monthname(batch_date),selected_course order by year(batch_date),monthname(batch_date);


-- -------------min max---------------

select min(years_of_exp) from students;
select max(years_of_exp) from students;

select min(years_of_exp), student_fname from students;  -- wont work --dont know which name to project in case of tie

-- SELECT student_fname FROM students ORDER BY years_of_exp LIMIT 1;
-- This orders all rows by years_of_exp ascending.
-- If there’s a tie (two students with the same minimum value), MySQL will pick one arbitrarily, unless you specify a secondary sort.
-- The row returned depends on how MySQL reads the data internally — there’s no guarantee which tied record comes first.
-- To make it deterministic, add another column in ORDER BY, for example:
-- SELECT student_fname FROM students ORDER BY years_of_exp, student_id LIMIT 1;

-- each source of joining I want to get max experience

select source_of_joining,max(years_of_exp) from students group by source_of_joining;

 -- -------------------sum ---------------------
 
 select source_of_joining,sum(years_of_exp) from students group by source_of_joining;
 
 -- ----------------avg--------------
 
 select source_of_joining,avg(years_of_exp) from students group by source_of_joining;
 
 select location, avg(years_of_exp) from students group by location;


 


