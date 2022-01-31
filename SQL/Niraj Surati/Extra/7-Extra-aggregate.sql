USE Assignment2

--1. Write a query to list the number of jobs available in the employees table.

SELECT COUNT(*) AS 'Total Employees'
FROM Employees

--2. Write a query to get the total salaries payable to employees.

SELECT SUM(Salary) AS 'Total Salaries'
FROM Employees

--3. Write a query to get the minimum salary from employees table.

SELECT MIN(Salary) AS 'Min Salary'
FROM Employees

--4. Write a query to get the maximum salary of an employee working as a Programmer.

SELECT MAX(Salary) AS 'Max Salary'
FROM Employees
WHERE JobId = 'IT_PROG'

--5. Write a query to get the average salary and number of employees working the department 90.

SELECT AVG(Salary) AS 'Avg Salary'
FROM Employees
WHERE DepartmentID = 90

--6. Write a query to get the highest, lowest, sum, and average salary of all employees.

SELECT MAX(Salary) AS 'Max Salary'
	,	MIN(Salary) AS 'Min Salary'
	,	SUM(Salary) AS 'Total Salaries'
	,	AVG(Salary) AS 'Avg Salary'
FROM Employees

--7. Write a query to get the number of employees with the same job.

SELECT JobId
	,	COUNT(*) AS 'Total'
FROM Employees
GROUP BY JobId

--8. Write a query to get the difference between the highest and lowest salaries.

SELECT MAX(Salary) AS 'Max Salary'
	,	MIN(Salary) AS 'Min Salary'
	,	MAX(Salary) - MIN(Salary) AS 'Difference'
FROM Employees

--9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.

SELECT ManagerID
	,	MIN(Salary) AS 'Min Salary'
FROM Employees
WHERE ManagerID <> 0
GROUP By ManagerID

--10. Write a query to get the department ID and the total salary payable in each department.

SELECT DepartmentID
	,	SUM(Salary) AS 'Total Salary'
FROM Employees
GROUP BY DepartmentID

--11. Write a query to get the average salary for each job ID excluding programmer.

SELECT JobId
	,	CONVERT(DECIMAL(10,2),AVG(Salary)) AS 'Avg Salary'
FROM Employees
GROUP BY JobId

--12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

SELECT DepartmentID
	,	MAX(Salary) AS 'Max Salary'
	,	MIN(Salary) AS 'Min Salary'
	,	SUM(Salary) AS 'Total Salaries'
	,	AVG(Salary) AS 'Avg Salary'
FROM Employees
WHERE DepartmentID = 90
GROUP BY DepartmentID

--13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

SELECT JobId
	,	MAX(Salary) AS 'Max Salary'
FROM Employees
GROUP BY JobId
HAVING MAX(Salary) >= 4000

--14. Write a query to get the average salary for all departments employing more than 10 employees.

SELECT DepartmentID
	,	AVG(Salary) AS 'AVG Salary'
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 10
