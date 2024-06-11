create database Student_detail;

use Student_detail;

create table Student_Info(
Student_Id int,
First_name varchar(100),
Last_name varchar(100),
Course_name varchar(50),
Mobile_Number varchar(11),
Address varchar(150),
Addmission_date date
);

desc student_info;

Alter Table Student_Info
Add course_comp varchar(100);

-- Dropping a coloumn

Alter Table Student_Info
Drop Column course_comp;

-- Changing a datatype of a existing table

Alter Table Student_Info
Modify First_name char(60);

-- Renaming a column name

ALter Table Student_Info
Change Column Address Student_Address varchar(200);


-- Insert

Insert Into Student_Info(Student_Id,First_name,Last_name,Course_name,Mobile_number,Student_address,Addmission_date)
Values (1,"Sakshi","Angwalkar","B.com","9856741256","Andheri","2024-03-13 "),
(2,"Raj","Sawant","Science", "5614236561","Vile Parle", "2024-02-12"),
(3,"John","Parab","ART", "5614225894","Parel", "2024-01-12");

-- Inserting without command line

insert into student_info
values (4,"Alex","Dsouza","Science","8512784569","Malad","2024-03-12");

desc product_details;

create table product_details(
product_Id int,
product_name varchar(100),
product_price varchar(50)
);

insert into product_details
values (101,"Soap","20"),
(102,"Tub","50");

Truncate table product_details;

drop table product_details;

select * from student_info;

select first_name, Last_name
from student_info;

update student_info
set student_address="Vile Parle"
where student_id=102;

update student_info set student_id = case when student_id=1 then 101
when student_id = 2 then 102
when student_id = 3 then 103
when student_id = 4 then 104
else student_id
end ;

-- delete

delete from student_info where student_id=104;

-- constraints key

-- not null
create table employee(
emp_id int not null,
emp_name varchar(100) not null,
emp_age int,
pincode int unique,
primary key (emp_id)
);

desc employee;
DROP TABLE EMPLOYEE;
create table person(
id int Primary key,
name varchar(100),
age int,
check (age >=18)
);
desc person;

alter table person
add lastname varchar(100);

insert into person
values (12, "Alex",  18, "abc");

-- composite key
create table product(
prod_id int not null,
prod_name varchar(100),
prod_manufacturer varchar(100),
primary key (prod_id, prod_manufacturer)
);

desc product;

select * from student_info
where student_address="bandra" or student_address="vile parle";


select * from student_info;







