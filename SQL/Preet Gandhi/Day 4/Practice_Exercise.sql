USE AdventureWorks2016

--Write a query to give dense rank employee based on their rate in ascending order from employeepayhistory table
SELECT DENSE_RANK() OVER(ORDER BY Rate ASC)[DRANK] ,Rate FROM HumanResources.EmployeePayHistory

--Write a query to give rank based on their rate in Descending order from employeepayhistory table
SELECT RANK() OVER(ORDER BY Rate DESC)[SRANK], * FROM HumanResources.EmployeePayHistory

--Write query to give rank based on their ModifiedDate from employeepayhistory table
SELECT ROW_NUMBER() OVER(ORDER BY ModifiedDate ASC)[R_NUMBER] ,ModifiedDate FROM HumanResources.EmployeepayHistory


--RANKING Functions--

--DENSE_RANK Practice--
SELECT BusinessEntityID, Rate, DENSE_RANK() OVER(ORDER BY Rate DESC)[DRANK] FROM HumanResources.EmployeePayHistory

SELECT BusinessEntityID, Rate,ModifiedDate, DENSE_RANK() OVER(PARTITION BY ModifiedDate ORDER BY Rate DESC )[DRANK] FROM HumanResources.EmployeePayHistory

--RANK Practice--
SELECT RANK() OVER(ORDER BY Rate ASC)[SRATE] ,Rate FROM HumanResources.EmployeePayHistory

SELECT RANK() OVER(PARTITION BY ModifiedDate ORDER BY Rate ASC)[SRANK], Rate,ModifiedDate FROM HumanResources.EmployeePayHistory

--ROW_NUMBER Practice--
SELECT ROW_NUMBER() OVER(ORDER BY Rate DESC)[ROW-NO] , Rate FROM HumanResources.EmployeePayHistory

SELECT ROW_NUMBER() OVER(PARTITION BY Rate ORDER BY RATE DESC)[ROW-NO] ,Rate FROM HumanResources.EmployeePayHistory


--Aggregate Functions--

--MAX--
SELECT MAX(Rate) FROM HumanResources.EmployeePayHistory
SELECT MAX(Rate) FROM HumanResources.EmployeePayHistory WHERE Rate<24

SELECT DISTINCT Rate 
       , MIN(Rate) OVER (PARTITION BY BusinessEntityID) AS MinSalary  
       , MAX(Rate) OVER (PARTITION BY BusinessEntityID) AS MaxSalary  
       , AVG(Rate) OVER (PARTITION BY BusinessEntityID) AS AvgSalary  
       ,COUNT(BusinessEntityID) OVER (PARTITION BY BusinessEntityID) AS EmployeesPerDept  
FROM HumanResources.EmployeePayHistory

--MIN--
SELECT MIN(Rate) FROM HumanResources.EmployeePayHistory
SELECT MIN(Rate) FROM HumanResources.EmployeePayHistory WHERE Rate>50

--SUM--
SELECT SUM(Rate) FROM HumanResources.EmployeePayHistory

--AVG--
SELECT  AVG(Rate) FROM HumanResources.EmployeepayHistory

--COUNT--
SELECT COUNT(Rate) FROM HumanResources.EmployeePayHistory
SELECT COUNT(DISTINCT Rate) FROM HumanResources.EmployeePayHistory

--GROUP BY--
SELECT BusinessEntityID,SUM(Rate) AS Total FROM HumanResources.EmployeePayHistory GROUP BY BusinessEntityID 

--ROLLUP (For each combination)--
SELECT OrderQty, ProductID, SUM(UnitPrice) AS Result
FROM Sales.SalesOrderDetail
GROUP BY ROLLUP (OrderQty, ProductID)

SELECT * FROM Sales.SalesOrderDetail

--CUBE (Create Group for all possible Combination)--
SELECT OrderQty, ProductID, SUM(UnitPrice) AS Result
FROM Sales.SalesOrderDetail
GROUP BY CUBE (OrderQty, ProductID)

--GROUPING SETS (To combine multiple GROUP BY clauses into one GROUP BY clause)--
SELECT OrderQty, ProductID, SUM(UnitPrice) AS Result
FROM Sales.SalesOrderDetail
GROUP BY GROUPING SETS (OrderQty, ProductID)

--Having Clause--
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal  
FROM Sales.SalesOrderDetail  
GROUP BY SalesOrderID  
HAVING SUM(LineTotal) > 100000.00  
ORDER BY SalesOrderID 



