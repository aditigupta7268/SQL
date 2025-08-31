create table t1(id int);
insert into t1(id) value(1),(2),(3),(4),(5);
create table t2(id int);
insert into t2(id) value(1),(2),(1),(3),(4);

select * from t1;
select * from t2;
-- select col1 col2 from left table 
-- inner join right_table on left_table.col_name = right_table.col_name
select t1.id from t1 
inner join t2 
on t1.id = t2.id;


SELECT LOWER(CONCAT(c.first_name, ' ', c.last_name)) AS full_name,SUM(p.amount) AS total_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 1. List all films with their language name
-- 2. get all staff members with their store names
-- 3. dislay all inventory items with the film name
-- 4. list all adress with their city names
-- 5. list all films with their actors and language
-- 6. display staff details with store_address , city , country  