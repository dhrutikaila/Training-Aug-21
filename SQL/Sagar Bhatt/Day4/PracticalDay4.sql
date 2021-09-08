SELECT * 
FROM Employees

--1-Write a query to rank employees based on their salary for a month
SELECT RANK()
OVER(ORDER BY Salary DESC) [Rank], *
FROM Employees 

SELECT DENSE_RANK()
OVER(ORDER BY Salary DESC) [DenseRank], *
FROM Employees

SELECT ROW_NUMBER()
OVER(ORDER BY Salary DESC) [ROW_NUMBER], *
FROM Employees

SELECT NTILE(10)
OVER(ORDER BY Salary DESC) [NTILE], *
FROM Employees

--2-Select 4th Highest salary from employee table using ranking function
SELECT Salary FROM (SELECT DENSE_RANK()
OVER(ORDER BY Salary DESC) [Rank], *
FROM Employees) tmp 
WHERE [Rank] = 4
GROUP BY Salary

--3-Get department, total salary with respect to a department from employee table.
SELECT Dpt.DepartmentName, SUM(Emp.Salary) AS [Sum of Salaries]
FROM Employees AS Emp
JOIN Departments AS Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
GROUP BY Dpt.DepartmentName

--4-Get department, total salary with respect to a department from employee table order by total salary descending
SELECT Dpt.DepartmentName, SUM(Emp.Salary) AS [Sum of Salaries]
FROM Employees AS Emp
JOIN Departments AS Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
GROUP BY Dpt.DepartmentName
ORDER BY SUM(Emp.Salary) DESC

--5-Get department wise maximum salary from employee table order by salary ascending
SELECT Dpt.DepartmentName, MAX(Emp.Salary) AS [Maximum Salary]
FROM Employees AS Emp
JOIN Departments AS Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
GROUP BY Dpt.DepartmentName
ORDER BY MAX(Emp.Salary) ASC

--6-Get department wise minimum salary from employee table order by salary ascending
SELECT Dpt.DepartmentName, MIN(Emp.Salary) AS [Minimum Salary]
FROM Employees AS Emp
JOIN Departments AS Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
GROUP BY Dpt.DepartmentName
ORDER BY MIN(Emp.Salary) ASC

--7-Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT Dpt.DepartmentName, SUM(Emp.Salary) AS [Sum of Salaries]
FROM Employees AS Emp
JOIN Departments AS Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
GROUP BY Dpt.DepartmentName
HAVING SUM(Emp.Salary) > 50000
ORDER BY SUM(Emp.Salary) DESC
