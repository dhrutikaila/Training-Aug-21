USE rxweb_day2

--- All deatails of Employees ---
SELECT * FROM Employees

--- Query 1. Write a query to rank employees based on their salary for a month ---
SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],* FROM Employees
SELECT RANK() OVER(ORDER BY Salary DESC)[RANK],* FROM Employees

--- Query 2. Select 4th Highest salary from employee table using ranking function ---
SELECT Salary FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[RANKING],* FROM Employees)temp WHERE RANKING = 4

--- Query 3. Get department, total salary with respect to a department from employee table. ---
SELECT DepartmentID, SUM(Salary) AS TotalSalaryPerDepartment FROM Employees GROUP BY DepartmentID

--- Query 4. Get department, total salary with respect to a department from employee table order by total salary descending ---
SELECT DepartmentID, SUM(Salary) AS TotalSalaryPerDepartment FROM Employees GROUP BY DepartmentID ORDER BY TotalSalaryPerDepartment DESC

--- Query 5. Get department wise maximum salary from employee table order by salary ascending ---
SELECT DepartmentID, MAX(Salary) AS MaxPerDept FROM Employees GROUP BY DepartmentID ORDER BY MAxPerDept ASC

--- Query 6. Get department wise minimum salary from employee table order by salary ascending ---
SELECT DepartmentID, MIN(Salary) AS MinPerDept FROM Employees GROUP BY DepartmentID ORDER BY MinPerDept ASC

--- Query 7. Select department, total salary with respect to a department from employee table 
--  where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID, TotalSalary FROM (SELECT DepartmentID, SUM(Salary) AS TotalSalary 
FROM Employees GROUP BY DepartmentID)temp WHERE TotalSalary > 50000 ORDER BY TotalSalary DESC
