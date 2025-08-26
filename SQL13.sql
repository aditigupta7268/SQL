use regex1;
CREATE TABLE Students1 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students1 (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students1;
select *  from Courses;

--   last table

CREATE TABLE Enrollments1 (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students1(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments1 (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);


-- get the studentId , stuentName , deptname and the courseName the student has Enrolled
-- the student name and the avg grade the student has recieved

SELECT s1.StudentID , s1.StudentName , s1.Department , c1.CourseName from Students1 AS s1
JOIN Courses AS c1 ON s1.Department = c1.Department;

SELECT s1.StudentName , s1.Department , AVG(e1.Grade) AS avg_grade FROM Students1 as s1
JOIN Enrollments1 as e1 ON s1.StudentID = e1.StudentID
GROUP BY s1.Department , s1.StudentName;

use sakila;
select * from payment;

-- get the paymentid , customername , the month the last working day of month where the amount spend by the customer is greater than 
-- the avg amount spended by the user itself only after the  year 2004

SELECT p1.payment_id , p1.customer_id , MONTH(payment_date) , last_day(payment_date) FROM payment AS p1
WHERE p1.amount > (SELECT AVG(amount) FROM payment AS p2 WHERE p2.customer_id = p1.customer_id) AND YEAR(payment_date) > 2004;


-- table creation --> (DDL) , DML
use sakila;
-- object
create table studentAccess(
id int,
sname varchar(30)
);  -- ddl

insert into studentAccess values(9,'abc');  -- dml --> to change the values in a data 
select * from studentAccess;

-- problem
insert into studentAccess values(11);

-- solution
insert into studentAccess(id) values(12);
select * from studentAccess;

insert into studentAccess(sname) values('abc');

select * from studentAccess;

drop table studentAccess; -- ddl

-- dml ( update ) 

update studentAccess set sname = 'raj'
where id = 12;
select * from studentAccess;

-- 
drop table studentAccess;

create table studentAccess(id int , sname varchar(10));

insert into studentAccess(id,sname) values(20,'aman');
insert into studentAccess(id,sname) values(23,'naina');

select * from studentaccess;

Delete from studentaccess where id between 20 and 23;

select *  from studentaccess;
Delete from studentaccess where id = 20;

truncate table studentaccess;
select * from studentaccess;

-- delete and truncate difference
-- truncate ---> drops table and recreate the structure

create table test18(id tinyint);
insert into test18 values(10);
insert into test18 values(-128);

insert into test18 values(-129);
select * from test18;

create table test19(id tinyint unsigned);  -- all positive numbers (255)
insert into test19 values(10);
insert into test19 values(-128);

-- small --> 2 byte , mediumint --> 3 byte , big int --> 8 byte
 