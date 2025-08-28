-- constraints --> rules apply to table  to make data ---> accurate ---> invalud restrict 

-- not null constraint
use regex1;
create table test1(id int , salary int not null);
insert into test1 values(10,9000);
insert into test1 values(11,null); -- error here salary cant be null 
insert into test1 values(null,1881);
select * from test1;

-- default
drop table test1;
create table test2(id int default 0 , salary int not null);
insert into test2(salary) values(1881);
insert into test2 values(10,900);
select * from test2;

-- unique  --> will not allow duplicate values

create table test3(id int , salary int default 100 unique);
insert into test3 values(10,900);
insert into test3(id) values(1999991);

select * from test3;
insert into test3(id) values(20012);  -- 100 already stored with id 1999991 unique constraint restrict for duplicate entry

-- 3. primary 
use regex1;
create table test4(id int primary key , salary int);
insert into test4 values(10,900);
insert into test4 values(10,9001); -- duplicate error not allowed
insert into test4(id) values(null); 
 
 select * from test4;
 
 use regex1;
 drop table courses1;
 create table courses1(course_id int primary key , cname varchar(100) unique);
 insert into courses1 values(10,'DSA') , (11,'Python');

 create table studentinfo(id int primary key , sname varchar(20) , courseid int , foreign key (courseid) references courses1(course_id));
 
 insert into studentinfo values(1,'tushar',10);
 insert into studentinfo values(2,'aman',11);
 insert into studentinfo values(3,'ama12n',13);
 
 select * from studentinfo;
 use regex1;
 drop table courses2;
 drop table student3;
 create table student3(id int , sname varchar(20), primary key(id,sname) , courseid int , foreign key (courseid) references courses2(course_id) , cname varchar(20) , foreign key (cname) references courses2(cname));
 
 create table courses2(course_id int primary key , cname varchar(20) unique);
 insert into courses2 values(10,'DSA');
 insert into courses2 values(11,'Python');
 
 desc student3;
 
 desc students3;
 
 -- data types
 use regex1;
 create table yash1(id int unsigned);
 insert into yash1 values(10);
 select * from yash1;
 
 -- tiny int (1 byte)
 -- small int (2 byte)
 -- medium int (3 byte)
 -- big int (2**64)
 
 -- 2. string value ( char , varchar)
 drop table yash1;
 create table yash1(name char(10));
 insert into yash1(name) values('abc');
 insert into yash1 values('abc     ');
 select name , length(name),char_length(name) from yash1;
 
 -- char --> truncate all white spaces at the last upto to the size of columns
 -- length --> gives byte size
 
 -- char --> fixed size character length 
 -- varchar ---> dynamic size --> reuse the remaining memeory later on 


-- 3.date --
drop table yash1;
create table yash1(dob date);
insert into yash1 values(curdate());
insert into yash1 values('2026-01-30');
insert into yash1 values('2020-02-30');

select * from yash1;
insert into yash1 values(now());

create table yash2(dob timestamp);
insert into yash2 values(now());

select * from yash2;

-- timestamp  vs datetime
-- timestamp ---> has a specific range of values --> (4 byte)  
-- datetime ---> storage --> (8 byte)

-- BLOB ---> can store any type of data (image , audio , video , etc) 

-- how to store the image in RDMS system
 
 -- FLOAT 
 create table yash4(salary float);
 insert into yash4 values(10.2);
 insert into yash4 values(20.123456789);
 
 select * from yash4;
 
 create table yash5(salary double(5,2));
 insert into yash5 values(10.2);
 insert into yash5 values(20.123456789);
 
 select * from yash5;
 
 create table t3(salary double(5,2));
 
insert into t3 values(10.2);
insert into t3 values(10.234);
insert into t3 values(103.32);
insert into t3 values(103.5452);
 
 
 
 
 

 
 
 
 
 
 
