USE AdventureWorks2016

--Derived--

SELECT SalesOrderID FROM
(SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
 FROM Sales.SalesOrderHeader WHERE SalesPersonID IS NOT NULL)temp

 -----------------------------------------------------------------

 SELECT Count FROM
(SELECT SalesPersonID, COUNT(*) AS 'Count' FROM Sales.SalesOrderHeader  
 WHERE SalesPersonID IS NOT NULL GROUP BY SalesPersonID) temp

 -----------------------------------------------------------------

SELECT Name AS 'CountryName' FROM
(SELECT CountryRegionCode,Name,ModifiedDate
FROM Person.CountryRegion)temp



--CTE--

--Create CTE--
WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)  
AS   
(SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
 FROM Sales.SalesOrderHeader WHERE SalesPersonID IS NOT NULL) 
--Use CTE--
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear  
FROM Sales_CTE  GROUP BY SalesYear, SalesPersonID ORDER BY SalesPersonID, SalesYear
--------------------------------------------------------------------------------------

--Create CTE--
WITH Sales_CTE (SalesPersonID, NumberOfOrders)  
AS  
(SELECT SalesPersonID, COUNT(*) FROM Sales.SalesOrderHeader  
 WHERE SalesPersonID IS NOT NULL GROUP BY SalesPersonID)  
--USE CTE--
SELECT AVG(NumberOfOrders) AS 'Average Sales Per Person' FROM Sales_CTE
----------------------------------------------------------------------

