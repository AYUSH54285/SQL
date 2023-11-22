select * from Orders;
--for specific columns
select order_id,order_date from orders;
-- top 
select top 5 order_id, order_date from orders;
--asc order
select * 
from orders
order by order_date;
--top and desc order both
select * 
from orders
order by order_date desc;
--distinct
select distinct Ship_Mode from orders;
--distinct for multiple columns-- it will combine the distinct of all given column
select distinct ship_mode , segment from orders;
--here it will remove only those rows which are completely different but here there is no different row bcoz of different row_id
select distinct * from orders
order by Order_Date desc;
--filters
select * from orders
where ship_mode = 'first class';

select * from orders 
where order_date = '2020-12-08';

select top 5 order_date , quantity
from orders
where quantity>=5
order by quantity;

select * from orders
where order_date between '2020-12-08' and '2020-12-10'
order by order_date desc;

select * from orders
where Ship_Mode in ('first class' , 'same day');

select * from orders
where quantity in (3,4,5)
order by Quantity desc;

select distinct ship_mode 
from orders
where Ship_Mode not in ('first class' , 'same day');

--normally we use operator for integer but we can also use for string but in this case it will compare ascii value of first character
select distinct ship_mode 
from orders
where ship_mode > 'first class';

--use of and
select order_date,ship_mode,segment 
from orders
where ship_mode = 'first class' and segment = 'consumer';

--use of or
select order_date,ship_mode,segment 
from orders
where ship_mode = 'first class' or segment = 'consumer';

select * from orders
where Quantity>5 and Order_Date < '2020-11-08';

--type casting function
select cast(order_date as date) as order_date_new , *
from orders
where cast(order_date as date) = '2020-11-08';

-- adding new column of ratio
select *, profit/sales as ratio
from orders;

select *, profit/sales as ratio , profit+sales as total 
from orders;

-- pattern matching  like   operator 
select order_id,order_date,customer_name
from orders
where Customer_Name like 'chris%';

select order_id,order_date,customer_name
from orders
where Customer_Name like '%ver%';

select order_id,order_date,customer_name
from orders
where Customer_Name like '_l%';

select order_id,order_date,customer_name
from orders
where Customer_Name like 'C[a-o]%'
order by Customer_Name;

-- second character can be albo 
select order_id,order_date,customer_name
from orders
where Customer_Name like 'C[albo]%'
order by Customer_Name;

-- for NOT we use ^     means albo should not be second character
select order_id,order_date,customer_name
from orders
where Customer_Name like 'C[^albo]%'
order by Customer_Name;
