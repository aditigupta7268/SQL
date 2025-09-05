
use regex1;
-- Department Table
CREATE TABLE Departments1 (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
-- Employee Table
CREATE TABLE Employees1 (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT NULL,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments1(dept_id)
);

-- Insert Departments
INSERT INTO Departments1 (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

INSERT INTO Employees1 (emp_id, emp_name, manager_id, salary, dept_id) VALUES
(101, 'Alice', NULL, 90000, 3), -- Alice is IT Head
(102, 'Bob', 101, 60000, 3), -- Bob reports to Alice
(103, 'Charlie', 101, 55000, 3), -- Charlie reports to Alice
(104, 'David', 102, 40000, 3), -- David reports to Bob
(105, 'Eve', NULL, 80000, 2), -- Eve is Finance Head
(106, 'Frank', 105, 50000, 2), -- Frank reports to Eve
(107, 'Grace', NULL, 75000, 1), -- Grace is HR Head
(108, 'Heidi', 107, 45000, 1), -- Heidi reports to Grace
(109, 'Ivan', NULL, 70000, 4), -- Ivan is Marketing Head
(110, 'Judy', 109, 48000, 4); -- Judy reports to Ivan
-- 2
SELECT * FROM employees1;
SELECT e2.emp_name , e1.emp_name AS manager_name FROM Employees1 AS e1
JOIN Employees1 AS e2 ON e1.emp_id = e2.manager_id;
 
-- 3
SELECT AVG(salary) , dept_id FROM Employees1 
GROUP BY dept_id;

-- 4
SELECT e1.emp_name , d.dept_name  FROM Employees1 AS e1
JOIN Employees1 AS e2 ON e1.emp_id = e2.manager_id
INNER JOIN Departments1 AS d ON e1.dept_id = d.dept_id
WHERE e1.salary > (SELECT AVG(e2.salary) FROM Employees1 AS e2 WHERE e1.dept_id = e2.dept_id);

-- 5
SELECT e1.emp_name , e1.dept_id FROM Employees1 AS e1
WHERE e1.salary > (SELECT AVG(e2.salary) FROM Employees1 AS e2 WHERE e1.dept_id = e2.dept_id);

-- 6
SELECT e1.emp_name , e1.salary , d.dept_name FROM Employees1 AS e1 JOIN Departments1 AS d ON e1.dept_id = d.dept_id
WHERE e1.salary = (SELECT MAX(salary) FROM Employees1 AS e2 WHERE e1.dept_id = e2.dept_id);

-- 7
SELECT e1.dept_id , e1.dept_name
FROM Employees1 AS e1 JOIN Departments1 AS d ON e1.dept_id = d.dept_id GROUP BY e1.dept_id HAVING AVG(e1.salary) > (SELECT AVG(e2.salary) FROM Employees1 e2);

