USE Additional_Practice
--Main Database--


--1)Write a query to list the number of jobs available in the employees table.
SELECT COUNT(DISTINCT JobID) AS 'TotalJobs' FROM Employees
--OR--
SELECT ROW_NUMBER() OVER(ORDER BY JobID ASC)[RNUMBER],JobID FROM Employees GROUP BY JobID

--2)Write a query to get the total salaries payable to employees.
SELECT SUM(Salary) AS 'TotalPayableSalaryAmount' FROM Employees

--3)Write a query to get the minimum salary from employees table.
SELECT MIN(Salary) AS 'MinSalary' FROM Employees

--4)Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(Salary) AS 'MaxSalary' FROM Employees WHERE JobId LIKE '%PROG%'

--5)Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(Salary) AS 'AvgSalary' , COUNT(EmployeeID) AS 'TotalEmployees' FROM Employees
WHERE DepartmentID = 90 

--6)Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(Salary) AS 'HighestSalary', MIN(Salary) AS 'LowestSalary',
SUM(Salary) AS 'TotalSalary', AVG(Salary) AS 'AvgSalary' FROM Employees

--7)Write a query to get the number of employees with the same job.
SELECT COUNT(EmployeeID) AS 'TotalEmployees',JobID FROM Employees GROUP BY JobID

--8)Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(Salary) AS 'HighestSalary' ,MIN(Salary) AS 'LowestSalary', 
[Difference] = MAX(Salary) - MIN(Salary) FROM Employees

--9)Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT ManagerID,MIN(Salary) FROM Employees GROUP BY ManagerID

--10)Write a query to get the department ID and the total salary payable in each department.
SELECT DepartmentID, SUM(Salary) AS 'SalaryPerDept' FROM Employees GROUP BY DepartmentID

--11)Write a query to get the average salary for each job ID excluding programmer.
SELECT JobID,AVG(Salary) FROM Employees WHERE JobId NOT LIKE '%PROG%' GROUP BY JobID

--12)Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT SUM(Salary) AS 'TotalSalary', MAX(Salary) AS 'MaxSalary',
MIN(Salary) AS 'MinSalary', AVG(Salary) AS 'AvgSalary' FROM Employees
WHERE DepartmentID=90 GROUP BY JobID

--13)Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT JobID,MAX(Salary) AS 'MaxSalary' FROM Employees WHERE Salary>=4000 GROUP BY JobID

--14)Write a query to get the average salary for all departments employing more than 10 employees.
SELECT AVG(Salary) AS 'AvgSalary', DepartmentID FROM Employees 
GROUP BY DepartmentID HAVING COUNT(EmployeeID)>10


SELECT * FROM Employees