--query1
--Write a query to rank employees based on their salary for a month

SELECT FirstName,Salary,RANK() OVER (ORDER BY Salary DESC) AS SalaryRank From Employees


--query2
--Select 4th Highest salary from employee table using ranking function

SELECT * FROM (
	SELECT SalaryRank=DENSE_RANK() OVER (ORDER BY Salary DESC),
	FirstName,
	Salary
	FROM Employees
) AS Rank
Where SalaryRank=4


--query3
--Get department, total salary with respect to a department from employee table.

SELECT DepartmentID,SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID


--query4
--Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID,SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY TotalSalary DESC


--query5
--Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentID,MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY MaxSalary


--query6
--Get department wise minimum salary from employee table order by salary ascending

SELECT DepartmentID,MIN(Salary) AS MaxSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY MaxSalary


--query7
--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID,TotalSalary=SUM(Salary)
FROM Employees
GROUP BY DepartmentID
HAVING SUM(Salary) > 50000
ORDER BY TotalSalary DESC