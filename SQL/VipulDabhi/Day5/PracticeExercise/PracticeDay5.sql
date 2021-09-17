												--Joins
SELECT * FROM Customer
SELECT * FROM Salesman
SELECT* FROM OrderDetails

--From the following tables write a SQL query to find those salespersons who received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, commission.
SELECT c.CustName AS "Customer Name", c.City, s.SalesmanName , s.Commission 
FROM Customer c INNER JOIN Salesman s 
ON s.SalesmanId=s.SalesmanId WHERE s.Commission>.12;

--Make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come
SELECT * FROM OrderDetails o JOIN Customer c ON o.SalesmanId = c.SalesmanId JOIN Salesman s ON c.SalesmanId = s.SalesmanId

--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.
SELECT c.CustName,c.City, o.OrderNo,o.OrderDate,o.PurchseAmount  
FROM Customer c LEFT OUTER JOIN OrderDetails o ON c.SalesmanId = o.SalesmanId

--Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.
SELECT c.CustName,c.City,c.Grade, s.SalesmanName, s.City FROM Customer c RIGHT OUTER JOIN Salesman s 
ON s.SalesmanId = c.SalesmanId ORDER BY s.SalesmanId

--Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list
SELECT c.CustName,c.City, o.OrderNo,o.OrderDate,o.PurchseAmount 
FROM Customer c FULL OUTER JOIN OrderDetails o ON c.CustomerId = o.CustomerId

--Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that salesman who belongs to a city.
SELECT * FROM Salesman s CROSS JOIN Customer c WHERE s.City IS NOT NULL

-- Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade.
SELECT * FROM Salesman s CROSS JOIN Customer c 
WHERE s.City IS NOT NULL AND C.Grade IS NOT NULL AND  s.City<>c.City






