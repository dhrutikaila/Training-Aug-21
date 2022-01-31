--Write a query to rank employees based on their salary for a month
SELECT RANK() OVER(ORDER BY Salary DESC) AS SRank, Salary FROM Employees

--Select 4th Highest salary from employee table using ranking function
SELECT * FROM 
(
   SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS DRANK,* 
   FROM Employees
)T
WHERE DRANK=4

--Get department, total salary with respect to a department from employee table.
SELECT DepartmentID
,      SUM(Salary) AS TotalSalary 
FROM Employees 
GROUP BY DepartmentID

--Get department, total salary with respect to a department from employee table order by total salary descending
SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID ORDER BY TotalSalary DESC

--Get department wise maximum salary from employee table order by salary ascending
SELECT DepartmentID
,      MAX(Salary) AS MaxS 
FROM Employees 
GROUP BY DepartmentID 
ORDER BY MaxS ASC

--Get department wise minimum salary from employee table order by salary ascending
SELECT DepartmentID
,      MIN(Salary) AS MinS 
FROM Employees 
GROUP BY DepartmentID 
ORDER BY MinS ASC

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID
,      SUM(Salary) AS TotSalary 
FROM Employees 
GROUP BY DepartmentID 
HAVING SUM(Salary) > 50000
ORDER BY TotSalary DESC
