--USE SqlDay2
--Ranking Functions
--Row_number()

SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID ASC) AS RowNumber,* FROM Employees

--Rank()

SELECT RANK() OVER(ORDER BY Salary DESC) AS RankBySalary,* FROM Employees

--Dense_rank()

SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS DenseRankBySalary,* FROM Employees

--Aggregate Function
--SUM/COUNT/AVG/MAX/MIN

SELECT SUM(Salary) AS TotalSalary FROM Employees
SELECT AVG(Salary) AS AverageSalary FROM Employees
SELECT MAX(Salary) AS MaximumSalary FROM Employees
SELECT MIN(Salary) AS MinimumSalary FROM Employees
SELECT COUNT(JobId),JobId FROM Employees GROUP BY JobId

--Group by/Having/ROLLUP

SELECT SUM(Salary) AS DepartmentTotalSalary,DepartmentID FROM Employees GROUP BY DepartmentID

SELECT COUNT(JobId) AS Employees,JobId FROM Employees GROUP BY JobId HAVING JobId = 'IT_PROG'

SELECT JobId,SUM(Salary) AS Salary FROM Employees GROUP BY ROLLUP(JobId,Salary)
