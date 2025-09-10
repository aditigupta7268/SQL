create database tushar;
use tushar;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

select*,
avg(saleamount) over(),
min(saleamount) over(),
max(saleamount) over() from employeesales;


select*,
avg(saleamount) over(),
avg(saleamount) over(partition by department)
from employeesales;

select*,
avg(saleamount) over(),
avg(saleamount) over(partition by employeename)
from employeesales;

select*,
avg(saleamount) over(),
avg(saleamount) over(partition by saledate)
from employeesales;

select*,
avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department,saledate)
from employeesales;

select*,
avg(saleamount) over(partition by department),
avg(saleamount) over(partition by saledate)
from employeesales;


-- Important (For Interview) ----> Running sum and running avg Question 
select *,
sum(saleamount) over (order by saleamount) from employeesales;

select *,
sum(saleamount) over (order by department) from employeesales;

select *,
sum(saleamount) over (partition by department order by saleamount) from employeesales;

select *,
max(saleamount) over (partition by department order by saleamount) from employeesales;


use sakila;
select * from payment;
select *,
sum(amount) over (order by payment_date) from payment;

select *,
sum(amount) over (partition by customer_id order by amount) from payment;

-- rank
-- dense rank 
-- row number

-- second highest salary(using subquery more better approach than using limit )
-- using windows for higher level salary

-- row_number
select * ,row_number() over(order by department) from employeesales;
select * ,row_number() over(partition by department) from employeesales;


-- rank ---> is a analytical / window function to give rank or value to each row , if ranking are same rank will be shared and next rank value will be skipped 
-- eg - 900 -- rank(4) , 900 -- rank(4) , 950 -- rank(6)
select * , rank() over(order by saleamount) FROM employeesales;

select * , rank() over(partition by department order by saleamount desc) FROM employeesales;

-- dense rank ---> same as rank , but does not skip the next rank value if ranking are same for previous value.
select * , dense_rank() over(partition by department order by saleamount desc) FROM employeesales;

select * , dense_rank() over(partition by department order by saleamount desc) as `ranks` FROM employeesales;
with datarank as(
select * , dense_rank() over(partition by department order by saleamount desc) as `ranks` from employeesales
) 
select * from datarank where ranks = 2; 

-- LAG() --> piche wali value 
-- LEAD() --> aage wali value for each row 
select * , LEAD(saleamount,2) over() from employeesales;

with cte as(
select * , lead(saledate) over(partition by department , employeename order by saledate) as nextdate from employeesales)
select * from cte where datediff(nextdate , saledate) = 1;



