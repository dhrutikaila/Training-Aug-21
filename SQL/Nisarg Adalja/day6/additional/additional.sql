/* Subquery is a query within a query. These subqueries can reside in the WHERE clause, the FROM clause, or the SELECT
clause. */

/* SYNTAX where subquery is in WHERE
SELECT "column_name1"
FROM "TABLE_name1"
WHERE "column_name2" [Comparison Operator]
(SELECT "column_name3"
FROM "TABLE_name2"
WHERE "condition"); */

/**/
--Subquery in WHERE
use master

insert INTO sale values(1,'2','2020-08-13','2020-08-20','online','2','202',200.00,100,10.00,50.00);
insert INTO sale values(2,'3','2020-08-13','2020-08-20','online','3','203',200.00,100,10.00,50.00);
insert INTO sale values(3,'4','2020-08-13','2020-08-20','online','4','205',200.00,100,10.00,50.00);

SELECT * FROM customer;

SELECT * FROM sale
WHERE customer_id IN
(SELECT DISTINCT cust_id
FROM customer WHERE age >20)

-- Subquery in FROM

CREATE TABLE product(
product_id varchar(50) not null,
product_name varchar(100),
category varchar(100),
);
insert INTO product values('202','camera','electronics');
insert INTO product values('203','mobile','electronics');
insert INTO product values('205','TABLEt','electronics');


SELECT
a.product_id ,
a.product_name ,
a.category,
b.quantity
FROM product AS a
LEFT JOIN (SELECT product_id,
SUM(quantity) AS quantity
FROM sale GROUP BY product_id) AS b
ON a.product_id = b.product_id
ORDER BY b.quantity desc;

/*
SELECT customer_id,
order_line,
(SELECT first_name
FROM customer
WHERE sale.customer_id = customer.cust_id)
FROM sale
ORDER BY customer_id;*/

/* There are a few rules that subqueries must follow −
• Subqueries must be enclosed within parentheses.
• A subquery can have only one column in the SELECT clause, unless multiple
columns are in the main query for the subquery to compare its SELECTed
columns.
• An ORDER BY command cannot be used in a subquery, although the main
query can use an ORDER BY. The GROUP BY command can be used to
perform the same function as the ORDER BY in a subquery.
• Subqueries that return more than one row can only be used with multiple
value operators such as the IN operator.
• The SELECT list cannot include any REFERENCES to values that evaluate to a
BLOB, ARRAY, CLOB, or NCLOB.
• A subquery cannot be immediately enclosed in a set function.
• The BETWEEN operator cannot be used with a subquery. However, the
BETWEEN operator can be used within the subquery. */


/* Views */

/* VIEW is not a physical TABLE, it is a virtual TABLE CREATEd by a query joining one or more TABLEs.*/

/* syntax: 
CREATE [OR REPLACE] VIEW view_name AS
SELECT columns
FROM TABLEs
[WHERE conditions];*/

/* CREATE the view */
CREATE view logistics as SELECT a.order_id,b.name,b.city,b.state FROM sale as a left join customer1 as b on a.customer_id=b.customerid; 

SELECT * FROM logistics

/* to delete view */
DROP VIEW logistics;

/* to UPDATE the view */
UPDATE logistics
SET Country = US
WHERE Country = ‘United States’;


--note
/* A view is a virtual TABLE. A view consists of rows and columns just like a TABLE. The
difference between a view and a TABLE is that views are definitions built on top of
other TABLEs (or views), and do not hold data themselves. If data is changing in the
underlying TABLE, the same change is reflected in the view. A view can be built on top
of a single TABLE or multiple TABLEs. It can also be built on top of another view. In the
SQL CREATE View page, we will see how a view can be built.
Views offer the following advantages:
1. Ease of use: A view hides the complexity of the database TABLEs FROM end users.
Essentially we can think of views as a layer of abstraction on top of the database
TABLEs.
2. Space savings: Views takes very little space to store, since they do not store actual
data.
3. Additional data security: Views can include only certain columns in the TABLE so
that only the non-sensitive columns are included and exposed to the end user. In
addition, some databases allow views to have different security settings, thus hiding
sensitive data FROM prying eyes. */


/* VIEW can be UPDATEd under certain conditions which are given below −
• The SELECT clause may not contain the keyword DISTINCT.
• The SELECT clause may not contain summary functions.
• The SELECT clause may not contain set functions.
• The SELECT clause may not contain set operators.
• The SELECT clause may not contain an ORDER BY clause.
• The FROM clause may not contain multiple TABLEs.
• The WHERE clause may not contain subqueries.
• The query may not contain GROUP BY or HAVING.
• Calculated columns may not be UPDATEd.
• All NOT NULL columns FROM the base TABLE must be included in the view in
order for the INSERT query to function*/