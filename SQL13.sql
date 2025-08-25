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




