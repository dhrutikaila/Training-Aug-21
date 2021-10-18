use day6_sql_file
-- Day 4 Exercise with Derived Tables --

-- 1. Write a query to rank employees based on their salary for a month 
SELECT Rank,EmployeeID FROM
(SELECT RANK() OVER (ORDER BY Salary) 'Rank',EmployeeID FROM Employees)RankEmployee
 

-- 2. Select 4th Highest salary from employee table using ranking function
SELECT Distinct Rank,Salary FROM
(SELECT DENSE_RANK() OVER (ORDER BY Salary) 'Rank',Salary FROM Employees)HighestSalary
WHERE Rank=4


-- 3. Get department, total salary with respect to a department from employee table.
SELECT DepartmentID,DeptSalary FROM
(SELECT DepartmentID, SUM(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID )GetSalary
WHERE DepartmentID != 0


-- 4. Get department, total salary with respect to a department from employee table order by total salary descending
SELECT DepartmentID,DeptSalary FROM
(SELECT DepartmentID, SUM(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID  )TotalSalary
WHERE DepartmentID != 0
ORDER BY DeptSalary DESC


 -- 5. Get department wise maximum salary from employee table order by salary ascending
SELECT DepartmentID,DeptSalary FROM
(SELECT DepartmentID, MAX(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID )TotalSalary
WHERE DepartmentID != 0
ORDER BY DeptSalary 


-- 6. Get department wise minimum salary from employee table order by salary ascSELECT DepartmentID,DeptSalary FROM(
SELECT DepartmentID,DeptSalary FROM
(SELECT DepartmentID, MIN(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID )TotalSalary
WHERE DepartmentID != 0
ORDER BY DeptSalary 


-- 7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID,DeptSalary FROM
(SELECT DepartmentID, SUM(Salary) 'DeptSalary'
	FROM Employees GROUP BY DepartmentID  )FilterDepart
WHERE DepartmentID != 0 AND DeptSalary>50000
ORDER BY DeptSalary DESC