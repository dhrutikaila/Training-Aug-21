
--1) Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"

SELECT	FirstName AS 'First Name', LastName AS 'Last Name', 
CONCAT(FirstName, SPACE(1), LastName) AS 'Full Name'
FROM Employees

--2) Write a query to get unique department ID from employee table.

SELECT DISTINCT DepartmentID
FROM Employees

--3)Write a query to get all employee details from the employee table order by first name, descending.

SELECT *
FROM Employees
ORDER BY FirstName DESC

--4)Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary).

SELECT	CONCAT(FirstName, SPACE(1), LastName) AS 'Full Name'
	, Salary
	, CONVERT(DECIMAL(8,2),(Salary * 12) / 100) AS 'PF'
FROM Employees

--5)Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.

SELECT	EmployeeID
	, CONCAT(FirstName, SPACE(1), LastName) AS 'Full Name'
	, Salary 
FROM Employees
ORDER BY Salary ASC

--6) Write a query to get the total salaries payable to employees.

SELECT SUM(Salary) AS 'Total Salary'
FROM Employees

--7)Write a query to get the maximum and minimum salary from employees table.

SELECT MAX(Salary) AS 'Max Salary'
	, MIN(Salary) AS 'Min Salary'
FROM Employees

--8)Write a query to get the average salary and number of employees in the employees table.

SELECT COUNT(*) AS 'Total Employee'
	, AVG(Salary) AS 'Average Salary'
FROM Employees

--9)Write a query to get the number of employees working with the company.

SELECT COUNT(*) AS 'Total Employee'
FROM Employees

--10)Write a query to get the number of jobs available in the employees table.

SELECT COUNT(JobId) AS 'Total Jobs'
FROM Employees


--11)Write a query get all first name from employees table in uppr case.

SELECT UPPER(FirstName) AS 'First Name'
FROM Employees

