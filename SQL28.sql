-- Indexing ---> is a mechanism to optimize your sql query , as searching
-- in unstructured database is time consuming   
use regex1;
drop table test;
create table test(id int primary key, name varchar(50));

insert into test values(10,"abc") , (11,"def") , (15,"ghi") , (18,"ujjwal") , (14,"piyush");

explain select * from test where name = "ujjwal";
select * from test;

-- Indexing --> This is mechanism to access your data faster way from your database
create index test_idx on test(name);

show indexes from test;

drop index test_idx on test;
create index test_idx on test(name,id);
explain select * from test where name = "ujjwal";
explain select * from test where id = 18 and name = "ujjwal";