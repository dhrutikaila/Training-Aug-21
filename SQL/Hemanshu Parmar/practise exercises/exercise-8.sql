--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary 
FROM Employees 
WHERE Salary > (SELECT Salary 
			   FROM Employees 
			   WHERE LastName = 'Bull')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name' 
FROM Employees 
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT')

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 

--Hint : Write single-row and multiple-row subqueries
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name' 
FROM Employees
WHERE ManagerID IN (SELECT EmployeeID 
				    FROM Employees 
				    WHERE DepartmentID IN (SELECT DepartmentID
										   FROM Departments 
										   WHERE LocationID IN (SELECT LocationID 
																FROM Locations 
																WHERE CountryID = 'US')))

--4. Find the names (first_name, last_name) of the employees who are managers. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name' 
FROM Employees 
WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary 
FROM Employees 
WHERE Salary > (SELECT AVG (Salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT CONCAT(E.FirstName, SPACE(1), E.LastName) AS 'Name', E.Salary, E.JobId
FROM Employees E
WHERE E.Salary = (SELECT MIN(S.Salary) FROM Employees S WHERE E.JobId = S.JobId)

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary
FROM Employees 
WHERE Salary > (SELECT AVG(Salary) 
				  FROM Employees)
AND DepartmentID IN (SELECT DepartmentID 
					 FROM Departments 
					 WHERE DepartmentName LIKE 'IT%')

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary
FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary, DepartmentID 
FROM Employees 
WHERE Salary IN (SELECT MIN (Salary)FROM Employees GROUP BY DepartmentID)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary
FROM Employees 
WHERE Salary > ALL (SELECT AVG (Salary) FROM Employees GROUP BY DepartmentID)

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary, JobId
FROM Employees 
WHERE Salary >ALL (SELECT Salary FROM Employees WHERE JobId = 'SH_CLERK')
ORDER BY Salary ASC

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
SELECT EmployeeID, CONCAT(FirstName, SPACE(1), LastName) AS 'Name'
FROM Employees 
WHERE EmployeeID NOT IN (SELECT DISTINCT (ManagerID) FROM Employees)

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName 
FROM Employees E LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID


--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
SELECT E.EmployeeID, E.FirstName, E.LastName, E.Salary 
FROM Employees E 
WHERE E.Salary > (SELECT AVG(S.Salary) FROM Employees S WHERE E.DepartmentID = S.DepartmentID)

--15. Write a query to fetch even numbered records from employees table. 
SELECT * 
FROM Employees
WHERE EmployeeID % 2 = 0

--16. Write a query to find the 5th maximum salary in the employees table. 
SELECT DISTINCT(Salary) 
FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS 'Rank', Salary 
	 FROM Employees) temp 
WHERE Rank = 5

--17. Write a query to find the 4th minimum salary in the employees table. 
SELECT DISTINCT(Salary) 
FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary ASC) AS 'SRank', Salary 
	 FROM Employees) temp 
WHERE SRank = 4

--18. Write a query to select last 10 records from a table. 
SELECT * 
FROM (SELECT TOP (10) * 
	  FROM Employees 
	  ORDER BY EmployeeID DESC) temp 
ORDER BY EmployeeID ASC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT D.DepartmentID, D.DepartmentName 
FROM Departments D 
WHERE D.DepartmentID NOT IN (SELECT DISTINCT(E.DepartmentID) FROM Employees E)

--20. Write a query to get 3 maximum salaries. 
SELECT TOP (3) Salary 
FROM (SELECT DISTINCT(Salary) 
	  FROM Employees) temp  
ORDER BY Salary DESC

--21. Write a query to get 3 minimum salaries. 
SELECT TOP (3) Salary 
FROM (SELECT DISTINCT(Salary) 
	  FROM Employees) temp  
ORDER BY Salary ASC

--22. Write a query to get nth max salaries of employees. 
SELECT DISTINCT(Salary) 
FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS 'SRank', Salary 
	  FROM Employees) temp 
WHERE SRank = (n)