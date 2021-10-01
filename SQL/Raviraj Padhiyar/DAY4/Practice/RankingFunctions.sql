USE AdventureWorks2019
--ranking functions

--row number

--general syntax ROW_NUMBER() OVER ( ORDER_BY_CLAUSE )
-- returns BIGINT

SELECT ROW_NUMBER() OVER (ORDER BY FirstName ASC) AS Row#
	,FirstName
	,PersonType
FROM Person.Person AS p
WHERE BusinessEntityID < 100;

SELECT ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY FirstName ASC) AS Row#
	,FirstName
	,PersonType
FROM Person.Person AS p
WHERE BusinessEntityID < 1000;
--partition by clause reset ranking when the value_expression here "persontype" changes

--turnacating in round function

SELECT * FROM Sales.SalesOrderDetail
WHERE SalesOrderDetailID < 50


SELECT UnitPrice,ROUND(UnitPrice,-1),ROUND(UnitPrice,-1,1) FROM Sales.SalesOrderDetail
WHERE SalesOrderDetailID < 50

SELECT SalesOrderID,OrderDate FROM (
	SELECT SalesOrderID
		,OrderDate
		,ROW_NUMBER() OVER (ORDER BY OrderDate) AS RowNumber
	FROM Sales.SalesOrderHeader
) AS sales
WHERE RowNumber BETWEEN 50 AND 80

--rank() functions
--syntax:RANK ( ) OVER ( [ partition_by_clause ] order_by_clause )  
--returns bigint

SELECT * FROM HumanResources.Employee

SELECT BusinessEntityID
	,JobTitle
	,RANK() OVER ( ORDER BY VacationHours ) AS Rank
FROM HumanResources.Employee

SELECT BusinessEntityID
	,JobTitle
	,RANK() OVER ( PARTITION BY JobTitle ORDER BY VacationHours ) AS Rank
FROM HumanResources.Employee


SELECT BusinessEntityID
	,JobTitle
	,RANK() OVER ( ORDER BY VacationHours DESC )
FROM HumanResources.Employee
ORDER BY BusinessEntityID

--DESNSE_RANK()
--syntax:DENSE_RANK ( ) OVER ( [ <partition_by_clause> ] < order_by_clause > )  
--returns bigint

SELECT * FROM HumanResources.EmployeePayHistory

SELECT BusinessEntityID
	,Rate
	,RANK() OVER ( ORDER BY Rate DESC) AS RankBySalary
FROM HumanResources.EmployeePayHistory

SELECT BusinessEntityID
	,Rate
	,DENSE_RANK() OVER ( ORDER BY Rate DESC) AS DenseRankBySalary
	,RANK() OVER ( ORDER BY Rate DESC) AS RankBySalary
FROM HumanResources.EmployeePayHistory

SELECT BusinessEntityID
	,Rate
	,PayFrequency
	,DENSE_RANK() OVER ( PARTITION BY PayFrequency ORDER BY Rate DESC) AS RankBySalary
FROM HumanResources.EmployeePayHistory

SELECT BusinessEntityID
	,Rate
	,PayFrequency
	,DENSE_RANK() OVER ( PARTITION BY PayFrequency ORDER BY Rate DESC) AS RankBySalary
FROM HumanResources.EmployeePayHistory
ORDER BY PayFrequency

--NTILE() function
--syntax:NTILE (integer_expression) OVER ( [ <partition_by_clause> ] < order_by_clause > )  
--returns:bigint

SELECT * FROM Sales.SalesPerson

SELECT *
FROM Sales.SalesPerson AS s
INNER JOIN Person.Person As p
	ON s.BusinessEntityID = p.BusinessEntityID

SELECT p.FirstName
	,p.LastName
	,NTILE(4) OVER (ORDER BY SalesYTD DESC) AS Qtile
	,SalesYTD
FROM Sales.SalesPerson AS s
INNER JOIN Person.Person As p
	ON s.BusinessEntityID = p.BusinessEntityID


SELECT * FROM Person.Address

SELECT p.FirstName
	,p.LastName
	,NTILE(2) OVER (PARTITION BY a.PostalCode ORDER BY SalesYTD DESC) AS Qtile
	,SalesYTD
	,a.PostalCode
FROM Sales.SalesPerson AS s
INNER JOIN Person.Person As p
	ON s.BusinessEntityID = p.BusinessEntityID
INNER JOIN Person.Address AS a
	ON s.BusinessEntityID = a.AddressID
