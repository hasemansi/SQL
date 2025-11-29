-- reference key

-- institute / collage

-- courses table (id , name)
-- 1 - python 
-- 2- sql
-- 3 - js 


-- students table (id, name , course id )
-- x - 1
-- y - 2
-- z - 3
-- p - 6 -- this should not be creates

-- -- ------------------------------------------------------

-- relation in 2 tables using foreign key 

-- PK -- parent table 
-- FK -- child table


-- courses table (id(PK), name)
-- 1 - python 
-- 2- sql
-- 3 - js 


-- students table (id, name , course id(FK) reference courses(course id) )
-- x - 1
-- y - 2
-- z - 3
-- p - 6 -- this record will not get created 

USE minskole;

CREATE TABLE course (
cid INT PRIMARY KEY AUTO_INCREMENT,
cname TEXT
);

CREATE TABLE teacher(
tid INT PRIMARY KEY AUTO_INCREMENT,
tname VARCHAR(20),
course_id INT,
FOREIGN KEY (course_id) REFERENCES course(cid)
);

SELECT * FROM course;

INSERT INTO teacher(tname ,course_id) values
('Abc',1),
('pqr',2),
('lmn',3),
('pqr',1),
('Abc',3);

SELECT * FROM teacher;

-- 1)
SELECT * FROM teacher WHERE course_id='1';
-- 2)
SELECT * FROM teacher WHERE course_id='2';
-- 3)
DELETE FROM teacher WHERE course_id='2';

-- relation between table 

-- parent table 
-- more than one child table

-- table trainers id. name , pno, assigned_course_id(FK) references courses(id)
-- child table of parent courses table