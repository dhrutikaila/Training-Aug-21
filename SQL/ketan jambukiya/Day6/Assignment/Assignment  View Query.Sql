USE Ketan

Query 1

--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

CREATE VIEW EMPDETAILS
AS
(SELECT e.FirstName,e.LastName,e.JobId,d.DepartmentID,d.DepartmentName
FROM Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID 
JOIN Locations l
ON d.LocationID=l.LocationID WHERE l.City='London')

Query 2

--Create a View to get the department name and number of employees in the department.

CREATE VIEW Depdetail
AS
(SELECT e.EmployeeID,d.DepartmentID,d.DepartmentName
FROM Employees  e JOIN Departments d ON e.DepartmentID=d.DepartmentID)

Query 3

--Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history

CREATE VIEW JobDetail
AS
(SELECT e.EmployeeID,j.JobID,DATEDIFF(DAY,j.StartDate,j.EndDate) AS NumberofDays FROM Employees e JOIN JobHistory j 
ON e.EmployeeID=j.EmployeeID JOIN Departments d 
ON j.DepartmentID=d.DepartmentID
WHERE d.DepartmentID=90)

Query 4

--Write a View to display the department name, manager name, and city.

CREATE VIEW DMC
AS
(SELECT emp.EmployeeID,mgr.FirstName AS ManagerName ,d.DepartmentName,l.City
FROM Employees emp JOIN Employees mgr
ON mgr.EmployeeID=emp.ManagerID 
JOIN Departments d  ON d.DepartmentID=emp.DepartmentID
JOIN Locations l ON d.LocationID=l.LocationID)

Query 5

--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

CREATE VIEW ManagerDetail
AS
(SELECT mgr.FirstName,mgr.LastName,mgr.HireDate,mgr.Salary 
FROM Employees emp JOIN Employees mgr
ON mgr.EmployeeID=emp.ManagerID 
JOIN JobHistory j ON mgr.EmployeeID=j.EmployeeID
WHERE DATEDIFF(YEAR,j.StartDate,j.EndDate)>15)