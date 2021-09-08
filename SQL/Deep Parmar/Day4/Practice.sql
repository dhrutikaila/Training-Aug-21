--1.Ranking Functions
--Row_number()
--Rank()
--Dense_rank()
USE AdventureWorks2012   

------------------------ROW_NUMBER()----------------------------- 
SELECT TOP(10) BusinessEntityID, Rate,ROW_NUMBER() OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory

------------------------RANK()----------------------------- 
SELECT TOP(10) BusinessEntityID, Rate,RANK() OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory

------------------------DENSE_RANK()----------------------------- 
SELECT TOP(10) BusinessEntityID, Rate,DENSE_RANK() OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory

------------------------NTILE()----------------------------- 
SELECT  BusinessEntityID, Rate,NTILE(50) OVER (ORDER BY Rate DESC) AS RankBySalary  
FROM HumanResources.EmployeePayHistory

SELECT p.FirstName, p.LastName  
    ,ROW_NUMBER() OVER (ORDER BY a.PostalCode) AS "Row Number"  
    ,RANK() OVER (ORDER BY a.PostalCode) AS Rank  
    ,DENSE_RANK() OVER (ORDER BY a.PostalCode) AS "Dense Rank"  
    ,NTILE(4) OVER (ORDER BY a.PostalCode) AS Quartile  
    ,s.SalesYTD  
    ,a.PostalCode  
FROM Sales.SalesPerson AS s   
    INNER JOIN Person.Person AS p   
        ON s.BusinessEntityID = p.BusinessEntityID  
    INNER JOIN Person.Address AS a   
        ON a.AddressID = p.BusinessEntityID  
WHERE TerritoryID IS NOT NULL AND SalesYTD <> 0 


--2.Aggregate Function
--SUM/COUNT/AVG/MAX/MIN
------------------------SUM----------------------------- 	
SELECT SUM(Salary) AS Total_Salaries FROM Employees

------------------------COUNT----------------------------- 
SELECT COUNT(DISTINCT JobId) AS Total_Jobs  FROM Employees

SELECT COUNT(*) AS Total_Employee FROM Employees

------------------------AVG----------------------------- 
SELECT AVG(Salary) AS Average_Salary FROM Employees

------------------------MIN-----------------------------
SELECT MIN(Salary) AS Minimum_Salary FROM Employees

------------------------MAX----------------------------- 
SELECT MAX(Salary) AS Maximum_Salary FROM Employees

--3.Group by/Having/ROLLUP
------------------------Group by----------------------------- 
CREATE TABLE Sales ( Country VARCHAR(50), Region VARCHAR(50), Sales INT ) 

INSERT INTO sales VALUES ('Canada', 'Alberta', 100) 
INSERT INTO sales VALUES ('Canada', 'British Columbia', 200) 
INSERT INTO sales VALUES ('Canada', 'British Columbia', 300) 
INSERT INTO sales VALUES ('United States', 'Montana', 100) 

SELECT Country,Region,SUM(sales) AS TotalSales FROM Sales
GROUP BY Country, Region

SELECT DATEPART(yyyy,OrderDate) AS N'Year'  
    ,SUM(TotalDue) AS N'Total Order Amount'  
FROM Sales.SalesOrderHeader  
GROUP BY DATEPART(yyyy,OrderDate)  
ORDER BY DATEPART(yyyy,OrderDate)

------------------------GROUP BY ROLLUP----------------------------- 
--Creates a group for each combination of column expressions. 
--In addition, it "rolls up" the results into subtotals and grand totals.

SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY ROLLUP (Country, Region)


------------------------GROUP BY CUBE----------------------------- 
--GROUP BY CUBE creates groups for all possible combinations of columns. 
--For GROUP BY CUBE (a, b) the results has groups for unique values of 
--(a, b), (NULL, b), (a, NULL), and (NULL, NULL).

SELECT Country,Region,SUM(sales) AS TotalSales FROM Sales
GROUP BY CUBE (Country, Region)

------------------------GROUP BY GROUPING SETS----------------------------- 
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY GROUPING SETS
(
(Country,Region),
(Country),
()
)

SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY GROUPING SETS ( ROLLUP (Country, Region), CUBE (Country, Region) )

------------------------HAVING----------------------------- 
SELECT DATEPART(yyyy,OrderDate) AS 'Year',SUM(TotalDue) AS 'Total Order Amount'  
FROM Sales.SalesOrderHeader GROUP BY DATEPART(yyyy,OrderDate)  
HAVING DATEPART(yyyy,OrderDate) >= '2003'  
ORDER BY DATEPART(yyyy,OrderDate)
 
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal FROM Sales.SalesOrderDetail  
GROUP BY SalesOrderID  
HAVING SUM(LineTotal) > 100000.00  
ORDER BY SalesOrderID 