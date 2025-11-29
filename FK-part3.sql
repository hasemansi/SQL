-- foreign key
-- 
-- parent --- courses --- holds PK
-- child --- students ---holds FY

-- the foreign key constraint is used to prevent actions that would
-- destroy links between two tables ..

-- A foreign key is a field in one table that refers to the primary
-- key in another table.

-- selected_course is a foreign key in students table which refers
-- to course_id (primary key) in courses table.

-- the table with the foreign key is called the child table,
-- the table with primary key is called the parent or referenced
-- table.


-- constraints are used to limit the type of data that can go into a table.

-- This ensures the accuracy and reliability of the data is maintaineed.

-- If there is any violation then the action is aborted.

-- ----------------------------------------------------------------------------------------------------------


-- | Option                    | Description                                                                    | Example Behavior                                      |
-- | ------------------------- | ------------------------------------------------------------------------------ | ----------------------------------------------------- |
-- | CASCADE                   | Automatically deletes rows in child table when the parent row is deleted.      | Delete a course → delete all students in that course. |
-- | SET NULL                  | Sets the foreign key column to NULL in child table when parent row is deleted. | Delete a course → students' `course_id` becomes NULL. |
-- | RESTRICT                  | Prevents deletion of parent row if related rows exist in child table.          | Delete a course → fails if any student is enrolled.   |
-- | NO ACTION (default)       | Same as RESTRICT (in MySQL). Prevents delete if child records exist.           | Delete a course → error if dependent rows exist.      |


-- -----on delete cascade-------------------------------------------
-- When two tables are related by a foreign key, the child table references the parent table.
-- If you delete a record from the parent table, ON DELETE CASCADE ensures that all related records in the child table are also deleted automatically.
USE minskole;

CREATE TABLE course (
cid INT PRIMARY KEY AUTO_INCREMENT,
cname TEXT
);

CREATE TABLE student1(
sid INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20),
courseid INT,
FOREIGN KEY (courseid) REFERENCES course(cid) ON DELETE CASCADE
);
DROP TABLE teacher;
DROP TABLE student;
SELECT * FROM course;

SELECT * FROM student1;
insert into student1(name,courseid) values
('raj', 1),
('kiran',2),
('pooja',2),
('rakesh',3),
('geet',1);
SET SQL_SAFE_UPDATES=0;

DELETE FROM course WHERE cid='1';

insert into student1(name,courseid) values('raj', 1),
('geet',1);

drop table student1;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
-- (`minskole`.`student1`, CONSTRAINT `student1_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`cid`) ON DELETE CASCADE)

-- ---on delete set null------------------------------------------------

-- The ON DELETE SET NULL option in MySQL is another foreign key action that controls what happens when a record in the parent table is deleted.

-- Instead of deleting related rows (like ON DELETE CASCADE), this option sets the foreign key column in the child table to NULL when the parent row is deleted.

-- 🔹 Basic Concept:

-- When the parent record is deleted →
-- the child’s foreign key column becomes NULL (not deleted).

create table students_sn(
student_id int primary key auto_increment,
student_name varchar(30),
course_id int,
foreign key(course_id) references course(cid) on delete set null);

insert into students_sn(student_name,course_id) values('raj', 1),
('kiran',2),
('pooja',2),
('rakesh',3),
('geet',1);

show tables;
select * from course;
insert into course(cid,cname) values(1,'django');

DELETE FROM course WHERE cid='3';
SELECT * FROM students_sn;
