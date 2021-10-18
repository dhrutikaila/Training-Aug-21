Use Sqlday2


--Write a query to rank employees based on their salary for a month

WITH cte
AS 
(SELECT DENSE_RANK() OVER (ORDER BY Salary) AS RankBySalary,* FROM Employees)
SELECT * FROM cte

--Select 4th Highest salary from employee table using ranking function

WITH cte
AS 
(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS RankBySalary,* FROM Employees)
SELECT * FROM cte WHERE RankBySalary = 4


--Get department, total salary with respect to a department from employee table.

WITH cte
AS
(SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM cte

--Get department, total salary with respect to a department from employee table order by total salary descending

WITH cte
AS
(SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM cte ORDER BY TotalSalary DESC

--Get department wise maximum salary from employee table order by salary ascending

WITH cte
AS
(SELECT DepartmentID,MAX(Salary) AS MaxSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM cte ORDER BY MaxSalary


--Get department wise minimum salary from employee table order by salary ascending

WITH cte
AS
(SELECT DepartmentID,MIN(Salary) AS MinSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM cte ORDER BY MinSalary

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

WITH cte
AS
(SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM cte WHERE TotalSalary>50000 ORDER BY TotalSalary DESC