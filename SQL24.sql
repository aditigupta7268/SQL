-- Normalization
-- SET opreations --> used to combine 2 or more select statements in SQL 
-- UNION  --> dont consider duplicate values
use sakila;
select * from actor where actor_id between 1 and 3
union
select * from actor where actor_id between 3 and 5;

-- UNION ALL ---> keeps duplicate values also
select * from actor where actor_id between 1 and 3
union all
select * from actor where actor_id between 3 and 5;

-- INTERSECT ---> to get common values in two  
-- EXCEPT ---> to get difference of the values in two select statements
select * from actor where actor_id between 1 and 3
intersect
select * from actor where actor_id between 3 and 5;

select * from actor where actor_id between 1 and 3
except
select * from actor where actor_id between 3 and 5;

-- recursive cte
-- is a feature where we cte repeatedly based on a condition untikl the condition is matched used to find out 
-- hierarchical or tree structure . eg --> if employee wants to find out who is his/her boss.alter

with cte as
(select 1 as num)

select * from cte;

with recursive cte as
(
select 1 as num
union
select (num+1) from cte where num < 6
)
select * from cte;

-- factorial of a number using recursive cte
use sakila;
with recursive cte1 as 
(
select 1 as i , 1 as factorial
union
select i+1 , factorial*(i+1) from cte1 where i<6
)
select * from cte1;

-- 
use regex1;
drop table employees;
CREATE TABLE employees(
employee_id int primary key,
emp_name varchar(100), 
manager_id int null
);


INSERT INTO employees (employee_id, emp_name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;

with recursive cte as
(select employee_id, emp_name, manager_id, 1 as levels
from employees as e where manager_id is null 
union
select etemp.employee_id, etemp.emp_name, etemp.manager_id,(levels+1) from employees AS etemp JOIN cte  where cte.employee_id = etemp.manager_id)
select * from cte;

-- VIEWS , why we use views , views vs cte , materialized view and non materialized view
use sakila;
create view temp as
(select first_name , count(*) from actor where actor_id > 10
group by first_name order by count(*) desc); 

select * from temp;

create view temp2 as
(select first_name , last_name from actor);

select * from temp2;

-- temporary table
create table factors as(
select actor_id , first_name , last_name from actor where actor_id < 7);

select * from factors;


-- view --> insert , update 
-- view2 --> filter condition (actor_id , first_name) insert , update

create view temp3 as(
select * from actor
);

INSERT INTO temp3 (actor_id, first_name, last_name, last_update)
VALUES (210, 'Sahil', 'Sharma', NOW());

select * from temp3;

select * from actor;   -- changes reflect in original table made in view

alter view temp4 as(
select last_name , first_name from  actor);

select * from temp4;

insert into temp4(last_name , first_name)
values('Raj','Sharma'); 

update temp4
SET first_name = 'Aditi'
WHERE actor_id = 210;

select * from temp4;

select * from actor;

-- temporary table are for the session only.
alter view temp5 as(
select actor_id , first_name from actor);

insert into temp5(actor_id,first_name)
values(222,'Elive');




create temporary table xyz as(
select actor_id , first_name , last_name from actor where actor_id < 7);


select * from xyz;

-- view 
-- updatable
-- cte
-- not updatable

-- temporary table
-- act as a normal table it is updatable.


-- difference between cte vs views vs temporary table
