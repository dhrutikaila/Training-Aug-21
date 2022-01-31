--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary FROM Employees WHERE Salary>(SELECT Salary FROM Employees WHERE LastName='Bull')


--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT CONCAT(FirstName,' ', LastName) AS 'Name' 
	FROM Employees 
		WHERE DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT')




--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
--Hint : Write single-row and multiple-row subqueries
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name' FROM Employees
	WHERE ManagerID IN (SELECT EmployeeID FROM employees WHERE DepartmentID
		IN (SELECT DepartmentID FROM Departments WHERE LocationID
		IN (SELECT LocationID FROM Locations WHERE CountryID='US')))


--4. Find the names (first_name, last_name) of the employees who are managers. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name' FROM Employees
	WHERE (EmployeeID 
		IN (SELECT ManagerID FROM Employees))


--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary FROM Employees 
	WHERE Salary>(SELECT AVG(Salary) FROM Employees)


--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT CONCAT(e.FirstName,' ', e.LastName) AS 'Name', e.Salary, e.JobId
	FROM Employees e
		WHERE e.Salary=(SELECT MIN(s.Salary) FROM Employees s WHERE e.JobId = s.JobId)


--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary FROM Employees 
	WHERE DepartmentID IN 
		(SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%') 
		  AND Salary > (SELECT AVG(Salary) FROM Employees)


--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary FROM Employees 
	WHERE Salary>
		(SELECT Salary FROM Employees WHERE LastName = 'Bell')


--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT CONCAT(FirstName,' ', LastName) AS 'Name', Salary, DepartmentID FROM Employees 
	WHERE Salary IN (SELECT MIN(Salary) FROM Employees GROUP BY DepartmentID)



--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary AS 'More_Than_Average' 
	FROM Employees WHERE Salary>ALL
		(SELECT AVG(Salary)FROM Employees GROUP BY DepartmentID)


--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Employee_Name', Salary AS 'More_Than_SH_Clerk'
	FROM Employees WHERE Salary >
		(SELECT MAX(Salary) FROM Employees WHERE JobId = 'SH_CLERK') ORDER BY Salary ASC


--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
SELECT CONCAT(FirstName,' ',LastName) AS 'Not_Supervisors' 
	FROM Employees WHERE EmployeeID NOT IN 
		(SELECT DISTINCT (ManagerID) FROM Employees WHERE ManagerID != 0)


--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName AS 'Department' 
	FROM Employees e LEFT JOIN Departments d ON e.DepartmentID=d.DepartmentID


--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary FROM Employees e 
	WHERE e.Salary> 
		(SELECT AVG(s.Salary) FROM Employees s WHERE e.DepartmentID=s.DepartmentID)


--15. Write a query to fetch even numbered records from employees table. 
SELECT * FROM Employees  WHERE EmployeeID % 2 = 0
  

--16. Write a query to find the 5th maximum salary in the employees table. 
SELECT DISTINCT Salary AS '5thMaxSalary' FROM 
	(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS 'Pagar', Salary FROM Employees) EmployeeTemp
		WHERE Pagar = 5 


--17. Write a query to find the 4th minimum salary in the employees table. 
SELECT DISTINCT Salary AS '4thMaxSalary' FROM 
	(SELECT DENSE_RANK() OVER (ORDER BY Salary ASC) AS 'Pagar', Salary FROM Employees) EmployeeTemp
		WHERE Pagar = 4


--18. Write a query to select last 10 records from a table. 
SELECT TOP 10 * FROM Employees ORDER BY EmployeeID DESC


--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT DepartmentID, DepartmentName FROM Departments
	WHERE DepartmentID NOT IN
		(SELECT DepartmentID FROM Employees)

        
--20. Write a query to get 3 maximum salaries. 
SELECT DISTINCT TOP 3 Salary AS 'TOP-3 Max' FROM Employees ORDER BY Salary DESC


--21. Write a query to get 3 minimum salaries. 
SELECT DISTINCT TOP 3 Salary AS 'TOP-3 Min' FROM Employees ORDER BY Salary ASC


--22. Write a query to get nth max salaries of employees......
SELECT * FROM Employees e WHERE (n) = 
	(SELECT COUNT(DISTINCT(em.Salary))
		FROM Employees em
			WHERE em.Salary > e.Salary)
