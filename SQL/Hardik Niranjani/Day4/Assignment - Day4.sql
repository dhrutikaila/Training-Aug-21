--(1)--
--Write a query to rank employees based on their salary for a month

SELECT FirstName, Salary,
  DENSE_RANK() OVER(ORDER BY Salary DESC) AS SalaryRank FROM Employees



--(2)--
--Select 4th Highest salary from employee table using ranking function

WITH Result AS
(
	SELECT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) AS Salary_rank FROM Employees
)

SELECT TOP 1 Salary FROM Result WHERE Salary_rank=4


--(3)--
--Get department, total salary with respect to a department from employee table.

SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM Employees GROUP BY DepartmentID


--(4)--
--Get department, total salary with respect to a department 
--from employee table order by total salary descending


SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM Employees GROUP BY DepartmentID ORDER BY TotalSalary DESC



--(5)--
--Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentID, MAX(Salary) AS MaxSalary
	FROM Employees GROUP BY DepartmentID ORDER BY MaxSalary ASC




--(6)--
--Get department wise minimum salary from employee table order by salary ascending

SELECT DepartmentID, MIN(Salary) AS MinSalary 
		FROM Employees GROUP BY DepartmentID ORDER BY MinSalary ASC



--(7)--
--Select department, total salary with respect to a department from employee table 
--where total salary greater than 50000 order by TotalSalary descending

SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM Employees GROUP BY DepartmentID  
		HAVING SUM(Salary)>50000 ORDER BY TotalSalary DESC 