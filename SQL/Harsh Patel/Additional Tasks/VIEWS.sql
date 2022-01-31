SELECT *
FROM Employees
SELECT *
FROM Departments
SELECT *
FROM Locations
SELECT *
FROM Countries
SELECT *
FROM JobHistory

--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
CREATE VIEW Department_1 
AS
SELECT Loc.LocationID
	, Loc.StreetAddress
	, Loc.City
	, Loc.StateProvince
	, Con.CountryName
FROM Departments Dpt
JOIN Locations Loc
ON Loc.LocationID = Dpt.LocationID
LEFT JOIN Countries Con
ON Con.CountryID = Loc.CountryID

SELECT *
FROM Department_1
GO
--2. Write a query to find the names (first_name, last name), department ID and name of all the employees.
CREATE VIEW Department_2
AS
SELECT CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) 'Full Name'
	, Dpt.DepartmentID
	, Dpt.DepartmentName
FROM Employees Emp
JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID

SELECT *
FROM Department_2

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 
CREATE VIEW Department_3
AS
SELECT CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) 'Full Name'
	, Dpt.DepartmentID
	, Dpt.DepartmentName
FROM Employees Emp
JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
JOIN Locations Loc
ON Loc.LocationID = Dpt.LocationID
WHERE Loc.City = 'London'

SELECT *
FROM Department_3

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
CREATE VIEW vw_Emp_1
AS
SELECT Emp.EmployeeID
	, Emp.LastName 'Name'
	, Emp.ManagerID
	, Mgr.LastName 'Manager Name'
FROM Employees Emp
LEFT JOIN Employees Mgr
ON Emp.ManagerID = Mgr.EmployeeID

SELECT *
FROM vw_Emp_1

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW vw_Emp_2
AS
SELECT CONCAT(FirstName, SPACE(1), LastName) 'Name'
	, HireDate
FROM Employees
WHERE HireDate >
	(
	SELECT HireDate
	FROM Employees
	WHERE LastName = 'Jones'
	)

SELECT *
FROM vw_Emp_2

--6. Write a query to get the department name and number of employees in the department. 
CREATE VIEW  DEPt_1
AS
SELECT Dpt.DepartmentName
	, COUNT(Emp.EmployeeID) 'Number of Employees'
FROM Employees Emp
RIGHT JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
GROUP BY Dpt.DepartmentName

SELECT *
FROM DEPt_1

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 
CREATE VIEW DEPt_2
AS
SELECT EmployeeID
	, JobID 'Job Title'
	, DATEDIFF(dd, Startdate, EndDate) 'Days'
FROM JobHistory
WHERE DepartmentID = 90

SELECT *
FROM DEPt_2

--8. Write a query to display the department ID, department name and manager first name.
CREATE VIEW DEPt_3
AS
SELECT Dpt.DepartmentID 
	, Dpt.DepartmentName
	, Emp.FirstName
FROM Employees Emp
JOIN Departments Dpt
ON Emp.EmployeeID = Dpt.ManagerID

SELECT *
FROM DEPt_3

--9. Write a query to display the department name, manager name, and city. 
CREATE VIEW DEPt_4
AS
SELECT Dpt.DepartmentID 
	, Dpt.DepartmentName
	, Emp.FirstName
	, Loc.City
FROM Employees Emp
RIGHT JOIN Departments Dpt
ON Emp.EmployeeID = Dpt.ManagerID
JOIN Locations Loc
ON Loc.LocationID = Dpt.LocationID

SELECT *
FROM DEPt_4
--10. Write a query to display the job title and average salary of employees. 
CREATE VIEW DEPt_5
AS
SELECT JobId 'Job Title'
	, AVG(Salary) 'Average Salary'
FROM Employees
GROUP BY JobId

SELECT *
FROM DEPt_5

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
CREATE VIEW DEPt_6
AS
SELECT Emp.JobId
	, CONCAT(FirstName, SPACE(1), Lastname) 'Employee Name'
	, (Salary - (SELECT MIN(Salary)
		FROM Employees
		WHERE JobId = Emp.JobId
		)) AS 'Salary Differnece'
	, Salary
	, (SELECT MIN(Salary)
		FROM Employees
		WHERE JobId = Emp.JobId) 'Min Salary'
FROM Employees AS Emp

SELECT *
FROM DEPt_6

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
CREATE VIEW DEPt_7
AS
SELECT *
FROM JobHistory
WHERE EmployeeID IN
	(
	SELECT EmployeeID
	FROM Employees
	WHERE Salary > 10000
	)

SELECT *
FROM DEPt_7

--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 
 CREATE VIEW DEP2
AS
SELECT Dpt.DepartmentName
	, CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) 'Name'
	, HireDate
	, Salary
FROM Departments Dpt
JOIN Employees Emp
ON Dpt.ManagerID = Emp.EmployeeID AND DATEDIFF(yyyy, HireDate, GETDATE()) > 15

SELECT *
FROM DEP2
