--APPROX_COUNT_DISTINCT--
SELECT APPROX_COUNT_DISTINCT(Salary) AS Approx_Distinct_OrderKey
FROM Employees

--AVG--
SELECT AVG(VacationHours)AS 'Average vacation hours',   
       SUM(SickLeaveHours) AS 'Total sick leave hours'  
FROM HumanResources.Employee  
WHERE JobTitle LIKE 'Vice President%'

SELECT AVG(DISTINCT ListPrice)  
FROM Production.Product

--CHECKSUM_AGG--
SELECT CHECKSUM_AGG(CAST(Quantity AS INT))  
FROM Production.ProductInventory

--COUNT--
SELECT COUNT(*)  
FROM HumanResources.Employee

--GROUPING--
SELECT SalesQuota, SUM(SalesYTD) 'TotalSalesYTD', GROUPING(SalesQuota) AS 'Grouping'  
FROM Sales.SalesPerson  
GROUP BY SalesQuota WITH ROLLUP

--MAX--
SELECT MAX(TaxRate)  
FROM Sales.SalesTaxRate

--MIN--
SELECT MIN(TaxRate)  
FROM Sales.SalesTaxRate

--SUM--
SELECT Color
,      SUM(ListPrice)
,      SUM(StandardCost)  
FROM Production.Product  
WHERE Color IS NOT NULL   
      AND ListPrice != 0.00   
      AND Name LIKE 'Mountain%'  
GROUP BY Color  
ORDER BY Color

--VAR--
SELECT VAR(Bonus)  
FROM Sales.SalesPerson