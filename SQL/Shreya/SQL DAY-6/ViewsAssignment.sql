--1
--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW EmpDetails 
AS
SELECT  e.FirstName +' '+ e.LastName 'EmployeeName' , e.JobId 'Job',d.DepartmentID,d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID=d.DepartmentID
JOIN Locations l ON d.LocationID=l.LocationID 
WHERE l.City = 'LONDON'

SELECT * FROM EmpDetails

--2
--Create a View to get the department name and number of employees in the department.
CREATE VIEW DeptDetails
AS
SELECT d.DepartmentName , e.DepartmentID , count(*) 'No of employee' 
FROM  Departments d,Employees e
WHERE e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName , e.DepartmentID 

SELECT * FROM DeptDetails

--3 Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
CREATE VIEW EmpJobDetails
AS
SELECT EmployeeID,JobID,DATEDIFF(DD,StartDate,EndDate) AS 'Day Difference',DepartmentID
FROM JobHistory
WHERE DepartmentID = 90

SELECT * FROM EmpJobDetails

--4 Write a View to display the department name, manager name, and city.
SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations

CREATE VIEW ManagerDetails 
AS
SELECT e.EmployeeID,e.FirstName + ' '+ e.LastName 'Employee Name',
m.FirstName +' '+m.LastName 'Manager Name',d.DepartmentName , l.City
FROM Employees e 
JOIN Employees m ON e.ManagerID=m.EmployeeID 
JOIN Departments d ON m.DepartmentID= d.DepartmentID
JOIN Locations l ON d.LocationID = l.LocationID

SELECT * FROM ManagerDetails


--5 Create a View to display department name, name (first_name, last_name), 
--hire date, salary of the manager for all managers whose experience is more than 15 years.


SELECT * FROM Employees
SELECT * FROM Departments

CREATE VIEW MgrDetails 
AS
SELECT e.EmployeeID,
m.FirstName +' '+m.LastName 'Manager Name',d.DepartmentName , e.HireDate
FROM Employees e 
JOIN Employees m ON e.ManagerID=m.EmployeeID
JOIN Departments d ON m.DepartmentID = d.DepartmentID
WHERE DATEDIFF (YY,e.HireDate,GETDATE()) > 15

SELECT * FROM MgrDetails
