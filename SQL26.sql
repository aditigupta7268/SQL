-- DCL (Data control Language)
-- Authenication and Authorization

-- Authenication ---> data validation 
-- Authorization --> Permission to users for accessing data in database

select * from mysql.user;
create user test@'192.168.%' identified by 'test123';
create user yash identified by 'yash123';

-- GRANT --> give privlieges / permission to a user

create database ecommerce;
use ecommerce;
create table customer(id int, cname varchar(20));
insert into customer values(1,"abhi") , (2,"naina");
select * from customer;

grant SELECT (id) on ecommerce.customer to yash;
show grants for yash;
revoke all privileges on ecommerce.* from yash;

grant SELECT , INSERT ON ecommerce.* to yash;

CREATE ROLE 'sales';
CREATE USER aditya identified by 'adi@123';

GRANT 'sales' TO aditya;
GRANT 'sales' TO yash;

GRANT SELECT , INSERT ON ecommerce.customer TO 'sales'; 
-- object owner ship --> if root user gives all privilges to yash_user , yash_user cannot give all privilges to other user. 
-- in Mysql object owner ship is not supported. 
SELECT * FROM mysql.role_edges;