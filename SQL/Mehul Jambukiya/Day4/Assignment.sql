USE Sqlday2

--Write a query to rank employees based on their salary for a month

SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS [Rank], FirstName + ' ' + LastName AS Name, Salary FROM Employees

--Select 4th Highest salary from employee table using ranking function

SELECT * FROM ( SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS [Rank], FirstName + ' ' + LastName AS Name, Salary FROM Employees) tmp WHERE [Rank] = 4;

--Get department, total salary with respect to a department from employee table.

SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID

SELECT e.DepartmentID, d.DepartmentName ,SUM(e.Salary) AS TotalSalary FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID GROUP BY e.DepartmentID,d.DepartmentName

--Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID ORDER BY TotalSalary DESC

SELECT e.DepartmentID, d.DepartmentName ,SUM(e.Salary) AS TotalSalary FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID GROUP BY e.DepartmentID,d.DepartmentName ORDER BY TotalSalary DESC

--Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentID, MAX(Salary) AS MaxSalary FROM Employees GROUP BY DepartmentID ORDER BY MaxSalary

SELECT e.DepartmentID, d.DepartmentName ,MAX(e.Salary) AS MaxSalary FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID GROUP BY e.DepartmentID,d.DepartmentName ORDER BY MaxSalary

--Get department wise minimum salary from employee table order by salary ascending

SELECT DepartmentID, MIN(Salary) AS MinSalary FROM Employees GROUP BY DepartmentID ORDER BY MinSalary

SELECT e.DepartmentID, d.DepartmentName ,MIN(e.Salary) AS MinSalary FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID GROUP BY e.DepartmentID,d.DepartmentName ORDER BY MinSalary

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID HAVING SUM(Salary) < 50000 ORDER BY TotalSalary DESC 

SELECT e.DepartmentID, d.DepartmentName, SUM(e.Salary) AS TotalSalary FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID GROUP BY e.DepartmentID,d.DepartmentName HAVING SUM(e.Salary) < 50000 ORDER BY TotalSalary DESC

