----1. APPROX_COUNT_DISTINCT ( expression )
--This function returns the approximate number of unique non-null values in a group.

SELECT APPROX_COUNT_DISTINCT(O_OrderKey) AS Approx_Distinct_OrderKey
FROM dbo.Orders;

SELECT APPROX_COUNT_DISTINCT(O_OrderKey) AS Approx_Distinct_OrderKey
FROM dbo.Orders;

----2.  AVG ( [ ALL | DISTINCT ] expression ) [ OVER ( [ partition_by_clause ] order_by_clause ) ]


USE AdventureWorks2012

SELECT AVG(VacationHours)AS 'Average vacation hours',   
    SUM(SickLeaveHours) AS 'Total sick leave hours'  
FROM HumanResources.Employee  
WHERE JobTitle LIKE 'Vice President%';

SELECT TerritoryID, AVG(Bonus)as 'Average bonus', SUM(SalesYTD) as 'YTD sales'  
FROM Sales.SalesPerson  
GROUP BY TerritoryID;  
GO

SELECT AVG(ListPrice)  
FROM Production.Product;


SELECT AVG(DISTINCT ListPrice)  
FROM Production.Product;

-------3. CHECKSUM_AGG ( [ ALL | DISTINCT ] expression )

--Get the checksum value before the column value is changed.  


USE AdventureWorks2012
SELECT CHECKSUM_AGG(CAST(Quantity AS INT))  
FROM Production.ProductInventory;  
GO

------4. count

-- Aggregation Function Syntax  
COUNT ( { [ [ ALL | DISTINCT ] expression ] | * } )  

-- Analytic Function Syntax  
COUNT ( [ ALL ]  { expression | * } ) OVER ( [ <partition_by_clause> ] )


USE AdventureWorks2012

SELECT COUNT(*), AVG(Bonus)  
FROM Sales.SalesPerson  
WHERE SalesQuota > 25000;  
GO

-----5. GROUPING ( <column_expression> )


USE AdventureWorks2012
SELECT SalesQuota, SUM(SalesYTD) 'TotalSalesYTD', GROUPING(SalesQuota) AS 'Grouping'  
FROM Sales.SalesPerson  
GROUP BY SalesQuota WITH ROLLUP;  
GO

----6. GROUPING_ID ( <column_expression>[ ,...n ] )


USE AdventureWorks2012

SELECT D.Name  
    ,E.JobTitle  
    ,GROUPING_ID(D.Name, E.JobTitle) AS 'Grouping Level'  
    ,COUNT(E.BusinessEntityID) AS N'Employee Count'  
FROM HumanResources.Employee AS E  
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS DH  
        ON E.BusinessEntityID = DH.BusinessEntityID  
    INNER JOIN HumanResources.Department AS D  
        ON D.DepartmentID = DH.DepartmentID       
WHERE DH.EndDate IS NULL  
    AND D.DepartmentID IN (12,14)  
GROUP BY ROLLUP(D.Name, E.JobTitle)  
--HAVING GROUPING_ID(D.Name, E.JobTitle) = 0; --All titles  
--HAVING GROUPING_ID(D.Name, E.JobTitle) = 1; --Group by Name;

---------------7. max

-- Aggregation Function Syntax  
MAX( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax  
MAX ([ ALL ] expression) OVER ( <partition_by_clause> [ <order_by_clause> ] )



USE AdventureWorks2012
SELECT MAX(TaxRate)  
FROM Sales.SalesTaxRate;  
GO

--------8. min

-- Aggregation Function Syntax  
MIN ( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax   
MIN ( [ ALL ] expression ) OVER ( [ <partition_by_clause> ] [ <order_by_clause> ] )


USE AdventureWorks2012
SELECT MIN(TaxRate)  
FROM Sales.SalesTaxRate;  
GO

------9. STDEV
-- Aggregate Function Syntax   
STDEV ( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax   
STDEV ([ ALL ] expression) OVER ( [ partition_by_clause ] order_by_clause)



USE AdventureWorks2012
SELECT STDEV(Bonus)  
FROM Sales.SalesPerson;  
GO

------10. -- Aggregate Function Syntax   
STDEVP ( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax   
STDEVP ([ ALL ] expression) OVER ( [ partition_by_clause ] order_by_clause)


USE AdventureWorks2012
SELECT STDEVP(Bonus)  
FROM Sales.SalesPerson;  
GO

-----11. SUM
-- Aggregate Function Syntax    
SUM ( [ ALL | DISTINCT ] expression )  

-- Analytic Function Syntax   
SUM ([ ALL ] expression) OVER ( [ partition_by_clause ] order_by_clause)



USE AdventureWorks2012
SELECT Color, SUM(ListPrice), SUM(StandardCost)  
FROM Production.Product  
WHERE Color IS NOT NULL   
    AND ListPrice != 0.00   
    AND Name LIKE 'Mountain%'  
GROUP BY Color  
ORDER BY Color;  
GO

------12. -- Aggregate Function Syntax   
VAR ( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax  
VAR ([ ALL ] expression) OVER ( [ partition_by_clause ] order_by_clause)

USE AdventureWorks2012
SELECT VAR(Bonus)  
FROM Sales.SalesPerson;  
GO

------13. -- Aggregate Function Syntax   
VARP ( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax  
VARP ([ ALL ] expression) OVER ( [ partition_by_clause ] order_by_clause)


USE AdventureWorks2012
SELECT VARP(Bonus)  
FROM Sales.SalesPerson;  
GO

