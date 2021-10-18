 USE Ketan
 
---Day 4 Sql Query

--1.Write a query to rank employees based on their salary for a month

SELECT DENSE_RANK() OVER(ORDER BY Salary ) [drank], Salary
FROM Employees

--2.SELECT 4th Highest salary FROM employee table using ranking function

SELECT * FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS [drank], Salary
FROM Employees)TMP WHERE(drank=4)

--3.Get department, total salary with respect to a department FROM employee table.

SELECT DepartmentId, SUM(Salary) AS salary
FROM employees 
GROUP BY DepartmentId 

--4.Get department, total salary with respect to a department FROM employee table ORDER BY total salary descending

SELECT DepartmentId, SUM(Salary) AS salary
FROM employees 
GROUP BY DepartmentId ORDER BY salary DESC

--5.Get department wise maximum salary FROM employee table ORDER BY salary ascending

SELECT DepartmentId, MAX(Salary) AS salary
FROM employees 
GROUP BY DepartmentId ORDER BY Salary ASC

--6.Get department wise minimum salary FROM employee table ORDER BY salary ascending

SELECT DepartmentId, MIN(Salary) AS salary
FROM employees 
GROUP BY DepartmentId ORDER BY Salary ASC

--7.SELECT department, total salary with respect to a department FROM employee table where total salary greater than 50000 ORDER BY TotalSalary descending

SELECT DepartmentId, SUM(Salary) AS salary
FROM employees 
GROUP BY DepartmentId 
HAVING SUM(salary)>50000 ORDER BY salary DESC



