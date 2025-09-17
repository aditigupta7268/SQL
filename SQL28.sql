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

use regex1;
CREATE TABLE SampleTable (
    id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

INSERT INTO SampleTable (id, name, age, city) VALUES
(1, 'Akash', 25, 'Jaipur'),
(2, 'Priya', 24, 'Delhi'),
(3, 'Rahul', 26, 'Mumbai'),
(4, 'Sneha', 23, 'Bangalore');

CREATE UNIQUE INDEX name_idx ON SampleTable(name);

explain SELECT * from SampleTable where name = 'Sneha';


-- 2.
DROP TABLE SampleTable;
CREATE TABLE SampleTable (
    id INT primary key,
    name VARCHAR(50) unique,
    age INT,
    city VARCHAR(50)
);
INSERT INTO SampleTable (id, name, age, city) VALUES
(1, 'Akash', 25, 'Jaipur'),
(2, 'Priya', 24, 'Delhi'),
(3, 'Rahul', 26, 'Mumbai'),
(4, 'Sneha', 23, 'Bangalore');

SHOW indexes FROM SampleTable;

CREATE INDEX age_idx ON SampleTable(age) INVISIBLE;
SHOW INDEXES FROM SampleTable;

EXPLAIN SELECT * FROM SampleTable WHERE age = 25;

