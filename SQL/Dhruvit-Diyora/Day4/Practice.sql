--Row, Rank, Dense Rank, NTILE
SELECT FirstName, LastName,ROW_NUMBER() OVER (ORDER BY Salary) AS 'Row Number Ex.', RANK() OVER (ORDER BY Salary) AS 'Rank Ex.',DENSE_RANK() OVER (ORDER BY Salary) AS 'Dense Rank Ex.',NTILE(10) OVER(ORDER BY Salary) AS 'N_Tile Ex.'	FROM Employees

--Math Functions
SELECT MAX(Salary) AS MAXSAL, MIN(Salary) AS MINSAL, AVG(Salary) AS AVGSAL, SUM(Salary) AS TTLSAL 
	FROM Employees

--Group by/Having/ROLLUP
SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID
SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY ROLLUP (DepartmentID, Salary)
SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID HAVING COUNT(EmployeeId)>5

