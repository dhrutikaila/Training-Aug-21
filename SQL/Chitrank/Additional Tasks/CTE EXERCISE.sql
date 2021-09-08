WITH my_cte(FirstName,LastName,Salary)
AS
(
	SELECT FirstName,LastName,Salary FROM Employees
)
SELECT FirstName,LastName,Salary FROM my_cte
ORDER BY FirstName


USE AdventureWorks2014
GO
WITH my_cte(SalesPersonID,NoOfOrders)
AS
(
	SELECT SalesPersonID,Count(*) FROM Sales.SalesOrderHeader
	WHERE SalesPersonID IS NOT NULL
	GROUP BY SalesPersonID
)
SELECT AVG(NoOfOrders) AS 'Average Sales' FROM my_cte


