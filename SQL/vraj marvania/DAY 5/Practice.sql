--->Joins
--Inner join

	SELECT Orders.OrderID, Customers.CustomerName
	FROM Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID

	SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
	FROM ((Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
    INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID)

--Outer join
---Left Outer Join
      SELECT Customers.CustomerName, Orders.OrderID
	  FROM Customers
	  LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	  ORDER BY Customers.CustomerName;

---Right Outer join
     SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
	 FROM Orders
	 RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
	 ORDER BY Orders.OrderID;

---Full Outer Join
     SELECT Customers.CustomerName, Orders.OrderID
     FROM Customers
     FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
     ORDER BY Customers.CustomerName;

--Self-Join
    SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
	FROM Customers A, Customers B
	WHERE A.CustomerID <> B.CustomerID
	AND A.City = B.City
	ORDER BY A.City