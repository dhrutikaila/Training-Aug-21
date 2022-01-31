--22 subquery task
SELECT * FROM Employees WHERE LastName='Bull'

--query1
--Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 

SELECT FirstName,LastName FROM Employees
WHERE Salary > (SELECT Salary FROM Employees
				WHERE LastName='Bull')

--query2
--Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT * FROM Departments

SELECT FirstName,LastName FROM Employees
WHERE DepartmentID =(SELECT DepartmentID FROM Departments
					 WHERE DepartmentName='IT')

--query3
-- Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 

SELECT * FROM Locations
SELECT * FROM Employees
SELECT * FROM Departments

SELECT FirstName,LastName FROM Employees
WHERE ManagerID IN 
		(SELECT ManagerID FROM Departments
		WHERE LocationID IN 
			(SELECT LocationID FROM Locations
			WHERE CountryID='US')
		)

--query4
--Find the names (first_name, last_name) of the employees who are managers. 
SELECT FirstName,LastName FROM Employees
WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--query5
--Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT FirstName,LastName FROM Employees
WHERE Salary > (SELECT AVG(Salary) AS avgSalary FROM Employees)

--query6
--Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

SELECT FirstName,LastName FROM Employees
WHERE Salary IN ( SELECT MIN(Salary) FROM Employees GROUP BY JobId )

--query7
--Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

SELECT FirstName,LastName FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees
				WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName='IT') )
	AND DepartmentID = 60

--query8
--Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 

SELECT * FROM Employees WHERE LastName ='Bell'

SELECT FirstName,LastName FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName='Bell')

--query9
--Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 

SELECT FirstName,LastName FROM Employees
WHERE Salary IN 
	(SELECT MIN(Salary) FROM Employees
	 GROUP BY DepartmentID)

--query10
--Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

SELECT FirstName,LastName,Salary FROM Employees AS o
WHERE Salary > 
	(SELECT AVG(Salary) FROM Employees AS i
	 GROUP BY DepartmentID
	 HAVING i.DepartmentID = o.DepartmentID)

--query11
--Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 

SELECT FirstName,LastName,Salary FROM Employees
WHERE Salary > (SELECT MAX(Salary) FROM Employees
				WHERE JobId='SH_CLERK')
ORDER BY Salary

--query12
--Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

--SELECT * FROM Employees

SELECT FirstName,LastName,EmployeeID FROM Employees
WHERE EmployeeID NOT IN 
		(SELECT ManagerID FROM Employees)


--query13
--Write a query to display the employee ID, first name, last names, and department names of all employees. 

SELECT EmployeeID
	,FirstName
	,LastName
	,(SELECT DepartmentName FROM Departments AS d
	WHERE d.DepartmentID = e.DepartmentID) 
FROM Employees AS e

--query14
--Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 

SELECT EmployeeID
	,FirstName
	,LastName
	,Salary
FROM Employees o
WHERE Salary > 
	(SELECT AVG(Salary) FROM Employees i
	GROUP BY DepartmentID
	HAVING o.DepartmentID = i.DepartmentID)

--query15
--Write a query to fetch even numbered records from employees table. 

SELECT * FROM (SELECT *,ROW_NUMBER() OVER (ORDER BY EmployeeID ASC) AS row FROM Employees) em
WHERE row%2=0

--query16
--Write a query to find the 5th maximum salary in the employees table. 

SELECT Salary FROM (SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC ) AS rank FROM Employees) emp
WHERE rank = 5

--query17
--Write a query to find the 4th minimum salary in the employees table. 

SELECT Salary FROM (SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary ASC ) AS rank FROM Employees) emp
WHERE rank = 4

--query18
--Write a query to select last 10 records from a table. 

SELECT * FROM 
(SELECT TOP 10 * FROM Employees ORDER BY EmployeeID DESC) em
ORDER BY EmployeeID

--query19
--Write a query to list department number, name for all the departments in which there are no employees in the department. 

SELECT DepartmentID,DepartmentName FROM Departments
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)

--query20
--Write a query to get 3 maximum salaries. 

SELECT TOP 3 Salary FROM (SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC ) AS rank FROM Employees) emp

--query21
--Write a query to get 3 minimum salaries. 

SELECT Salary FROM (SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary ASC ) AS rank FROM Employees) emp
WHERE rank <= 3


--query22
--Write a query to get nth max salaries of employees. 

Declare @n int 
SELECT Salary FROM (SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC ) AS rank FROM Employees) emp
WHERE rank <= @n