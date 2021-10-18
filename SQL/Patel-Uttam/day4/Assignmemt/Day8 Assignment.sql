USE [Day6 (SELECT)]

/*

1.Write a query to rank employees based on their salary for a month
2.Select 4th Highest salary from employee table using ranking function
3.Get department, total salary with respect to a department from employee table.
4.Get department, total salary with respect to a department from employee table order by total salary descending
5.Get department wise maximum salary from employee table order by salary ascending
6.Get department wise minimum salary from employee table order by salary ascending
7.Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending



*/


-- 1.Write a query to rank employees based on their salary for a month

SELECT RANK() OVER(ORDER BY Salary DESC) , Salary , CONCAT(FirstName, ' ',LastName) as 'Name' FROM Employees 



-- 2.Select 4th Highest salary from employee table using ranking function

WITH CTE(Rank,Salary) AS
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) as 'Salary rank' , Salary FROM Employees)
SELECT TOP 1 Rank,Salary FROM CTE WHERE CTE.Rank = 4




-- 3.Get department, total salary with respect to a department from employee table.

SELECT DepartmentID  , SUM(Salary) as 'Total salary' FROM Employees GROUP BY DepartmentID 




-- 4.Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID , SUM(Salary) [Total Salary] FROM Employees GROUP BY DepartmentID  ORDER BY( RANK() OVER(ORDER BY SUM(Salary)DESC))



-- 5.Get department wise maximum salary from employee table order by salary ascending

SELECT MAX(Salary) 'Max Salry' , DepartmentID FROM Employees  GROUP BY DepartmentID ORDER BY MAX(Salary) ASC




-- 6.Get department wise minimum salary from employee table order by salary ascending

SELECT MIN(Salary) 'Min Salry' , DepartmentID FROM Employees  GROUP BY DepartmentID ORDER BY MIN(Salary) ASC



-- 7.Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

SELECT DepartmentID , SUM(Salary) as 'Total Salary' FROM Employees GROUP BY DepartmentID HAVING SUM(Salary) >50000 ORDER BY SUM(Salary) DESC
