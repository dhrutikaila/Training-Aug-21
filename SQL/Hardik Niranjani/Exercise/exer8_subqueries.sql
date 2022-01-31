
--1. Write a query to find the names (first_name, last_name) and 
--salaries of the employees who have higher salary than the employee whose 
--last_name='Bull'. 

 SELECT FirstName, LastName FROM Employees
			WHERE Salary > (SELECT Salary FROM employees WHERE LastName = 'Bull')



--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT FirstName, LastName FROM Employees
				WHERE DepartmentID IN 
				(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')



--3. Find the names (first_name, last_name) of the employees who have a manager who works 
--for a department based in United States. 

SELECT FirstName,LastName FROM Employees
			WHERE ManagerID IN 
			(SELECT EmployeeID FROM Employees 
				WHERE DepartmentID IN (SELECT DepartmentID FROM Departments
					WHERE LocationID IN(SELECT LocationID FROM Locations WHERE CountryID='US' )))



--4. Find the names (first_name, last_name) of the employees who are managers. 

	 SELECT FirstName, LastName FROM Employees
						WHERE EmployeeID IN (SELECT ManagerID FROM Employees)
				





--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

	SELECT FirstName, LastName FROM Employees
					WHERE Salary > (SELECT Avg(Salary) FROM Employees)





--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the 
--minimum salary for their job grade. 

	SELECT FirstName, LastName,JobId FROM Employees AS e
				WHERE Salary = (SELECT min(Salary) FROM Employees 
								  WHERE JobId IN (SELECT JobID FROM JobHistory AS j
									WHERE e.JobId= j.JobID ))




--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary 
--and who works in any of the IT departments. 

	SELECT FirstName,LastName FROM Employees
			WHERE Salary > (SELECT AVG(Salary) FROM Employees 
					WHERE DepartmentID IN 
						(SELECT DepartmentID FROM Departments 
								WHERE DepartmentName='IT'))
			


--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.

	SELECT FirstName, LastName FROM Employees
				WHERE Salary > (SELECT Salary FROM Employees WHERE LastName='Bell')





--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the 
--minimum salary for all departments. 

		SELECT FirstName,LastName FROM Employees
				WHERE Salary = (SELECT MIN(Salary) FROM Employees )




--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department.

	SELECT FirstName, LastName FROM Employees
			WHERE Salary > ALL (SELECT AVG(Salary) FROM Employees GROUP BY DepartmentID)




--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a 
--salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
--Sort the results on salary from the lowest to highest. 

	SELECT FirstName, LastName, Salary FROM Employees
				WHERE Salary >ALL(SELECT Salary FROM Employees Where JobId ='SH_CLERK') ORDER BY Salary ASC
	




--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

	SELECT FirstName,LastName FROM Employees AS e1
	  WHERE EmployeeID  NOT IN (SELECT e2.ManagerID FROM Employees AS e2 
				WHERE e2.ManagerID = e1.EmployeeID)



--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

	SELECT FirstName, LastName, EmployeeID, 
		(SELECT DepartmentName FROM Departments AS d WHERE e.DepartmentID = d.DepartmentID ) AS Department 
			FROM Employees AS e
			




--14. Write a query to display the employee ID, first name, last names, salary of all employees 
--whose salary is above average for their departments. 

	SELECT EmployeeID, FirstName, LastName, Salary FROM Employees AS e
			WHERE Salary > (SELECT Avg(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID ) ORDER BY Salary DESC





--15. Write a query to fetch even numbered records from employees table. 

	SELECT EmployeeID  FROM Employees
			WHERE (EmployeeID % 2)=0



--16. Write a query to find the 5th maximum salary in the employees table. 

	SELECT Salary FROM Employees e1
		WHERE 5 = (SELECT Count(Salary) FROM Employees e2
							WHERE e2.Salary >= e1.Salary )
					

--17. Write a query to find the 4th minimum salary in the employees table. 

		SELECT Distinct Salary FROM Employees e1
				WHERE 4 = (SELECT Count(Distinct Salary) FROM Employees e2
									WHERE e2.Salary <= e1.Salary)


--18. Write a query to select last 10 records from a table. 

	SELECT TOP(10) * FROM Employees ORDER BY EmployeeID DESC 
			



--19. Write a query to list department number, name for all the departments in which there are no employees in the department.

	SELECT DepartmentID, DepartmentName FROM Departments
			WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)
			



--20. Write a query to get 3 maximum salaries. 

	SELECT Distinct TOP(3) Salary FROM Employees ORDER BY Salary DESC
				


--21. Write a query to get 3 minimum salaries. 

	SELECT Distinct TOP(3) Salary FROM Employees ORDER BY Salary ASC

--22. Write a query to get nth max salaries of employees.

	SELECT Distinct Salary FROM Employees e1
				WHERE N = (SELECT Count(Distinct Salary) 
									FROM Employees e2
									WHERE e2.Salary >= e1.Salary)
							ORDER BY e1.Salary
												





SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM JobHistory

SELECT * FROM Locations


				

