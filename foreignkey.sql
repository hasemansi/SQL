
-- Topic: FOREIGN KEY and ON DELETE Options in MySQL

-- 1.What is a FOREIGN KEY?

-- A foreign key is a column (or group of columns) in one table that refers to a primary key in another table.
-- It creates a relationship between two tables and ensures referential integrity — meaning, 
-- data in the related tables remain consistent.

-- courses - parent table - primary key -course_id
-- students - child table - foreign key - course_id (you can keep any name to the column)

USE minskole;

CREATE TABLE course (
cid INT PRIMARY KEY AUTO_INCREMENT,
cname TEXT
);

CREATE TABLE stud (
sid INT PRIMARY KEY AUTO_INCREMENT,
sname VARCHAR(100),
course INT REFERENCES course(cid)
);

-- another way to assign foreign key
CREATE TABLE teacher(
tid INT PRIMARY KEY AUTO_INCREMENT,
tname VARCHAR(20),
course_id INT,
FOREIGN KEY (course_id) REFERENCES course(cid)
);
desc teacher;

INSERT INTO course(cname) values
('python'),
('java'),
('sql');

INSERT INTO stud (sname,course) values
('Alias',1),
('Bob',2),
('Riya',1),
('Priya',2);

SELECT * FROM course;
DESC stud;

SELECT * FROM stud;

-- ---------Queries -------------

SET SQL_SAFE_UPDATES=0;

DELETE FROM stud WHERE course='1';


