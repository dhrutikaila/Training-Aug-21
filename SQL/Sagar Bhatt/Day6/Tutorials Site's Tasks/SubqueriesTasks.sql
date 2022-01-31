SELECT *
FROM Employees
SELECT *
FROM Departments
SELECT *
FROM Locations
SELECT *
FROM Countries

--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
	, Salary
FROM Employees
WHERE Salary >
	(
	SELECT Salary
	FROM Employees
	WHERE LastName = 'Bull'
	)

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
FROM Employees
WHERE DepartmentID =
	(
	SELECT DepartmentID
	FROM Departments
	WHERE DepartmentName = 'IT'
	)

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
FROM Employees
WHERE EmployeeID IN
	(
	SELECT ManagerID
	FROM Employees
	WHERE ManagerID IN
		(
		SELECT ManagerID
		FROM Departments
		WHERE LocationID IN
			(
				SELECT LocationID
				FROM Locations
				WHERE CountryID =
				(
					SELECT CountryID
					FROM Countries
					WHERE CountryName = 'United States of America'
				)
			)
		)
	)

--4. Find the names (first_name, last_name) of the employees who are managers. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
FROM Employees
WHERE EmployeeID IN
	(
	SELECT ManagerID
	FROM Employees
	)

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
	, Salary
FROM Employees
WHERE Salary >
	(
	SELECT AVG(Salary)
	FROM Employees
	)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
	, Salary
FROM Employees Emp
WHERE Salary =
	(
	SELECT MIN(Salary)
	FROM Employees
	WHERE JobId = Emp.JobId
	GROUP BY JobId
	)

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
	, Salary
FROM Employees
	WHERE DepartmentID = 
	(
		SELECT DepartmentID
		FROM Departments
		WHERE DepartmentName = 'IT'
		AND Salary >
		(
		SELECT AVG(Salary)
		FROM Employees	
		)
	)

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
	, Salary
FROM Employees
WHERE Salary >
	(
	SELECT Salary
	FROM Employees
	WHERE LastName = 'Bell'
	)

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
	, Salary
FROM Employees
WHERE Salary = 
	(
	SELECT MIN(Salary)
	FROM Employees
	)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT FirstName
	, LastName
	, Salary 
FROM employees 
WHERE Salary > ALL
	(
	SELECT AVG(Salary) 
	FROM employees 
	GROUP BY DepartmentID
	)

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than 
--the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT CONCAT(FirstName, SPACE(1), Lastname) AS 'Full Name'
    ,    Salary
FROM Employees
WHERE Salary >
	(
	SELECT MAX(Salary)
	FROM Employees
	WHERE JobId = 'SH_CLERK'
	)
ORDER BY Salary ASC

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name'
FROM Employees
WHERE EmployeeID NOT IN
	(
	SELECT ManagerID
	FROM Employees
	)

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT Emp.EmployeeID
	, Emp.FirstName
	, Emp.LastName
	, Dpt.DepartmentName
FROM Employees Emp
JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
SELECT EmployeeID
	, FirstName
	, LastName
	, Salary
FROM Employees Emp
WHERE Salary >
	(
	SELECT AVG(Salary)
	FROM Employees
	WHERE DepartmentID = Emp.DepartmentID
	GROUP BY DepartmentID
	)

--15. Write a query to fetch even numbered records from employees table. 
SELECT * FROM
(SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID) AS 'Rank', *
FROM Employees) Tmp
WHERE Rank % 2 = 0

--16. Write a query to find the 5th maximum salary in the employees table. 
SELECT TOP 1 Salary
FROM (
	SELECT DISTINCT TOP 5 Salary
	FROM Employees
	ORDER BY Salary DESC
) Tmp
ORDER BY Salary ASC

--17. Write a query to find the 4th minimum salary in the employees table. 
SELECT TOP 1 Salary
FROM (
	SELECT DISTINCT TOP 4 Salary
	FROM Employees
	ORDER BY Salary ASC
) Tmp
ORDER BY Salary DESC

--18. Write a query to select last 10 records from a table. 
SELECT *
FROM (
	SELECT TOP 10 *
	FROM Employees
	ORDER BY EmployeeID DESC
) Tmp
ORDER BY EmployeeID ASC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT DepartmentID 'Department Number'
	, DepartmentName
FROM Departments
WHERE DepartmentID NOT IN
	(
	SELECT DepartmentID
	FROM Employees
	)

--20. Write a query to get 3 maximum salaries. 
SELECT DISTINCT TOP 3 Salary
FROM Employees
ORDER BY Salary DESC

--22. Write a query to get nth max salaries of employees.
DECLARE @n INT
SET @n = 10
SELECT TOP 1 Salary
FROM (
	SELECT DISTINCT TOP (@n) Salary
	FROM Employees
	ORDER BY Salary DESC
) Tmp
ORDER BY Salary ASC

