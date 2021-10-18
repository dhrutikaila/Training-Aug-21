--DENSE_RANK
SELECT DENSE_RANK() OVER (ORDER BY vacationHours) Dense_rankd_vaction FROM HumanResources.Employee 

--RANK
SELECT RANK() OVER (ORDER BY vacationHours) rankd_vaction FROM HumanResources.Employee 

--NTILE
SELECT NTILE(30) OVER (ORDER BY vacationHours) Ntitled_rank FROM HumanResources.Employee

--ROW_NUMBER
SELECT ROW_NUMBER() OVER (ORDER BY vacationHours) Row_rankd FROM HumanResources.Employee 


SELECT VacationHours FROM HumanResources.Employee ORDER BY VacationHours


SELECT SalesOrderID , SUM(LineTotal) Sum_of_line_Total
FROM Sales.SalesOrderDetail
GROUP BY  ROLLUP (SalesOrderID , SalesOrderDetailID) 
HAVING SUM(LineTotal) > 100000.00
ORDER BY SalesOrderID 

SELECT *
FROM Sales.SalesOrderDetail


SELECT MIN(TaxRate)  
FROM Sales.SalesTaxRate;  


SELECT AVG(VacationHours)AS 'Average vacation hours',   
    SUM(SickLeaveHours) AS 'Total sick leave hours'  
FROM HumanResources.Employee


SELECT COUNT(*), AVG(Bonus)  
FROM Sales.SalesPerson  
WHERE SalesQuota > 25000;  
