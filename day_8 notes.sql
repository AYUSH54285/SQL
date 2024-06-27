-- views- encapsualtion, shows any particualar rows
CREATE VIEW Order_vw AS SELECT * FROM Orders;

SELECT * FROM Order_vw;

--we can also create view in present database from another database 
CREATE VIEW emp_master AS
SELECT * FROM master.dbo.dept;


--REFRENCIAL integrity constraints/foreign key constraint - A referential integrity constraint is also known as foreign key constraint. 
--A foreign key is a key whose values are derived from the Primary key of another table.

SELECT * FROM employee;
SELECT * FROM dept;

--first we have to make dept_id a primary key then we can use this table column as a REFRENCIAL integrity constraint
-- step1- make all dep_id is NOT NULL
ALTER TABLE dept ALTER COLUMN dep_id INT NOT NULL
--step 2 - make all dep_id PRIMARY KEY
ALTER TABLE dept ADD CONSTRAINT primary_key PRIMARY KEY (dep_id);

--now create a new table where we use refrencial / Foreign Key constraint
CREATE TABLE emp(
emp_id int,
emp_name VARCHAR(20),
dep_id int REFERENCES dept(dep_id) 
);

SELECT * FROM dept;
SELECT * FROM emp;

--it will not give any error
INSERT INTO emp VALUES(101,'RAHUL',100);

--it will give error because of FOREIGN KEY CONSTRAINT
INSERT INTO emp VALUES(102,'SHIVAM',500);

--now we update dept table and add dep_id = 500 and then it will not give any error
INSERT INTO dept VALUES(500,'Trainee');
INSERT INTO emp VALUES(102,'SHIVAM',500);



CREATE TABLE dept1(
id INT IDENTITY(1,1), -- IDENTITY start with 1 and automatic increase by 1  
dep_id INT NOT NULL,
dept_name VARCHAR(10)
);

INSERT INTO dept1 VALUES(100,'HR');

SELECT * FROM dept1;
INSERT INTO dept1 VALUES(200,'Analytics');

