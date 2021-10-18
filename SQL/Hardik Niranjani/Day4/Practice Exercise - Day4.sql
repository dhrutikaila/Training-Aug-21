 
--Group by opration using Production.TransactionHistory table--
SELECT COUNT(TransactionID) AS [Total Id], TransactionType
	   FROM Production.TransactionHistory
	   GROUP BY TransactionType
SELECT * FROM Production.TransactionHistory

--Rank and Dense rank
SELECT DISTINCT RANK() OVER(ORDER BY ActualCost ASC)[Rank],ActualCost,Quantity, TransactionType, ProductID
	   FROM Production.TransactionHistory
	   ORDER BY Quantity DESC

SELECT DISTINCT DENSE_RANK() OVER(ORDER BY ActualCost ASC)[Rank],ActualCost,Quantity, TransactionType, ProductID
	   FROM Production.TransactionHistory
	   ORDER BY [Rank]

--Max_rate find in under 100-
SELECT MAX(Rate) AS [Max Rate] 
	   FROM HumanResources.EmployeePayHistory 
	   WHERE Rate<100
--Min rate find in under 100-
SELECT MIN(Rate) AS [Max Rate] 
	   FROM HumanResources.EmployeePayHistory 
	   WHERE Rate<100

--Sum rate find in under 100-
SELECT SUM(Rate) AS [Max Rate] 
	   FROM HumanResources.EmployeePayHistory 
	   WHERE Rate<100

--Avg rate find in under 100--
SELECT AVG(Rate) AS [Max Rate] 
	   FROM HumanResources.EmployeePayHistory 
	   WHERE Rate<100

--Cont rate in under 100--
SELECT COUNT(Rate) AS [Max Rate] 
	   FROM HumanResources.EmployeePayHistory 
	   WHERE Rate<100







