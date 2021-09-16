

use wschool

--inner join 

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID


--left join

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName


-- reight join
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID

--full join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULl JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName

--self join
USE subqueries
SELECT M.EmployeeID,M.firstname ,E.employeeid AS 'manager',E.firstname'manager_name' from employees E join employees M on E.EmployeeID=M.managerid 
select * from Employees