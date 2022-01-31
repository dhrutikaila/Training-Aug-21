use day6_sql_file
-- Day 4 Exercise with CTE --

-- 1. Write a query to rank employees based on their salary for a month
With RankEmployee (Rank, EmployeeID)
AS(
SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) RANK_SALARY , EmployeeID 
FROM Employees 
)
select RANK , EmployeeID from RankEmployee;


-- 2. Select 4th Highest salary from employee table using ranking function
With HighestSalary (Rank, Salary)
AS(
SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) RANK_SALARY , Salary
FROM Employees 
)
select Rank , Salary from HighestSalary
where Rank = 4;

-- 3. Get department, total salary with respect to a department from employee table.
WITH GetSalary (DepartmentID,Salary)
AS(
 SELECT DepartmentID, SUM(Salary) 'DeptSalary'
FROM Employees GROUP BY DepartmentID 
)
SELECT DepartmentID,Salary FROM GetSalary
WHERE DepartmentID != 0;


-- 4. Get department, total salary with respect to a department from employee table order by total salary descending
With TotalSalary (Total_salary, DepartmentID)
AS(
SELECT SUM(Salary) Total_salary , DepartmentID 
FROM Employees  WHERE DepartmentID != 0
GROUP BY (DepartmentID)
)
SELECT Total_salary , DepartmentID  from TotalSalary
 ORDER BY Total_salary DESC;


 -- 5. Get department wise maximum salary from employee table order by salary ascending
WITH TotalSalary (DepartmentID,Salary)
AS(
	SELECT DepartmentID, MAX(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID 
)
SELECT DepartmentID,Salary FROM TotalSalary
WHERE DepartmentID != 0
ORDER BY Salary ;


-- 6. Get department wise minimum salary from employee table order by salary ascending
WITH TotalSalary (DepartmentID,Salary)
AS(
	SELECT DepartmentID, MIN(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID 
)
SELECT DepartmentID,Salary FROM TotalSalary
WHERE DepartmentID != 0
ORDER BY Salary ;


-- 7. Select department, total salary with respect to a department from employee table
--where total salary greater than 50000 order by TotalSalary descending

WITH FilterDepart (DepartmentID,Salary)
AS(
	SELECT DepartmentID, SUM(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID 

)
SELECT DepartmentID,Salary FROM FilterDepart
WHERE DepartmentID != 0 AND Salary>50000
ORDER BY Salary  DESC;

