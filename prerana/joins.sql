use student_detail;

create table course(
course_id int primary key,
course_name varchar(100),
course_fees int,
course_duration int);

insert into course
values (101,"Data Science", 15000,6),
(102,"Web Development", 10000,8),
(103,"Cyber Security", 30000,9),
(104, "Web designing", 25000,6),
(105, "Azure", 40000,6);

create table student(
stud_id int primary key,
stud_name varchar(100),
stud_address varchar(100),
course int ,
admission_date date,
foreign key(course) references course(course_id)
);

insert into student
values (1,"Alex","Borivali",101,"2024-09-11"),
(2,"Smith","Andheri","104","2024-01-09"),
(3,"Peter","Dadar","103","2024-03-12"),
(4,"Henry","Andheri",102,"2023-10-01"),
(5,"Harry","Malad","105","2024-02-15"),
(6,"Ruchit","Borivali",101,"2024-01-02"),
(7,"Pooja","Dadar",105, "2023-11-14"),
(8,"Ranchit","Malad",104,"2023-12-07"),
(9,"Sakshi","Khar",103,"2023-04-12"),
(10,"Raj","Dadar",102,"2024-01-15");

select course from student
where stud_id=4;

select course_name from course where course_id=(select course from student where stud_id=4);

select course_name from course where course_id in (select course from student where stud_id between 1 and 8);

select * from student;
select * from course;

select stud_id, stud_name,course_name
from student
inner join course
on( course.course_id = student.course);

insert into course
values(106,"Data engineer",10000,6);

select stud_id,stud_name,course_name
from student
right join course
on(student.course = course.course_id);

select course_name from course where course_id=(select course from student where stud_id=4);

select * 
from student
left join course
on(student.course = course.course_id)
Union
select *
from student
right join course
on (student.course = course.course_id);


select student.stud_name,course.course_name
from student
cross join course;

select course.course_name,count(student.stud_name)
from student
inner join course
on(student.course = course.course_id)
group  by course.course_name;


select student.stud_address,sum(course.course_fees)as fees
from student
inner join course
on(student.course= course.course_id)
group by stud_address
order by fees desc
limit 1;

create table emp(
emp_id int primary key,
emp_name varchar(100),
job_title varchar(100),
manager_id int
);

insert into emp
values (101,"Alex","CEO",Null),
(102,"Smith","Software Engineer",101),
(103,"Peter","Web Developer",102),
(104,"Tony","Web Deginer",103),
(105,"Harry","Junior Developer",104),
(106,"Henry","Marketing Head",101),
(107,"Ruchit","Manager",101),
(108,"Ranchit","Sales Manager",107),
(109,"Palak","Intern",105),
(110,"Rucha","Sales Representative",106);

select * from emp;

-- self join

select e1.emp_name,e2.emp_name as manager_name
from emp e1
join emp e2
on e1.manager_id = e2.emp_id;

-- views


create view emp_view as
select * from emp;

create or replace view emp_view as
select * from emp where manager_id=103;


create or replace view emp_view as
select * from emp where manager_id=104;



