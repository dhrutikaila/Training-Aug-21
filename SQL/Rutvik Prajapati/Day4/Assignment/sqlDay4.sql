--1.Write a query to rank employees based on their salary for a month
SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) [DENSE RANK],FirstName,LastName,Salary 
FROM Employees

SELECT RANK() OVER (ORDER BY SALARY DESC) [RANK],FirstName,LastName,Salary 
FROM Employees

SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) [ROW NUMBER],FirstName,LastName,Salary 
FROM Employees

--2.Select 4th Highest salary from employee table using ranking function
SELECT TOP 1 * FROM
(SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) 'Rank',Salary 
FROM Employees)tbl
WHERE Rank = '4' ORDER BY Salary DESC

--3.Get department, total salary with respect to a department from employee table.
SELECT DepartmentID,SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID

--4.Get department, total salary with respect to a department from employee table order by total salary descending
SELECT DepartmentID,SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY TotalSalary DESC

--5.Get department wise maximum salary from employee table order by salary ascending
SELECT DepartmentID,MAX(Salary) AS [Maximum Salary]
FROM Employees
GROUP BY DepartmentID 
ORDER BY [Maximum Salary] ASC

--6.Get department wise minimum salary from employee table order by salary ascending
SELECT DepartmentID,MIN(Salary) AS [Minimum Salary]
FROM Employees
GROUP BY DepartmentID 
ORDER BY [Minimum Salary] ASC


--7.Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID,SUM(Salary)[Total Salary]
FROM Employees
GROUP BY DepartmentID
HAVING SUM(Salary)>5000
ORDER BY [Total Salary] DESC