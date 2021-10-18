
--Supported File Practice
--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations
SELECT FirstName, LastName From Employees WHERE DepartmentID IN (SELECT DepartmentID From Departments WHERE DepartmentName = 'IT')

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
--Hint : Write single-row and multiple-row subqueries
SELECT FirstName, LastName FROM Employees 
WHERE ManagerID IN (SELECT ManagerID FROM Departments WHERE ManagerID > 0 AND
 LocationID IN (SELECT LocationID FROM Locations WHERE CountryID = 'US'))

--4. Find the names (first_name, last_name) of the employees who are managers. 

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT FirstName, LastName, Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT FirstName, LastName, Salary FROM Employees WHERE Salary = (SELECT MIN(Salary) FROM Employees)

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees) AND 
DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%')

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary = (SELECT MIN(Salary) FROM Employees)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees) 

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE JobId = 'SH_CLERK') ORDER BY Salary

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
SELECT FirstName, LastName FROM Employees 
WHERE JobId IN (SELECT JobId FROM Jobs WHERE JobTitle != 'Supervisors') 

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT All e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName FROM Employees AS e 
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
SELECT EmployeeID, FirstName, LastName, Salary FROM Employees AS e 
WHERE Salary > (SELECT AVG(Salary) FROM Employees 
WHERE DepartmentID = e.DepartmentID)

--16. Write a query to find the 5th maximum salary in the employees table. 

SELECT * FROM Employees e1 
WHERE 5= (SELECT COUNT(Distinct Salary) FROM Employees e2 WHERE e2.Salary >= e1.Salary)
SELECT * FROM Employees ORDER BY Salary DESC
--17. Write a query to find the 4th minimum salary in the employees table. 

SELECT * FROM Employees e1 
WHERE 4= (SELECT COUNT(Distinct Salary) FROM Employees e2 WHERE e2.Salary <= e1.Salary)

--18. Write a query to select last 10 records from a table.

SELECT TOP 10 * FROM Employees ORDER BY EmployeeID DESC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 

SELECT * FROM Departments WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Departments)

--20. Write a query to get 3 maximum salaries. 

SELECT TOP 3 * FROM Employees ORDER BY Salary DESC

--21. Write a query to get 3 minimum salaries. 

SELECT TOP 3 * FROM Employees ORDER BY Salary

--22. Write a query to get nth max salaries of employees. 

DECLARE @number int
SET @number = 5
SELECT * FROM Employees e1 
WHERE @number= (SELECT COUNT(Distinct Salary) FROM Employees e2 WHERE e2.Salary >= e1.Salary)


--View Query 

--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
 SELECT * FROM Supp1

-----------------------------------
UPDATE Asin3 SET FirstName = 'Devil' WHERE LastName = 'King'
SELECT * FROM Asin3 

SELECT * FROM Employees
-----------------------------------
--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
CREATE VIEW Supp2
AS
(
SELECT CONCAT(FirstName, ' ', LastName) AS Names, DepartmentID FROM Employees
)
SELECT * FROM Supp2

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 
CREATE VIEW Supp3
AS
(
SELECT CONCAT(Employees.FirstName,' ', Employees.LastName) AS Names, Employees.JobId, 
Employees.DepartmentID, Departments.DepartmentName FROM Employees 
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID 
JOIn Locations ON Locations.LocationID = Departments.LocationID 
WHERE Locations.City = 'London'
)

SELECT * FROM Supp3

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
CREATE VIEW Supp4
AS
(
SELECT EmployeeID, LastName AS Name, ManagerID FROM Employees

)
SELECT * FROM Supp4

	--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW Supp5
AS
(
SELECT e.FirstName, e.LastName, e.JoiningDate FROM Employees e 
JOIN Employees emp ON (emp.FirstName = 'John') 
WHERE emp.JoiningDate < e.JoiningDate
)
SELECT * FROM Supp5

--6. Write a query to get the department name and number of employees in the department. 
CREATE VIEW Supp6
AS
(
SELECT DepartmentName AS 'Department Name', 
COUNT(*) AS 'No of Employees' FROM Departments 
INNER JOIN Employees ON Employees.DepartmentID = Departments.DepartmentID 
GROUP BY Departments.DepartmentID, DepartmentName
)
SELECT * FROM Supp6

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 
CREATE VIEW Supp7
AS
(
SELECT JobHistory.EmployeeID, Jobs.JobTitle, DATEDIFF(DAY, JobHistory.EndDate, JobHistory.StartDate) AS Days 
FROM JobHistory 
JOIN Jobs ON JobHistory.JobID = Jobs.JobId 
WHERE DepartmentID = 90
)
SELECT * FROM Supp7

--8. Write a query to display the department ID, department name and manager first name. 
CREATE VIEW Supp8
AS
(
SELECT DepartmentID, DepartmentName, ManagerID FROM Departments
)
SELECT * FROM Supp8

--9. Write a query to display the department name, manager name, and city. 
CREATE VIEW Supp9
AS
(
SELECT Departments.DepartmentName, Departments.ManagerID, Locations.City FROM Departments 
JOIN Locations ON Departments.LocationID = Locations.LocationID
)
SELECT * FROM Supp9
