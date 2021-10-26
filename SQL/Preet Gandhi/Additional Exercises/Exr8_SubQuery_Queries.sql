USE Additional_Practice
--Main Database--

--1)Write a query to find the names (first_name, last_name) and salaries of the employees 
--  who have higher salary than the employee whose last_name='Bull'. 
SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary>(SELECT Salary FROM Employees WHERE LastName='Bull')

--2)Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT FirstName,LastName FROM Employees WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--3)Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
SELECT FirstName,LastName FROM Employees WHERE ManagerID IN
(SELECT EmployeeID FROM Employees WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE LocationID IN 
(SELECT LocationID FROM Locations WHERE CountryID='US')))

--4)Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
SELECT FirstName,LastName FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--5)Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--6)Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT FirstName,LastName, Salary FROM Employees WHERE Salary = (SELECT MIN(Salary) FROM Employees)

--7)Find the names (first_name, last_name), salary of the employees 
--  who earn more than the average salary and who works in any of the IT departments.
SELECT FirstName,LastName,Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)
AND DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%')

--8)Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary >(SELECT Salary FROM Employees WHERE LastName = 'Bell')

--9)Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments.
SELECT CONCAT(FirstName, ' ', LastName) AS 'Name', Salary FROM Employees WHERE Salary =
(SELECT MIN(MinSalary) AS 'LowestSalary' 
FROM (SELECT MIN(Salary) AS 'MinSalary' FROM Employees GROUP BY DepartmentID)temp)

--10)Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department.
SELECT CONCAT(FirstName, ' ', LastName) AS 'Name', Salary FROM Employees WHERE Salary >
(SELECT AVG(AvgSalary) AS 'AvgSalary' 
FROM (SELECT AVG(Salary) AS 'AvgSalary' FROM Employees GROUP BY DepartmentID)temp)

--11)Write a query to find the names (first_name, last_name) and salary of the employees 
--  who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
--  Sort the results on salary from the lowest to highest. 
SELECT FirstName,LastName ,Salary 
FROM Employees WHERE Salary >
ALL (SELECT Salary FROM Employees WHERE JobID = 'SH_CLERK') ORDER BY Salary ASC

--12)Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
SELECT FirstName,LastName FROM Employees WHERE EmployeeID <>
ALL(SELECT ManagerID FROM Employees)

--13)Write a query to display the employee ID, first name, last names, and department names of all employees.
SELECT EmployeeID,FirstName,LastName,
(SELECT DepartmentName FROM Departments AS d WHERE d.DepartmentID=e.DepartmentID) AS 'DepartmentName'
FROM Employees AS e

--14)Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
SELECT EmployeeID,FirstName,LastName,Salary,DepartmentID FROM Employees AS emp WHERE Salary >
(SELECT AVG(Salary) FROM Employees WHERE DepartmentID=emp.DepartmentID)

--15)Write a query to fetch even numbered records from employees table. 
SELECT * FROM
(SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID ASC) [RNumber],* FROM Employees)temp
WHERE RNumber % 2 = 0

--16)Write a query to find the 5th maximum salary in the employees table.
SELECT Salary FROM 
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp WHERE DRANK = 5

--17)Write a query to find the 4th minimum salary in the employees table. 
SELECT DISTINCT Salary FROM 
(SELECT DENSE_RANK() OVER(ORDER BY Salary ASC)[DRANK],Salary FROM Employees)temp WHERE DRANK = 4

--18)Write a query to select last 10 records from a table. 
SELECT TOP 10 * FROM 
(SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID DESC)[RNumber],* FROM Employees )temp 
WHERE RNumber BETWEEN '1' AND '10'

--19)Write a query to list department number, name for all the departments in which there are no employees in the department.
SELECT DepartmentID,DepartmentName FROM Departments 
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)

--20)Write a query to get 3 maximum salaries.
SELECT DISTINCT Salary 
FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp 
WHERE DRANK BETWEEN '1' AND '3'

--21)Write a query to get 3 minimum salaries.
SELECT DISTINCT Salary 
FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary ASC)[DRANK],Salary FROM Employees)temp 
WHERE DRANK BETWEEN '1' AND '3'

--22)Write a query to get nth max salaries of employees.
DECLARE @nth INT
SET @nth = 4
SELECT Salary FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp 
WHERE DRANK = @nth


