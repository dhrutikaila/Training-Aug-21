use db2

SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations


-- Q1 Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.

SELECT FirstName,LastName,Salary FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull')


-- Q2 Find the names (first_name, last_name) of all employees who works in the IT department.

SELECT e.FirstName,e.LastName FROM Employees e
WHERE e.DepartmentID = (SELECT d.DepartmentID FROM Departments d WHERE DepartmentName = 'IT')


-- Q3 Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States.
SELECT e.FirstName,e.LastName FROM Employees e
WHERE e.ManagerID IN (
					SELECT d.ManagerID FROM Departments d WHERE d.LocationID IN 
					(SELECT l.LocationID FROM Locations l WHERE l.CountryID = 'US')
					)


-- Q4 Find the names (first_name, last_name) of the employees who are managers.

SELECT FirstName,LastName FROM Employees 
WHERE EmployeeID IN (SELECT ManagerID FROM Employees)


-- Q5 Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary.

SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees)


-- Q6 Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade.

SELECT e.FirstName,e.LastName,e.JobId,e.Salary FROM Employees e
WHERE e.Salary = (SELECT MIN(Salary) FROM Employees WHERE e.JobId = JobId)


-- Q7 Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments.

SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees) 
AND DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%')


-- Q8 Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell

SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bell')


-- Q9 Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments.

SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary = (SELECT MIN(Salary) FROM Employees)


-- Q10 Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department.

SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary > ALL(SELECT AVG(Salary) FROM Employees GROUP BY DepartmentID)


-- Q11 Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
-- Sort the results on salary from the lowest to highest.

SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary > (SELECT MAX(Salary) FROM Employees WHERE JobId = 'SH_CLERK')
ORDER BY Salary


-- Q12 Write a query to find the names (first_name, last_name) of the employees who are not supervisors.

SELECT FirstName,LastName FROM Employees
WHERE EmployeeID NOT IN (SELECT ManagerID FROM Employees)


-- Q13 Write a query to display the employee ID, first name, last names, and department names of all employees.

SELECT e.EmployeeID,
	   e.FirstName,
	   e.LastName,
	   (SELECT d.DepartmentName FROM Departments d WHERE d.DepartmentID = e.DepartmentId) as 'Dept_Name' 
FROM Employees e


-- Q14 Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.

SELECT e.EmployeeID,e.FirstName,e.LastName,e.Salary FROM Employees e
WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE e.DepartmentID = DepartmentID)


-- Q15 Write a query to fetch even numbered records from employees table.

SELECT * FROM 
(SELECT *,ROW_NUMBER() OVER (ORDER BY EmployeeID ASC) as 'rn' FROM Employees) temp
WHERE rn%2 = 0



-- Q16 Write a query to find the 5th maximum salary in the employees table.

SELECT Salary as 'Fifth_Max' FROM Employees
WHERE Salary = (SELECT TOP 1 Salary FROM (SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC) as 'D_Rank' FROM Employees) temp 
		  WHERE D_Rank = 5)


-- Q17 Write a query to find the 4th minimum salary in the employees table.

SELECT DISTINCT Salary FROM Employees
WHERE Salary = 
(SELECT DISTINCT Salary FROM
(SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary ASC) as 'dRank' FROM Employees) tmp
WHERE dRank = 4)


-- Q18 Write a query to select last 10 records from a table.

SELECT * FROM ( SELECT TOP 10 * FROM Employees ORDER BY EmployeeID DESC) temp
ORDER BY EmployeeID ASC


-- Q19 Write a query to list department number, name for all the departments in which there are no employees in the department.

SELECT DepartmentID,DepartmentName FROM Departments
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)


-- Q20 Write a query to get 3 maximum salaries.

SELECT TOP 3 Salary FROM
(SELECT DISTINCT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC) as 'drank' FROM Employees) temp
ORDER BY drank ASC


-- Q21 Write a query to get 3 minimum salaries.

SELECT TOP 3 Salary FROM
(SELECT DISTINCT Salary,DENSE_RANK() OVER (ORDER BY Salary DESC) as 'drank' FROM Employees) temp


-- Q22 Write a query to get nth max salaries of employees.

DECLARE @n int
SET @n = 7

SELECT DISTINCT Salary FROM Employees
WHERE Salary = 
(SELECT DISTINCT Salary FROM
(SELECT Salary,DENSE_RANK() OVER (ORDER BY Salary ASC) as 'dRank' FROM Employees) tmp
WHERE dRank = @n)

