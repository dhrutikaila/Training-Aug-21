
--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. --
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. --
SELECT FirstName,LastName FROM Employees WHERE DepartmentID = (SELECT DepartmentID FROM Departments Where DepartmentName = 'IT')

SELECT LocationID FROM Locations WHERE CountryID = 'US'

SELECT ManagerID FROM Departments WHERE LocationID IN (SELECT LocationID FROM Locations WHERE CountryID = 'US')


---3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. --
SELECT * FROM Employees WHERE ManagerID IN (SELECT ManagerID FROM Departments WHERE LocationID IN (SELECT LocationID FROM Locations WHERE CountryID = 'US'))

SELECT FirstName,LastName FROM Employees WHERE ManagerID IN
(SELECT EmployeeID FROM Employees WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE LocationID IN
(SELECT LocationID FROM Locations WHERE CountryID='US')))

-- 4. Find the names (first_name, last_name) of the employees who are managers. --
SELECT FirstName,LastName 
FROM Employees WHERE EmployeeID IN
(SELECT ManagerID FROM Employees)

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. --
SELECT AVG(Salary) FROM Employees

SELECT FirstName,LastName FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT FirstName,LastName FROM Employees WHERE Salary = (SELECT MIN(Salary) FROM Employees)

SELECT MIN(SALARY) FROM Employees GROUP BY JobId ORDER BY JobId

SELECT * FROM Employees WHERE Salary IN (SELECT MIN(SALARY) FROM Employees GROUP BY JobId)


SELECT AVG(SALARY) FROM Employees

SELECT DepartmentID FROM Departments WHERE DepartmentName Like 'IT%' 

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT AVG(SALARY) FROM Employees) AND DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName Like 'IT%' )


--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT MIN(Salary) FROM Employees GROUP BY DepartmentID

SELECT FirstName,LastName,Salary 
FROM Employees 
WHERE Salary IN (SELECT MIN(Salary) 
FROM (
	SELECT MIN(Salary) AS 'SALARY'
	FROM Employees 
	WHERE DepartmentID IN 
	(
		SELECT DepartmentID 
		FROM Employees
	) 
	GROUP BY DepartmentID
) Temp)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT e1.FirstName,e1.LastName,e1.Salary  FROM Employees e1 WHERE Salary > (SELECT AVG(Salary) FROM Employees)

SELECT e1.DepartmentID  FROM Employees e1 GROUP BY DepartmentID

SELECT AVG(e2.Salary),DepartmentID AS AVGSAL FROM Employees e2 WHERE DepartmentID IN 
(SELECT e1.DepartmentID  FROM Employees e1 GROUP BY DepartmentID) GROUP BY DepartmentID

SELECT DepartmentID FROM Employees

SELECT AVG(Salary) 
FROM Employees 
WHERE DepartmentID IN 
(
	SELECT DepartmentID 
	FROM Employees
) 
GROUP BY DepartmentID

SELECT AVG(Salary) 
FROM (
	SELECT AVG(Salary) AS 'SALARY'
	FROM Employees 
	WHERE DepartmentID IN 
	(
		SELECT DepartmentID 
		FROM Employees
	) 
	GROUP BY DepartmentID
) Temp
--- final 10 th query
SELECT FirstName,LastName,Salary 
FROM Employees 
WHERE Salary > (SELECT AVG(Salary) 
FROM (
	SELECT AVG(Salary) AS 'SALARY'
	FROM Employees 
	WHERE DepartmentID IN 
	(
		SELECT DepartmentID 
		FROM Employees
	) 
	GROUP BY DepartmentID
) Temp)


--- 11 Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. ---
SELECT SALARY FROM Employees WHERE JobId = 'SH_CLERK'

SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > ALL (SELECT SALARY FROM Employees WHERE JobId = 'SH_CLERK')

--- 12 Write a query to find the names (first_name, last_name) of the employees who are not supervisors. ---
SELECT ManagerID FROM Employees

SELECT FirstName,LastName FROM Employees WHERE EmployeeID NOT IN (SELECT ManagerID FROM Employees)

--- 13 Write a query to display the employee ID, first name, last names, and department names of all employees. ---

SELECT e.FirstName,e.LastName,d.DepartmentName FROM Employees e JOIN Departments d ON d.DepartmentID = e.DepartmentID

--- 14 Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. ---

SELECT e.FirstName,e.LastName,e.EmployeeID,e.Salary FROM Employees e 
WHERE e.Salary > (SELECT AVG(e2.Salary) FROM Employees e2 WHERE e2.DepartmentID = e.DepartmentID)

--- 15 Write a query to fetch even numbered records from employees table. ---	
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY EmployeeId ASC) [RowNumber],* FROM Employees) temp WHERE RowNumber % 2 = 0 

--- 16 Write a query to find the 5th maximum salary in the employees table. ---

SELECT Salary FROM (SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) [DenseRank], Salary FROM Employees) Temp WHERE DenseRank = 5

--- 17 Write a query to find the 4th minimum salary in the employees table. ---

SELECT Salary FROM (SELECT DENSE_RANK() OVER(ORDER BY SALARY ASC) [DenseRank], Salary FROM Employees) Temp WHERE DenseRank = 4

--- 18 Write a query to select last 10 records from a table. ---
SELECT *  FROM (SELECT ROW_NUMBER() OVER(ORDER BY EmployeeId DESC) [RowNumber], * FROM Employees ) Temp WHERE RowNumber BETWEEN 1 AND 10

-- 19 Write a query to list department number, name for all the departments in which there are no employees in the department. --
SELECT dep.DepartmentID,dep.DepartmentName
FROM Departments dep 
WHERE dep.DepartmentID NOT IN (SELECT emp.DepartmentID FROM Employees AS emp)

--- 20  Write a query to get 3 maximum salaries. --
SELECT DISTINCT Salary
FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp
WHERE DRANK BETWEEN '1' AND '3'


--- 21 Write a query to get 3 minimum salaries. ---
SELECT DISTINCT Salary
FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary ASC)[DRANK],Salary FROM Employees)temp
WHERE DRANK BETWEEN '1' AND '3'


--- 22 Write a query to get nth max salaries of employees. ---
DECLARE @Nth INT
SET @Nth = 4
SELECT * FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary ASC)[RANK_OF_SALARY],Salary FROM Employees) temp
WHERE RANK_OF_SALARY = @Nth



SELECT *
FROM Employees AS emp RIGHT OUTER JOIN Departments AS dep
ON emp.DepartmentID=dep.DepartmentID

SELECT * FROM Employees 
SELECT * FROM Departments 
SELECT * FROM Countries
SELECT * FROM JobHistory
SELECT * FROM Locations
