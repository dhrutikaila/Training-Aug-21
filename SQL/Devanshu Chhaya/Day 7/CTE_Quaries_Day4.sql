
USE [Day_7]

SELECT * FROM [dbo].[Employees]

SELECT * FROM [dbo].[Departments]

SELECT * FROM [dbo].[JobHistory]

SELECT * FROM [dbo].[Locations]

SELECT * FROM [dbo].[Countries]

----- Quaries: 

---1. Write a query to rank employees based on their salary for a month


WITH salary_rank_CTE (Salary,EmployeeName) 
AS
(
	SELECT Salary,FirstName+' '+LastName As EmployeeName 
	FROM Employees
)

SELECT EmployeeName,Salary,RANK() OVER(ORDER BY Salary  ASC) AS RankBySalary FROM salary_rank_CTE


---2.Select 4th Highest salary from employee table using ranking function


WITH Salary_CTE ( Salary,Rank,EmployeeName )
AS
(
	SELECT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) AS Rank,FirstName+' '+LastName AS EmployeeName 
	FROM Employees
)

SELECT Salary,EmployeeName,Rank 
FROM Salary_CTE 
	WHERE Rank=4


----3. Get department, total salary with respect to a department from employee table.


WITH Salary_Cte (DepartmentID,Salary)
AS
(
	SELECT DepartmentID,Salary
	FROM Employees
)

SELECT DepartmentID, SUM (Salary)AS Total_Salary 
FROM Salary_Cte 
	GROUP BY DepartmentID


---4. Get department, total salary with respect to a department from employee table order by total salary descending


WITH Salary_Cte (DepartmentID,Salary)
AS
(
	SELECT DepartmentID,Salary
	FROM Employees
)

SELECT DepartmentID, SUM (Salary)AS Total_Salary 
FROM Employees 
	GROUP BY DepartmentID 
	ORDER BY Total_Salary DESC;

----5.  Get department wise maximum salary from employee table order by salary ascending


WITH Salary_Cte (DepartmentID,Salary)
AS
(
	SELECT DepartmentID,Salary
	FROM Employees
)

SELECT DepartmentID, MAX(Salary) AS Max_Salary 
FROM Salary_Cte 
	GROUP BY DepartmentID 
	ORDER BY Max_Salary; 

------6. Get department wise minimum salary from employee table order by salary ascending


WITH Salary_Cte (DepartmentID,Salary)
AS
(
	SELECT DepartmentID,Salary
	FROM Employees
)

SELECT DepartmentID, MIN(Salary) AS Min_Salary 
FROM Salary_Cte 
	GROUP BY DepartmentID 
	ORDER BY Min_Salary;

----7. Select department, total salary with respect to a department from employee table where total salary 
---- greater than 50000 order by TotalSalary descending


WITH Salary_Cte (DepartmentID,Salary)
AS
(
	SELECT DepartmentID,Salary
	FROM Employees
)

SELECT DepartmentID, SUM(Salary) AS total_salary 
FROM Salary_Cte 
	GROUP BY DepartmentID 
	HAVING SUM(Salary)>5000 
	ORDER BY total_salary DESC;
