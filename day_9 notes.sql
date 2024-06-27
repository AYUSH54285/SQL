--SUBQUERIES  - Query within Query

--it will give wrong average that is 230, because of average of same order_id 
SELECT AVG(sales) FROM Orders;

-- for solving with subquery we do 
--step1 - group of order_id and their total sales
SELECT order_id,SUM(sales) AS order_sales
FROM Orders
GROUP BY order_id

--step 2 - now finding avg of different order_id that is 458
SELECT AVG(order_sales) FROM (SELECT order_id,SUM(sales) AS order_sales
FROM Orders
GROUP BY order_id) AS orders_aggregated


--Now if we want the order_id whose sales are greater than avg sales
SELECT order_id
FROM orders
GROUP BY order_id
HAVING SUM(sales)> (SELECT AVG(order_sales) FROM (SELECT order_id,SUM(sales) AS order_sales
                   FROM Orders
                   GROUP BY order_id) AS orders_aggregated)


SELECT sales FROM orders
WHERE order_id='US-2021-163300'


-- subQuery in where
SELECT * FROM employee
SELECT * FROM dept

UPDATE employee SET dept_id=700 WHERE dept_id=500

--it will give dept_id 700 , but this not good way
SELECT * FROM employee 
WHERE dept_id NOT IN (100,200,300)
--it is good way
SELECT * FROM employee
WHERE dept_id NOT IN (SELECT dep_id FROM dept)


--another example
-- it will give all dept_id average salary
SELECT *,(SELECT AVG(salary) FROM employee) AS avg_sal FROM employee

SELECT *,(SELECT AVG(salary) FROM employee) AS avg_sal FROM employee
WHERE dept_id NOT IN (SELECT dep_id FROM dept)


--SUBQUERY IN JOINS

--join two table 
SELECT A.*,B.*
FROM
(SELECT order_id,SUM(sales) AS order_sales
FROM orders
GROUP BY order_id) A
INNER JOIN
(SELECT AVG(order_sales) AS avg_order_sales FROM
(SELECT order_id,SUM(sales) AS order_sales
FROM orders
GROUP BY order_id) AS orders_aggregated) B
ON 1=1--it will always true

-- updation (where condition in INNER JOIN)
SELECT A.*,B.*
FROM
(SELECT order_id,SUM(sales) AS order_sales
FROM orders
GROUP BY order_id) A
INNER JOIN
(SELECT AVG(order_sales) AS avg_order_sales FROM
(SELECT order_id,SUM(sales) AS order_sales
FROM orders
GROUP BY order_id) AS orders_aggregated) B
ON 1=1
WHERE order_sales >avg_order_sales


--example
SELECT * FROM employee


SELECT E.*,D.avg_dep_salary FROM
employee E
INNER JOIN
(SELECT dept_id ,AVG(salary) AS avg_dep_salary
FROM employee
GROUP BY dept_id) D
ON E.dept_id = D.dept_id



--COMMON TABLE EXPRESSION (CTE)
WITH A AS 
(SELECT team_1 AS team_name, CASE WHEN team_1=winner THEN 1 ELSE 0 END AS win_flag
FROM icc_world_cup
UNION ALL
SELECT team_2 AS team_name, CASE WHEN team_2=winner THEN 1 ELSE 0 END AS win_flag
FROM icc_world_cup)

SELECT team_name, COUNT(1) AS match_played, SUM(win_flag) AS matches_win, COUNT(1)-SUM(win_flag) AS matches_lost
FROM A
GROUP BY team_name

--example
WITH D AS (SELECT dept_id ,AVG(salary) AS avg_dep_salary
FROM employee
GROUP BY dept_id)

SELECT E.*,D.* FROM
employee E
INNER JOIN
D
ON E.dept_id = D.dept_id



--nested CTE
WITH D AS (SELECT dept_id ,AVG(salary) AS avg_dep_salary
FROM employee
GROUP BY dept_id)

,total_salary AS (SELECT SUM(avg_dep_salary) AS ts FROM D)

SELECT E.*,D.* FROM
employee E
INNER JOIN
D
ON E.dept_id = D.dept_id


--same query can be used many times using CTE
WITH order_wise_sales AS (SELECT order_id,SUM(sales) AS order_sales
FROM orders
GROUP BY order_id)

, B AS (SELECT AVG(order_sales) AS avg_order_sales FROM
order_wise_sales AS orders_aggregated) 

SELECT A.*,B.*
FROM
order_wise_sales A
INNER JOIN
B
ON 1=1
WHERE order_sales >avg_order_sales
