select * from Employees
--1:Select 4th Highest salary from employee table using ranking function
SELECT RANK() OVER (ORDER BY salary desc) as rank,EmployeeID,Salary, 
(FirstName + ' '+ LastName) AS Employeename
from Employees

--2:Select 4th Highest salary from employee table using ranking function
SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY salary desc) 
as drank,Salary,JobId
from Employees) tmp WHERE drank=4


--3:Get department, total salary with respect to a department from employee table
SELECT * FROM Employees
SELECT * FROM Departments

SELECT DepartmentID , SUM(Salary) as totalsalary
FROM Employees
GROUP BY DepartmentID
---BY FETCHING DEPARTMENT NAME FROM DEPARTMENT TABLE
SELECT Departments.DepartmentName,SUM(Employees.Salary) as totalsalary 
FROM Departments, Employees 
WHERE Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName

--4:Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID , SUM(Salary) as totalsalary
FROM Employees
GROUP BY DepartmentID ORDER BY totalsalary DESC

--- BY FETCHING DEPARTMENT NAME FROM DEPARTMENT TABLE

SELECT Departments.DepartmentName,SUM(Employees.Salary) as totalsalary 
FROM Departments, Employees 
WHERE Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName order by totalsalary DESC


--5 Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentID , MAX(Salary) as maxsalary
FROM Employees
GROUP BY DepartmentID ORDER BY maxsalary
 
--- BY FETCHING DEPARTMENT NAME FROM DEPARTMENT TABLE


SELECT Departments.DepartmentName,MAX(Employees.Salary) as maxsalary 
FROM Departments, Employees 
WHERE Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName order by maxsalary


--6 Get department wise minimum salary from employee table order by salary ascending


SELECT DepartmentID , MIN(Salary) as minsalary
FROM Employees
GROUP BY DepartmentID ORDER BY minsalary


--- BY FETCHING DEPARTMENT NAME FROM DEPARTMENT TABLE


SELECT Departments.DepartmentName,MIN(Employees.Salary) as minsalary 
FROM Departments, Employees 
WHERE Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName order by minsalary 

--7Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending


SELECT DepartmentID , SUM(Salary) as TOTALSALARY
FROM Employees
GROUP BY DepartmentID 
HAVING SUM(Salary) >= 50000
ORDER BY TOTALSALARY DESC


---BY FETCHING DEPARTMENT NAME FROM DEPARTMENT TABLE

SELECT Departments.DepartmentName,SUM(Employees.Salary) as totalsalary 
FROM Departments, Employees 
WHERE Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName 
HAVING SUM(Employees.Salary) >= 50000
ORDER BY totalsalary DESC	



