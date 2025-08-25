-- JOIN , JOIN with group by
-- self join , LEFT join most important in joins

-- general function / flow control function

 use world;
 select code , name, if(name='Aruba','terror country','hello') , indepyear from country;
 select code , name, if(name='Aruba','terror country',if(name = 'Angola','Terrrorist','Tourism')) , indepyear from country;
 
##  case syntax
--  case
-- 	when condition the expression
--     when condition the expression
--     else expression
-- end


select code , name,
	case 
		when name = 'Aruba' then 'terror country'
        when name = 'Angola' then 'terroist'
        else 'Tourism'
	end as 'status'
from country;

-- country name start with A ---> 'country with A'
-- with S ---> 'country with S'
-- else 'country with another name'

select code , name ,
case 
	when name like 'A%' then 'country with A'
    when name like 'S%' then 'country with S'
    else 'country with another name'
end as 'start_char'
from country;


-- ifnull() --> to handle null values
select name , indepyear , ifnull(indepyear,0) from country;
select count(indepyear) , count(ifnull(indepyear,0)) from country;

-- nullif() ---> if both column char length is same return null , else return 1st column char length

select name , continent , nullif(length(name),length(continent)) as length_char from country;

select name , population,	
	case 
		when population > 2000000 then 'Developed country'
        when population > 100000 then 'Developing country'
        else 'Under Developed country'
	end as countryStatus
from country;

-- subquery ---> nested query 
-- query (subquery)

use world;
select name , population from city
where population > (select population from city 
where name = 'Kabul');

select name , population from city
where population > (select population from city 
where name = 'Amsterdam');

-- get the name of the city where the district is same as of the district for Amsterdam

select * from city;
select district from city where name = 'Amsterdam';
select name , district from city where district = (select district from city where name = 'Amsterdam');

-- country table --> get the country code and country name where the continent matches with the continent of the country Albania
-- get the continent the name of the country where the life expetancy matches with the life expetancy of the country name as cook Islands
-- get the country code , and the  continent and GNP value for the countries where the region do not match with the region of the country named as Benin

-- 1. get the continent for country albania
-- 2. then get the country code , name for the continent matching 1
select Code , Name , continent from country
where continent = (select continent from country where name = 'Albania');

-- Ques 2 ---> get the continent , name from country where life expentancy
-- Part 2 ---> get life exp of country cook Islands
select * from country;
select continent , name from country where lifeExpectancy = (select lifeExpectancy from country where name = 'Cook Islands');

-- Ques 3 ---> get the region of Benin then get code , name col where region not equal to 1 
select Code , Name , GNP from country 
where region != (select region from country where name = 'Benin');

-- nested query or subquery types --->
-- single row subquery  --> where the nested query gives single row

-- multi row subquery  --> where nested query gives multiple rows
-- > , < != , = --> doesnt works in multi row subquery
-- get the country name , population for all the countries available in the continent name as Europe

select name , population , continent from country
where continent IN (select name , continent from country where continent = 'Europe'); 

-- get the country name , country code where the life exp match with the life exp of the country name as bahamas

 select name , code from country where lifeExpectancy = (select lifeExpectancy from country where name = 'Bahamas');
 
 use sakila;
 select * from payment;
 
 -- find the payment_id , customer name and the amount where tne amount is same as the the amount of payment id 5

select payment_id , customer_id , amount from payment where amount = (select amount from payment where payment_id = 5);

-- find the payment_id , customer name and the amount where payment_id = 2 or 3

select payment_id , customer_id , amount from payment where amount IN (select amount from payment where payment_id = 2 or payment_id = 3);

-- =ANY / IN 
-- >ANY ---> greater than the minimum value of subquery
-- any opreator can be used with ANY
select payment_id , customer_id , amount from payment where amount >ANY(select amount from payment where payment_id = 2 or payment_id = 3);

select payment_id , customer_id , amount from payment where amount <ANY(select amount from payment where payment_id = 2 or payment_id = 3);

select payment_id , customer_id , amount from payment where amount <=ANY (select amount from payment where payment_id = 2 or payment_id = 3);

-- ALL opreator 
-- for >ALL ---> sab mei se bada
-- for <ALL ---> sab ei se chota

select payment_id , customer_id , amount from payment where amount >ALL (select amount from payment where payment_id = 2 or payment_id = 3);
-- amount > 9.99 
select payment_id , customer_id , amount from payment where amount <ALL (select amount from payment where payment_id = 2 or payment_id = 3);
-- amoun < 0.99

select country from  world.country;

-- get the name of the country whose population is > the population among all the country where the continent is name as North America

select name , population from world.country where population >ALL(select population from world.country where continent = 'North America');

-- get the country code the name of the country whose life expectancy is same as of the countries Europe
-- get the name and the continent for the countries who have got their independence near by the independence year 
-- of the countries from Asia
use world;
select code , name , lifeExpectancy from country where lifeExpectancy =ANY(select lifeExpectancy from country where continent = 'Europe');

select continent , COUNT(*) from country where IndepYear >ANY(select indepYear from country where continent = 'Asia')
and continent != 'Asia'
GROUP BY continent;

-- ORDER BY --> clause

select name , SurfaceArea from world.country order by region asc , SurfaceArea desc;

-- subquery can be used anywhere in select , where etc.
select name , population , (select population from country where name = 'Anguilla') AS Ang_population
from world.country;

create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;

-- EmpID , EmpName , Salary
-- emp as same salary as of department 
select empid , empname , salary , deptID FROM employees;

select empid , empname , salary from employees
where (deptid , salary) in (select deptid , avg(salary) from employees group by deptid);

-- Correlated subquery
-- A correleated subquery is a subquery where inner query is dependent on outer query  
-- and it is processed for each row
-- Slow --> Exceution time longer 
-- 1. Correlated subquery will be exceuted repeatitvely 
 
select e1.empid , e1.empname , e1.deptid , e1.salary
from employees as e1
where e1.salary > (select avg(salary) from employees as e2 where e1.deptid = e2.deptid);






 
