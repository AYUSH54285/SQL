select * from orders

--len function
select order_id , customer_name , len(customer_name) as len_name
from orders;

--left & right function
select order_id , customer_name 
,left(customer_name,4) as left_name_4
,right(customer_name,5) as right_name_5
from orders;

--substring function
select order_id , customer_name 
,left(customer_name,4) as left_name_4
,right(customer_name,5) as right_name_5
,substring(customer_name,4,4) as substr_4_4
from orders;

--charindex function
select order_id, customer_name
,charindex('u',customer_name) as n_position
from orders;

--concat function
select order_id, customer_name
,concat(order_id,'_',customer_name) as concat_order_id_customer_name
from orders;

--replace function -- it will take complete string
select order_id, customer_name
,replace(customer_name,'A','B') as replace_A_B
from orders;

--translate function -- it will take character wise character for translate
select order_id, customer_name
,translate(customer_name,'ABC','XYZ') as translate_ABC
from orders;

--isnull function
select order_id,city,isnull(city,'unknown') as new_city
from orders
where city is NULL
order by city;

--cast function
select top 5 order_id,sales,cast(sales as int) as sales_int
from orders;

--round function
select top 5 order_id,sales,round(sales,1) as sales_int2
from orders;

--coalesce function
select order_id,city,state,coalesce(city,state,region,'unknown') as neww_city
from orders
where city is NULL
order by city;



--set Queries

--union all & union
create table orders_west(
order_id int,
region varchar(50),
sales int
);
create table orders_east(
order_id int,
region varchar(50),
sales int
);

insert into orders_west values(1,'west',100),(2,'west',200)
insert into orders_east values(3,'east',100),(4,'east',300)
insert into orders_west values(3,'east',100)
insert into orders_west values(1,'west',100);

select * from orders_east;
select * from orders_west;

--union all
select * from orders_west
union all
select * from orders_east;

--union
select * from orders_west
union
select * from orders_east;

--intersect
select * from orders_west
intersect
select * from orders_east;

--except/minus
select * from orders_west
except
select * from orders_east;