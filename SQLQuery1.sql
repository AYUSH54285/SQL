create table amazon_orders(
order_id integer,
order_data date,
product_name varchar(50),
total_price decimal(5,2),
payment_method varchar(50),
);

drop table amazon_orders;


create table amazon_orders(
order_id integer,
order_date date,
product_name varchar(50),
total_price decimal(5,2),
payment_method varchar(50),
);

Select * from amazon_orders;

insert into amazon_orders values(1,'2022-10-01','baby Milk',30.5,'UPI');
insert into amazon_orders values(2,'2022-10-02','baby powder' ,130,'credit card'); 
Select * from amazon_orders;

select order_date,product_name from amazon_orders;

delete from amazon_orders;

Select * from amazon_orders;

-- day 2
create table amazon_orders(
order_id integer,
order_data date,
product_name varchar(50),
total_price decimal(5,2),
payment_method varchar(50),
);

drop table amazon_orders;

create table amazon_orders(
order_id integer ,
order_date date,
product_name varchar(50),
total_price decimal(5,2),
payment_method varchar(50),
);
drop table amazon_orders;

alter table amazon_orders alter column order_date datetime;

insert into amazon_orders values(1,'2022-10-01','baby Milk',30.5,'UPI');
insert into amazon_orders values(2,'2022-10-02','baby powder' ,130,'credit card'); 
insert into amazon_orders values(1,'2022-10-01','baby Milk',30.5,'UPI');
insert into amazon_orders values(2,'2022-10-02 10:12:12','baby powder' ,130,'credit card'); 

select * from amazon_orders;

-- add new column in table
alter table amazon_orders add username varchar(20);
 
select * from amazon_orders;

-- for deleting a column 
alter table amazon_orders drop column username;

select * from amazon_orders;

--constraints

create table a_orders(
-- not null constraint
order_id integer NOT NULL ,
order_date date,
product_name varchar(50),
total_price decimal(5,2),
--check constraint
payment_method varchar(50) check(payment_method in ('UPI', 'CREDIT CARD'))
);

insert into a_orders values(1,'2022-10-01','baby Milk',30.5,'UPI');
insert into a_orders values(2,'2022-10-02','baby powder' ,130,'credit card'); 
insert into a_orders values(1,'2022-10-01','baby Milk',30.5,'UPI');
insert into a_orders values(2,'2022-10-02 10:12:12','baby powder' ,130,'credit card'); 

select * from a_orders;

drop table a_orders;

create table a_orders(
-- unique constraint 
order_id integer NOT NULL UNIQUE ,
order_date date,
product_name varchar(50),
total_price decimal(5,2),
--check constraint
payment_method varchar(50) check(payment_method in ('UPI', 'CREDIT CARD')),
-- check <= constraint
discount integer check(discount<=20),
-- default constraint
category varchar(20) default 'Mens Wears'
);


insert into a_orders values(1,'2022-10-10','jeans',132,'UPI',20,'girls wears');
select *  from a_orders;
insert into a_orders values(1,'2022-10-10','shirt',132,'UPI',20,'girls wears');


create table a_orders(
-- unique constraint 
order_id integer NOT NULL UNIQUE ,
order_date date,
product_name varchar(50),
total_price decimal(5,2),
--check constraint
payment_method varchar(50) check(payment_method in ('UPI', 'CREDIT CARD')) default 'UPI',
-- check <= constraint
discount integer check(discount<=20),
-- default constraint
category varchar(20) default 'Mens Wears'
);

--default constraint
insert into a_orders(order_id,order_date,product_name,total_price,discount) values(1,'2022-10-10','toy',125.5,19);

select * from a_orders;

--we can also use default keyword in values
insert into a_orders(order_id,order_date,product_name,total_price,discount,category) values(2,'2022-10-10','toy',125.5,19,default);
select * from a_orders;

drop table a_orders;


create table a_orders(
-- unique constraint 
order_id integer UNIQUE,
order_date date,
product_name varchar(50),
total_price decimal(5,2),
--check constraint
payment_method varchar(50) check(payment_method in ('UPI', 'CREDIT CARD')) default 'UPI',
-- check <= constraint
discount integer check(discount<=20),
-- default constraint
category varchar(20) default 'Mens Wears'
);
--NULL can be inserted in unique
insert into a_orders(order_id,order_date,product_name,total_price,discount,category) values(NULL,'2022-10-10','toy',125.5,19,default);

select * from a_orders;
drop table a_orders;

create table a_orders(
-- unique constraint 
order_id integer,
order_date date,
product_name varchar(50),
total_price decimal(5,2),
--check constraint
payment_method varchar(50) check(payment_method in ('UPI', 'CREDIT CARD')) default 'UPI',
-- check <= constraint
discount integer check(discount<=20),
-- default constraint
category varchar(20) default 'Mens Wears',
--primary key
primary key(order_id)
);
--can not insert in primart key constraint
insert into a_orders(order_id,order_date,product_name,total_price,discount,category) values(NULL,'2022-10-10','toy',125.5,19,default);