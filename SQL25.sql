-- TCL (transaction control language)
-- trnsaction --> a set of logical statement / opreations.
-- used for consisentency in database.
-- transaction (start / stop - end)
-- transaction (commit) --> to save permanently in database 

-- by default --> auto commit is there

select @@autocommit;
use regex1;
select * from courses;

insert into courses values(777,'abc','science');
set @@autocommit = 0;

insert into courses values(778,'abc','science');
select * from courses;

set @@autocommit = 1;

/*
Transaction start:
-- start transaction
-- autocommit is disable
*/

-- dml opreations (transaction pending / this opreations will temporary when transaction start)
/*
transaction stop:
-- commit , rollback
-- ddl statement
*/  

set @@autocommit = 0;
insert into courses values(900,'kamal','kamal khan');
update courses set coursename = 'regex';
select * from courses;

rollback;
select * from courses;

insert into courses values(900,'kamal','kamal khan');
select * from courses;
commit;

select * from courses;

set @@autocommit = 1;
start transaction;
insert into courses values(911,"kamal1",'kamal khan1');
create table tushar123(id int);  -- using ddl statement , making / saving changes in database.
select * from courses; 


-- savepoint --> is a reference to revert the changes upto a specific point
start transaction;
insert into courses values(912,'a','ab');
insert into courses values(913,'b','bd');
savepoint courses_insert_chk;
update courses set coursename = "regex" where courseid = 913;
rollback to courses_insert_chk;
select * from courses;

  