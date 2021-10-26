
--GROUP BY 

--general syntax
--GROUP BY 
--      [ ALL ] column-expression [ ,...n ] 
--    | column-expression [ ,...n ] [ WITH { CUBE | ROLLUP } ]   

SELECT * FROM Sales.SalesOrderDetail

SELECT	SalesOrderID
	,SUM(UnitPrice) AS subTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

SELECT SalesOrderID
	,SUM(OrderQty) AS TotalQty
	,SUM(LineTotal) AS subTotal
	,DATENAME(DAY,ModifiedDate) AS 'Day of sale'
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID,DATENAME(DAY,ModifiedDate)
ORDER BY subTotal

SELECT * FROM Sales.SalesOrderHeader

SELECT DATEPART(YYYY,OrderDate) AS N'year'
	,SUM(TotalDue) AS N'Total Order Amount'
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(YYYY,OrderDate)

SELECT DATEPART(YYYY,OrderDate) AS N'year'
	,SUM(TotalDue) AS N'Total Order Amount'
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(YYYY,OrderDate)
HAVING DATEPART(YYYY,OrderDate) >= N'2012'

--having

SELECT SalesOrderID,SUM(LineTotal) as SubTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 15000.00
ORDER BY SalesOrderID

--rollup

SELECT * FROM Person.Address


SELECT City
	,PostalCode
	,COUNT(AddressID) AS 'person in that region'
FROM Person.Address
GROUP BY ROLLUP(City,PostalCode)
HAVING PostalCode IS NOT NULL

SELECT DISTINCT City
	,AddressLine1
	,PostalCode
	,COUNT(AddressID) AS 'person in that region'
FROM Person.Address
GROUP BY ROLLUP(City,PostalCode,AddressLine1)
HAVING PostalCode IS NOT NULL 
	AND AddressLine1 IS NOT NULL
ORDER BY [person in that region]

