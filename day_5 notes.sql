
select * from returns;

--copying return dataset from master database to namastesql database
select * into namastesql.dbo.returns from returns;
 
 --now checking the database has dataset or not  
 select * from returns;

 --database joins
 select * from Orders;

 -- creating new table returns
 create table returns(
 order_id varchar(20),
 return_reason varchar(20)
 );

 --copying the data from returns_back to returns
 insert into returns
 select * from returns_back;

 --join the orders and returns table where order_id is common
 select o.order_id,r.return_reason
 from orders o
 inner join returns r on o.order_id = r.order_id;
  

  create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);
select * from employee;

create table dept(
    dep_id int,
    dep_name varchar(20)
);
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');
select * from dept;


--cross join
select * from 
employee,dept
order by employee.emp_id;


--another way to cross join
select * from 
employee
inner join dept on 1=1
order by employee.emp_id;

--inner join
select e.emp_id , e.emp_name , e.dept_id , d.dep_name
from employee as e
inner join dept as d on e.dept_id = d.dep_id;

--left join
select e.emp_id , e.emp_name , e.dept_id , d.dep_name
from employee as e
left join dept as d on e.dept_id=d.dep_id;

--making right join by only reversing the table in query
select e.emp_id , e.emp_name , e.dept_id , d.dep_name
from dept as d
left join employee as e on e.dept_id=d.dep_id;

--right join
select e.emp_id , e.emp_name , e.dept_id , d.dep_name
from employee as e
right join dept as d on e.dept_id=d.dep_id;

--making left join by only reversing the table in query
select e.emp_id , e.emp_name , e.dept_id , d.dep_name
from dept as d
right join employee as e on e.dept_id=d.dep_id;


--full outer join= it will consider union of inner + left + right joins
select e.emp_id , e.emp_name , e.dept_id , d.dep_id , d.dep_name
from employee as e
full outer join dept as d on e.dept_id=d.dep_id;


--note we can make as many joins we want


--Assignment Solution

--4
Select d.dep_name
from employee e
inner join dept d on e.dept_id=d.dep_id
group by d.dep_name
having count(1)=count(distinct e.salary);
