
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