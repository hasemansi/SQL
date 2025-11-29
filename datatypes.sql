-- date 
-- timestamp
-- current_timestamp
-- varchar 
-- int 

-- 1. Numeric Data Types -------------------------------------------------------------------
-- Used for storing numbers (both integers and floating-point numbers).

-- a. Integer Types
-- TINYINT      	1            	-128 to 127                            	0 to 255
-- SMALLINT     	2            	-32,768 to 32,767                      	0 to 65,535
-- MEDIUMINT    	3            	-8,388,608 to 8,388,607               	0 to 16,777,215
-- INT / INTEGER	4            	-2,147,483,648 to 2,147,483,647       	0 to 4,294,967,295
-- BIGINT       	8            	-9,223,372,036,854,775,808 to           0 to 18,446,744,073,709,551,615
--                                  9,223,372,036,854,775,807	

use minskole;
show databases;
show tables;

create table intdata(
tiny_int tinyint,
small_int smallint,
med_int mediumint,
int_v int,
big_int bigint
);

desc intdata;
insert into intdata value (-128,-32768,-8388608,-2147483648,-9223372036854775807);
insert into intdata value (-127,-32768,-8388608,-2147483648,-9223372036854775807);
insert into intdata values(128, 32768,8388608,2147483648,9223372036854775807);
-- 1 row(s) affected, 4 warning(s): 1264 Out of range value for column 'tiny_int' at row 1 1264 Out of range value for column
--  'small_int' at row 1 1264 Out of range value for column 'med_int' at row 1 1264 Out of range value for column 'int_v' at row 1

insert into intdata values(127, 32767,8388607,2147483647,9223372036854775807);
select * from intdata;

create table unsignednumeric(
    tiny_v tinyint unsigned,
    small_v smallint unsigned,
    med_v mediumint unsigned,
    int_v int unsigned,
    bigint_v bigint unsigned   
);

insert into unsignednumeric value (-128,-32768,-8388608,-2147483648,-9223372036854775807);
insert into unsignednumeric value (-127,-32768,-8388608,-2147483648,-9223372036854775807);
-- 1 row(s) affected, 5 warning(s): 1264 Out of range value for column 'tiny_v' at row 1 1264 Out of range value for column 'small_v' at row 1 
-- 1264 Out of range value for column 'med_v' at row 1 1264 Out of range value for column 'int_v' at row 1 1264 Out of range value for column 'bigint_v' at row 1

insert into unsignednumeric values(128, 32768,8388608,2147483648,9223372036854775807);

-- 2.varchar----------------------------------------------------

-- VARCHAR (Variable Character range):

-- Used to store text or string data.
-- You must specify a maximum length (e.g., `VARCHAR(50)` → up to 50 characters).
-- Takes only as much space as needed for the text + 1 byte for length info.
-- Commonly used for names, emails, addresses, etc.

-- 1. Characters allowed in `VARCHAR`**

-- `VARCHAR` can store any character, including:

--   Letters → A-Z, a-z
--   Digits → 0-9
--   Special characters → `@ # $ % & * ( ) - _ + = / , . ? !` etc.
--   Spaces and Unicode characters** (like emojis or non-English letters) if the table uses UTF-8 or similar encoding.


-- 2. Maximum length of `VARCHAR` in MySQL

-- You can define up to VARCHAR(65535) bytes per column,
--   but this depends on:

--   The character set (UTF-8 uses more bytes per character).
--   The storage engine (InnoDB has row size limits).

-- Practical limit:
-- Usually, the maximum you can safely use is around VARCHAR(65532) for single-byte characters (like Latin1).
-- But in real-world use:

-- `VARCHAR(255)` or `VARCHAR(500)` is common for names, emails, etc.
-- For long text, better use TEXT or LONGTEXT type.

-- important

INSERT INTO employee VALUES(15,'Kapil', 'Raj', 'Sharma', 40, 100000, 9000);
select * from employee where id =15;
select * from employee where location = '9000';

-- 3.date and current timestamp----------------------------------------

-- date : (YYYY-MM-DD)


-- | Data Type     | Description                                                              | Example Stored Value  |
-- | ------------- | ------------------------------------------------------------------------ | --------------------- |
-- | DATE          | Stores only the date (YYYY-MM-DD)                                        | `2025-11-06`          |
-- | TIME          | Stores only the time (HH:MM:SS)                                          | `14:35:59`            |
-- | DATETIME      | Stores both date and time                                                | `2025-11-06 14:35:59` |
-- | TIMESTAMP     | Similar to DATETIME, but also stores time zone and updates automatically | `2025-11-06 14:35:59` |
-- | YEAR          | Stores only the year (YYYY)                                              | `2025`                |

create table student(
id int primary key auto_increment,
name text,
admission_date date,
record_created_at timestamp default current_timestamp
);

desc student;
insert into student (name , admission_date) value("Alia",'2025-11-06');
insert into student (name ,admission_date,record_created_at) value("bob",curdate(),current_timestamp());
select * from student;


CREATE TABLE date_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    dob DATE,
    login_time TIME,
    registration_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    record_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grad_year YEAR
);

-- | Function                   | Description                   | Example                                       | Output                |
-- | -------------------------- | ----------------------------- | --------------------------------------------- | --------------------- |
-- | CURDATE()                  | Returns current date          | `SELECT CURDATE();`                           | `2025-11-06`          |
-- | CURTIME()                  | Returns current time          | `SELECT CURTIME();`                           | `11:10:35`            |
-- | NOW()                      | Returns current date and time | `SELECT NOW();`                               | `2025-11-06 11:10:35` |
-- | CURRENT_TIMESTAMP          | Same as NOW()                 | `SELECT CURRENT_TIMESTAMP;`                   | `2025-11-06 11:10:35` |
-- | DATE_ADD()                 | Add interval to date          | `SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY);` | `2025-11-13`          |
-- | DATEDIFF()                 | Difference between two dates  | `SELECT DATEDIFF('2025-12-01', CURDATE());`   | `25`                  |
-- | YEAR(), MONTH(), DAY()     | Extract parts of date         | `SELECT YEAR(CURDATE());`                     | `2025`                |

insert into date_demo (name,dob,login_time,registration_datetime,record_created,grad_year) 
values("Riya",'2004-05-13',curtime(),current_timestamp(),current_timestamp(),year(curdate()));

insert into date_demo(name,dob,login_time,registration_datetime, record_created,grad_year)
values('sangeeta' , '2008-01-01', '09:00:00', '2024-05-05 11:00:00', current_timestamp(), '2023');

select * from date_demo;