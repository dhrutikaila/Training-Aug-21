--1. Write a query to list the number of jobs available in the employees table.
SELECT COUNT(DISTINCT(JobId)) as TotalJobs FROM Employees


--2. Write a query to get the total salaries payable to employees.
SELECT SUM(Salary) AS TotalSalary FROM Employees

--3. Write a query to get the minimum salary from employees table.
SELECT MIN(Salary) AS MinimumSalary FROM Employees

--4. Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(Salary) AS MaximumSalary FROM Employees
				   WHERE  JobId = 'IT_PROG'


--5. Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(Salary) AS AvarageSalary, COUNT(EmployeeID) AS [Number of Employees] 
				FROM Employees
				WHERE DepartmentID = 90


--6. Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT MAX(Salary) AS highest, MIN(Salary) AS lowest, 
	   SUM(Salary) AS TotalSalary, AVG(Salary) AS Avarage FROM Employees

--7. Write a query to get the number of employees with the same job.
SELECT Count(EmployeeID) AS [Number of Employee], JobId 
			FROM Employees
			GROUP BY JobId 
			ORDER BY [Number of Employee] DESC

--8. Write a query to get the difference between the highest and lowest salaries.
SELECT (MAX(Salary) - MIN(Salary)) AS [Salary] FROM Employees


--9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
DECLARE @temp INT 
SET @temp = (SELECT min(Salary) FROM Employees)
SELECT ManagerID, Salary FROM Employees
						 WHERE Salary = @temp 


--10. Write a query to get the department ID and the total salary payable in each department.
SELECT DepartmentID, SUM(Salary) AS [Total Salary] 
				FROM Employees
				GROUP BY DepartmentID


--11. Write a query to get the average salary for each job ID excluding programmer.
SELECT AVG(Salary) AS [Salary], JobId 
			FROM Employees
			GROUP BY JobId
			HAVING JobId NOT LIKE 'IT_PROG'


--12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT SUM(Salary) AS [Total Salary], MAX(Salary) AS [Max Salary],
	   MIN(Salary) AS [Min Salary], AVG(Salary) AS [Avg Salary], JobId
	   FROM Employees
	   WHERE  DepartmentID = 90
	   GROUP BY JobId


--13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT JobId, MAX(Salary) AS [Salary] 
			FROM Employees
			WHERE [Salary] >=4000
			GROUP BY JobId
				


--14. Write a query to get the average salary for all departments employing more than 10 employees
SELECT AVG(Salary) AS [Avg Salary], DepartmentID 
			FROM Employees
			GROUP BY DepartmentID
			HAVING COUNT(EmployeeID) >10
