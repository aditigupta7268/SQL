use sakila;
# for film table --> film_id is PK , for film_actor table ---> (actor_id , film_id) is PK 
select * from film_actor;
select * from film;

desc film;
desc film_actor;

select f.film_id , f.title , f.release_year , a.actor_id from film as f
join film_actor as a on f.film_id = a.film_id;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Age INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');
   
   
   
INSERT INTO Students (StudentID, StudentName, Age, DepartmentID)
VALUES
    (101, 'Alice', 20, 1),
    (102, 'Bob', 21, 2),
    (103, 'Charlie', 22, 1),
    (104, 'Diana', 23, 3),
    (105, 'Evan', 20, NULL); -- Evan has no department assigned
   
select * from Students;
select * from Departments;

select s.studentid, s.studentname,  d.departmentname
from students as s join departments as d
where s.departmentid = d.departmentid;

-- self join
create table employee81(eid int , ename varchar(20),managerid int);
insert into employee81 values(10,'yash',null), (11,'aman',12) ,  (12,'naina',10) , (13,'happy singh' ,11);

select * from employee81;

# eid ---> PK for emloyee81 table

# managerid ---> FK for employee81 as it is a reference for PK (eid)
select e.eid , e.ename , e.managerid , mgr.ename from employee81 as e
join employee81 as mgr where e.managerid = mgr.eid;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    PrerequisiteCourseID INT,
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Courses (CourseID, CourseName, PrerequisiteCourseID)
VALUES
    (1, 'Intro to Programming', NULL),
    (2, 'Data Structures', 1),
    (3, 'Algorithms', 2),
    (4, 'Databases', 1),
    (5, 'Advanced Databases', 4),
    (6, 'Computer Networks', NULL),
    (7, 'Operating Systems', 2),
    (8, 'Computer Architecture', 1),
    (9, 'Machine Learning', 3),
    (10, 'Artificial Intelligence', 3),
    (11, 'Deep Learning', 9),
    (12, 'Compiler Design', 7),
    (13, 'Cloud Computing', 6),
    (14, 'Cybersecurity Fundamentals', 6),
    (15, 'Blockchain Technology', 14);


select * from courses;

-- PK ---> CourseID
-- FK --> PrerequisiteCourseID

select c.courseid , c.coursename , creqd.prerequisitecourseid , creqd.coursename from courses as c
left join courses as creqd on c.prerequisitecourseid = creqd.courseid;




