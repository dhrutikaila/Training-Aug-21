
--SubQueries

--basics
--is sql statement used within another sql statement
--is nested inside the where or having clause of the select,insert,update and delete statements

USE SampleTable


--name of the employee whose salary is more than 'John'
SELECT FirstName
FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE FirstName='John' AND LastName='Chen')

--we can specify diff kind of condition on subuqueries by using IN and EXSITS

USE AdventureWorks2019

--IN
SELECT BusinessEntityID
FROM HumanResources.Employee e JOIN Person.Address a ON e.BusinessEntityID = a.AddressID
WHERE a.AddressID IN (
	SELECT AddressID FROM Person.Address WHERE City = 'bothell'
)

--EXISTS
SELECT BusinessEntityID,JobTitle FROM HumanResources.Employee as e
WHERE EXISTS (
SELECT * FROM HumanResources.EmployeeDepartmentHistory as ed
WHERE ed.BusinessEntityID = e.BusinessEntityID AND DepartmentID = 4
)


--nested Sub-Queries

SELECT Name FROM Person.CountryRegion
WHERE CountryRegionCode = (
	SELECT CountryRegionCode FROM Person.StateProvince
	WHERE StateProvinceID = (
		SELECT StateProvinceID FROM Person.Address
		WHERE City = 'Abingdon'
	)
)


--Co-related subQuaries
--a subQuery which depend on outer Query

USE SampleTable

SELECT * FROM Employees	e
WHERE Salary = (
	SELECT max(Salary)
	FROM Employees WHERE DepartmentID = e.DepartmentID
)

--msdocs subquaries
--A subquery is a query that is nested inside a SELECT, INSERT, UPDATE, or DELETE statement, or inside another subquery.
--A subquery can be used anywhere an expression is allowed. 

USE AdventureWorks2019

--example a subquery is used as a column expression named MaxUnitPrice in a SELECT statement.
SELECT Ord.SalesOrderID
	,Ord.OrderQty
	,(SELECT MAX(Orddet.UnitPrice) 
	 FROM Sales.SalesOrderDetail AS Orddet
	 WHERE Ord.SalesOrderID = Orddet.SalesOrderID ) AS MaxUnitPrice
FROM Sales.SalesOrderDetail AS Ord;



--subqueries can be alternatively formulated as joins
--in some cases where existence must be checked, a join yields better performance. Otherwise, the nested query must be processed for each result of the outer query to ensure elimination of duplicates. In such cases, a join approach would yield better results.

--example using join and subqueries

SELECT Name
FROM Production.Product
WHERE ListPrice =
	(SELECT ListPrice
	 FROM Production.Product
	 WHERE Name = 'Cable Lock');

SELECT prd1.Name
FROM Production.Product AS prd1
	JOIN Production.Product AS prd2
		ON (prd1.ListPrice = prd2.ListPrice)
WHERE prd2.Name = 'Cable Lock'


--Up to 32 levels of nesting is possible, although the limit varies based on available memory and the complexity of other expressions in the query


--The select list of a subquery introduced with a comparison operator can include only one expression or column name (except that EXISTS and IN operate on SELECT * or a list, respectively).
--If the WHERE clause of an outer query includes a column name, it must be join-compatible with the column in the subquery select list.

SELECT Name
FROM Sales.Store
WHERE BusinessEntityID NOT IN (
	SELECT CustomerID
	FROM Sales.Customer
	WHERE TerritoryID = 5)