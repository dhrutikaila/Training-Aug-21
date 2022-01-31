--Ranking Functions
	--Row_number()
		SELECT Studentname,Subject,Marks, 
		ROW_NUMBER() OVER(ORDER BY Marks) RowNumber
		FROM ExamResult

	--Rank()
		SELECT Studentname,Subject,Marks, 
		RANK() OVER(ORDER BY Marks) RowNumber
		FROM ExamResult

	--Dense_rank()
		SELECT Studentname,Subject,Marks, 
		Dense_rank() OVER(ORDER BY Marks) RowNumber
		FROM ExamResult


--Aggregate Function
	--SUM
		SELECT SUM(Salary) AS [SUM] from Employees
	--COUNT
		SELECT COUNT(EmployeeID) AS [NO OF EMP] FROM Employees
	--AVG
		SELECT AVG(Salary) AS AVG_SALARY from Employees
	--MAX
		SELECT MAX(Salary) AS MAX_SALARY from Employees
	--MIN
		SELECT MIN(Salary) AS MIN_SALARY from Employees



--Group by
	SELECT * FROM Employees
	SELECT COUNT(EmployeeID),ManagerID
	FROM Employees
	GROUP BY ManagerID

	SELECT Country, Region, SUM(sales) AS TotalSales
    FROM Sales
    GROUP BY Country, Region

	--GROUP BY CUBE
	SELECT Country, Region, SUM(Sales) AS TotalSales
    FROM Sales
    GROUP BY CUBE (Country, Region)

	SELECT Country, Region, SUM(Sales) AS TotalSales
	FROM Sales
	GROUP BY GROUPING SETS ( ROLLUP (Country, Region), CUBE (Country, Region) );

--Having
	SELECT Firstname, SUM(SALARY) FROM Employees 
	GROUP BY Firstname
	HAVING SUM(SALARY)>3000 

	use AdventureWorksDW2012
	SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales   
	FROM FactInternetSales  
	GROUP BY OrderDateKey   
	HAVING OrderDateKey > 20040000   
	ORDER BY OrderDateKey  

--ROLLUP
	SELECT Country, Region, SUM(Sales) AS TotalSales
	FROM Sales
	GROUP BY ROLLUP (Country, Region)

	USE AdventureWorks2012   
	SELECT SalesOrderID, SUM(LineTotal) AS SubTotal  
	FROM Sales.SalesOrderDetail  
	GROUP BY SalesOrderID  
	HAVING SUM(LineTotal) > 100000.00  
	ORDER BY SalesOrderID   