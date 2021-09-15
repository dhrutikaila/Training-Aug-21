/* 1) INNER JOIN*/

/*Returns orderid, customername, orderdate of those customers who have placed orders*/
SELECT orders.OrderId, customers.CustomerName, orders.OrderDate FROM orders
INNER JOIN customers
ON orders.CustomerId = customers.CustomerId;

/*using alias*/
SELECT o.OrderId, c.CustomerName, o.OrderDate FROM orders o 
INNER JOIN customers c
ON o.CustomerId = c.CustomerId; 

/* INNER JOIN ON 3 TABLES*/
/* Returns orderid,customername,shipper name*/
SELECT o.OrderId,c.CustomerName,s.ShipperName FROM ((orders o INNER JOIN customers c ON o.CustomerId = c.CustomerId) INNER JOIN shippers s ON o.OrderId = s.OrderId);

/* 2) LEFT OUTER JOIN/LEFT JOIN */

/*Returns all customername from customer table, and orderdate of those customers who have placed orders*/
SELECT c.CustomerName, o.OrderDate FROM customers c
LEFT OUTER JOIN orders o 
ON c.CustomerId = o.CustomerId;

/* 3) RIGHT OUTER JOIN/RIGHT JOIN*/

/*Returns orderid of only those customers who have placed orders, and all customernames*/
SELECT o.OrderId,c.CustomerName FROM orders o RIGHT OUTER JOIN customers c ON o.CustomerId = c.CustomerId;

/* 4) CROSS JOIN */

/*Returns the cartesian product of all customernames and orderid  */
SELECT c.CustomerName,o.OrderId FROM customers c CROSS JOIN orders o;

/* 5) SELF JOIN */
/*Returns customernames who are from same country*/
SELECT c1.CustomerName AS Cname1, c2.CustomerName AS Cname2, c1.Country FROM customers c1 JOIN customers c2 ON c1.Country = c2.Country AND c1.CustomerId <> c2.CustomerId;  