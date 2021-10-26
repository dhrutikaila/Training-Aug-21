-- Addition view tasks

USE SampleTable
--q1
--Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

SELECT * FROM Locations
CREATE VIEW AS q1
AS
SELECT l.LocationId
	,StreetAddress
	,City
	,StateProvince
	,CountryID
FROM Departments d
	INNER JOIN Locations l ON d.locationId = l.LocationID

--q2
--Write a query to find the names (first_name, last name), department ID and name of all the employees. 

CREATE VIEW q2
AS
SELECT e.FirstName +' '+e.LastName AS Name
	,e.DepartmentId
	,d.DepartmentName
FROM Employees e
	INNER JOIN Departments d ON d.DepartmentID = e.DepartmentID 

--q3
--Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

CREATE VIEW DemoView3
AS
SELECT e.FirstName
	,e.LastName
	,e.JobID
	,e.DepartmentID
	,d.DepartmentName
FROM Employees e
 INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
 INNER JOIN Locations l ON d.LocationID = l.LocationID
WHERE l.City = 'London'

--q4
--Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

CREATE VIEW q4
AS
SELECT e.EmployeeID
	,e.LastName
	,e.ManagerID
	,m.LastName
FROM Employees e
	LEFT OUTER JOIN Employees m ON e.ManagerID=m.EmployeeID

--q5
--Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

CREATE VIEW q5
AS
SELECT FirstName
	,LastName
	,JoiningDate
FROM Employees
WHERE JoiningDate > (SELECT JoiningDate FROM Employees WHERE LastName='Jones')

--q6
--Write a query to get the department name and number of employees in the department. 

CREATE VIEW q6
AS
SELECT d.DepartmentName, COUNT(EmployeeID) AS 'works at'
FROM Departments d
	LEFT OUTER JOIN Employees e ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName

--q7
--Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

CREATE VIEW q7
AS
SELECT EmployeeID,JObID,DATEDIFF(Day,StartDate,EndDate) AS days
FROM JobHistory
WHERE DepartmentID = 90

--q8
--Write a query to display the department ID, department name and manager first name. 

CREATE VIEW q8
AS
SELECT d.DepartmentID
	,d.DepartmentName
	,e.Firstname
FROM Departments d
	INNER JOIN Employees e ON d.ManagerID = e.EmployeeID

--q9
--Write a query to display the department name, manager name, and city. 

CREATE AS q9
AS
SELECT DepartmentName 
	,e.FirstName
	,e.LastName
	,l.City
FROM Departments d
	INNER JOIN Employees e ON d.ManagerID = e.EmployeeID
	INNER JOIN Locations l ON d.LocationID = l.LocationID

--q10
--Write a query to display the job title and average salary of employees. 

CREATE VIEW q10
AS
SELECT AVG(Salary) AS AvgSalary
	,JobId
FROM Employees
GROUP BY JobId

--q11
--Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

CREATE VIEW q11
AS
SELECT
	JobID
	,FirstName+' '+LastName AS name
	,Salary - (SELECT MIN(Salary) FROM Employees i WHERE i.JobId = e.JobId ) AS 'more then min Salary'
FROM Employees e

SELECT * FROM q11


--12
--Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

CREATE VIEW AS q12
AS
SELECT 
	e.FirstName
	,j.*
FROM JobHistory j
	INNER JOIN Employees e ON e.EmployeeID = j.EmployeeID
WHERE e.Salary > 10000


--q13
--Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 

CREATE VIEW DemoView7
AS
SELECT DepartmentName 
	,e.FirstName+' '+e.LastName AS Name
	,e.JoiningDate
	,e.Salary
FROM Departments d
	INNER JOIN Employees e ON d.ManagerID = e.EmployeeID
	INNER JOIN JobHistory j ON e.EmployeeID = j.EmployeeID
WHERE DATEDIFF(YYYY,j.StartDate,j.endDate) > 2

--used 2 year instead of 15 year