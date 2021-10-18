USE Assignment2

-- 1. Write a query to rank employees based on their salary for a month

SELECT RANK() OVER(ORDER BY Salary DESC)  [Rank_Sal], *  
FROM Employees 

SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)  'Rank', *  
FROM Employees 

SELECT ROW_NUMBER() OVER(ORDER BY Salary DESC)  'Rank', *  
FROM Employees 

-- 2. Select 4th Highest salary from employee table using ranking function

SELECT Salary FROM
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) [Rank_Sal], Salary
FROM Employees) Temp 
WHERE Rank_Sal = 4
GROUP BY Salary


-- 3. Get department, total salary with respect to a department from employee table.

SELECT Dept.DepartmentName, SUM(Emp.Salary) AS [Total]
FROM Employees AS Emp
INNER JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName

-- 4. Get department, total salary with respect to a department from employee table order by total salary descending

SELECT Dept.DepartmentName, SUM(Emp.Salary) AS [Total]
FROM Employees AS Emp
INNER JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName 
ORDER BY SUM(Emp.Salary) DESC

-- 5. Get department wise maximum salary from employee table order by salary ascending

SELECT Dept.DepartmentName, MAX(Emp.Salary) AS [Max_Salary]
FROM Employees AS Emp
INNER JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName 
ORDER BY MAX(Emp.Salary) ASC

-- 6. Get department wise minimum salary from employee table order by salary ascending

SELECT Dept.DepartmentName, MIN(Emp.Salary) AS [Min_Salary]
FROM Employees AS Emp
INNER JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName
ORDER BY MIN(Emp.Salary) ASC

-- 7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

SELECT Dept.DepartmentName, SUM(Emp.Salary) AS [Total_Salary]
FROM Employees AS Emp
INNER JOIN Departments AS Dept
ON Emp.DepartmentID  = Dept.DepartmentID
GROUP BY Dept.DepartmentName
HAVING SUM(Emp.Salary) > 50000
ORDER BY Sum(Emp.Salary) DESC