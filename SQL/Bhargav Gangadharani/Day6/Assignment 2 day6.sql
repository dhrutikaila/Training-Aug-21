-- 1. Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW EMP_LONDON
AS
SELECT E.FirstName , E.LastName ,E.JobId, D.DepartmentID , D.DepartmentName FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
JOIN Locations AS L ON D.LocationID = L.LocationID
WHERE L.City = 'London'


-- 2. Create a View to get the department name and number of employees in the department.
CREATE VIEW EMP_CONT
AS
SELECT DepartmentName , DepartmentID FROM Departments


-- 3. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID , JobID , DATEDIFF(DAY , StartDate , EndDate) Days FROM JobHistory
WHERE DepartmentID = 90 


-- 4. Write a View to display the department name, manager name, and city.
CREATE VIEW DEPT 
AS
SELECT d.DepartmentName,e.FirstName,l.City
FROM Departments d
JOIN Employees e ON d.ManagerID=e.EmployeeID
JOIN Locations l ON d.LocationID =l.LocationID

select * from Departments
-- 5. Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

CREATE VIEW EXP_15Y
AS
SELECT d.DepartmentName,e.FirstName+' '+e.LastName 'Name',e.HireDate,e.Salary
FROM Departments d
JOIN Employees e
ON d.ManagerID=e.EmployeeID
WHERE DATEDIFF(YEAR,HireDate,GETDATE()) > 15

