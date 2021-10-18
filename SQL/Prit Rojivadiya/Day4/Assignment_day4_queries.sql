USE db2

-- Q1 Write a query to rank employees based on their salary for a month

SELECT EmployeeID, 'Name' = FirstName +' '+LastName,Salary, DENSE_RANK() OVER ( ORDER BY Salary DESC) as [Salary_Rank] FROM dbo.Employees


-- Q2 Select 4th Highest salary from employee table using ranking function

SELECT * FROM 
(SELECT EmployeeID, 'Name' = FirstName +' '+LastName,Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) as [Salary_Rank] FROM dbo.Employees) temp
WHERE Salary_Rank = 4


-- Q3 Get department, total salary with respect to a department from employee table.

SELECT DepartmentID, SUM(Salary) as Salaries FROM dbo.Employees GROUP BY DepartmentID



-- Q4 Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID, SUM(Salary) as Salaries FROM dbo.Employees 
GROUP BY DepartmentID ORDER BY Salaries DESC



-- Q5 Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentId, MAX(Salary) as 'Max_Salary' from dbo.Employees
GROUP BY DepartmentID ORDER BY Max_Salary ASC



-- Q6 Get department wise minimum salary from employee table order by salary ascending

SELECT DepartmentId, MIN(Salary) as 'Min_Salary' from dbo.Employees
GROUP BY DepartmentID ORDER BY Min_Salary ASC



-- Q7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

SELECT DepartmentId,SUM(Salary) as 'Total_salary' FROM dbo.Employees
GROUP BY DepartmentId HAVING SUM(Salary) > 50000 ORDER BY Total_salary DESC;