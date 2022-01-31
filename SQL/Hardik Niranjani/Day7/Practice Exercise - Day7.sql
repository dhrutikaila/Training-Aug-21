--Derived Table
SELECT COUNT(UnitPrice) AS [Total UnitPrice in Nth Rank] FROM (
	   SELECT DENSE_RANK() OVER (ORDER BY UnitPrice DESC) AS [DENSE_RANK],*
	   FROM Sales.SalesOrderDetail
	   ) TEMP
WHERE [DENSE_RANK] =1



--CTE Practice
WITH EmployeePayHistory (BusinessEntityID, Max_Rate)  
AS  
(  
    SELECT BusinessEntityID,Max(Rate) AS [Max Rate]
    FROM HumanResources.EmployeePayHistory   
    GROUP BY BusinessEntityID 
)  
SELECT * FROM EmployeePayHistory






