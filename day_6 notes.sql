select * from employee;

select * from dept;


select e1.emp_id,e1.emp_name,e2.emp_name as manager_name
from employee e1
inner join employee e2 on e1.manager_id = e2.emp_id;
  

select e1.emp_id,e1.emp_name,e2.emp_name as manager_name
from employee e1
inner join employee e2 on e1.manager_id = e2.emp_id
where e1.salary > e2.salary


--functions
select dept_id , avg(salary) as avg_sal
from employee
group by dept_id;

-- STRING FUNCTION
select dept_id , STRING_AGG(emp_name,',') as list_of_emp
from employee
group by dept_id;

--sort in STRING FUNCTION
select dept_id , STRING_AGG(emp_name,'|') WITHIN GROUP (order by salary) as list_of_emp
from employee
group by dept_id;

-- DATE FUNCTION
select order_id , order_date,DATEPART(month,order_date) as year_of_order_date
from orders;

-- DATEPART FUNCTION use for finding a particular year of order_id 
select order_id , order_date,DATEPART(year,order_date) as year_of_order_date
from orders
where DATEPART(year,Order_Date)=2020;


-- DATENAME FUNCTION
select order_id, order_date, datepart(yy,order_date) as year_of_order_date
,datepart(month,order_date) as month_of_order_date
,datepart(week,order_date) as week_of_order_date
,DATENAME(month,order_date) as month_name --for getting month name in string we use DATENAME FUNCTION
,DATENAME(weekday,order_date) as week_name --for getting week name in string we use DATENAME FUNCTION
from orders;


-- DATEADD FUNCTION
select order_id, order_date
,dateadd(day,5,order_date) as order_date_5
,dateadd(week,5,order_date) as order_date_week_5
,dateadd(week,-5,order_date) as order_date_week_5_minus-- subtract 5 week
from orders;


-- DATEDIFF FUNCTION
select order_id, order_date,ship_date
,datediff(day,order_date,ship_date) as date_diff_days
,datediff(week,order_date,ship_date) as date_diff_week
from orders;


-- CASE WHEN
select order_id, profit,
CASE
when profit<100 then 'low prfit'
when profit<250 then 'medium profit'
when profit<400 then 'high profit'
else 'very high profit'
END as profit_category
from orders;








-- Assignment 

-- Run the following command to add and update dob column in employee table
alter table  employee add dob date;
update employee set dob = dateadd(year,-1*emp_age,getdate())


select * from orders;
select * from returns;

-- 2
select *
from orders o
left join returns r on o.order_id = r.order_id




