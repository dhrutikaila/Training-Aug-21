--Assingment Day4
--Write a query to rank employees based on their salary for a month

SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) 'Rank', Salary FROM Employees ORDER BY SALARY DESC

--Select 4th Highest salary from employee table using ranking function

DECLARE @ranknumber int
SET @ranknumber = 4

SELECT * FROM
(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) 'Rank',* FROM Employees ) Tbl
WHERE Rank = @ranknumber ORDER BY Salary DESC

--Get department, total salary with respect to a department from employee table.

SELECT DepartmentID, SUM(Salary) FROM Employees GROUP BY DepartmentID

--Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID, SUM(Salary) 'Total_Salary' FROM Employees GROUP BY DepartmentID ORDER BY Total_Salary DESC

--Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentID, MAX(Salary) 'max_Salary' FROM Employees GROUP BY DepartmentID ORDER BY max_Salary

--Get department wise minimum salary from employee table order by salary ascending

SELECT DepartmentID, MIN(Salary) 'min_Salary' FROM Employees GROUP BY DepartmentID ORDER BY min_Salary

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

Select DepartmentID, SUM(Salary) 'Total_Salary' FROM Employees GROUP BY DepartmentID HAVING SUM(Salary) > 50000 ORDER BY Total_Salary DESC




