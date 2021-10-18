--task-1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
CREATE VIEW DepartmentView
AS
SELECT D.DepartmentName,L.LocationID,L.StreetAddress,L.StateProvince,L.CountryID FROM Departments D JOIN Locations L ON L.LocationID=D.LocationID
SELECT * FROM DepartmentView
--task-2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
CREATE VIEW EmployeesView
AS
SELECT DepartmentID,CONCAT(FirstName,' ',LastName) AS Name FROM Employees
SELECT * FROM EmployeesView

--task-3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 
CREATE VIEW EmployeesView
AS
SELECT CONCAT(E.FirstName,' ',E.LastName) AS Name,E.JobId,E.DepartmentID,D.DepartmentName 
FROM Employees E FULL JOIN Departments D ON D.DepartmentID=E.DepartmentID
JOIN Locations L ON L.LocationID=D.LocationID
WHERE L.City='London'
GO
SELECT * FROM EmployeesView
--task-4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
CREATE VIEW EmployeesView
AS
SELECT E.EmployeeID,E.LastName AS Name,E.ManagerID,M.LastName AS ManagerName FROM Employees E JOIN Employees M ON E.ManagerID=M.EmployeeID
SELECT * FROM EmployeesView

--task-5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW EmployeessView
AS
SELECT HireDate,CONCAT(FirstName,' ',LastName) AS Name FROM Employees
WHERE HireDate > (SELECT HireDate From Employees WHERE LastName='Jones')
SELECT * FROM EmployeessView

--task-6. Write a query to get the department name and number of employees in the department. 
CREATE VIEW DepartmentView
AS
SELECT DepartmentName,COUNT(EmployeeID) AS TotalEmployees FROM Employees E JOIN Departments D ON D.DepartmentID=E.DepartmentID GROUP BY DepartmentName
SELECT * FROM DepartmentView

--task-7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 
CREATE VIEW JobHistoryView
AS
SELECT E.EmployeeID,E.JobId,DATEDIFF(DAY,J.StartDate,J.EndDate) AS DAYS FROM Employees E JOIN JobHistory J ON J.EmployeeID=E.EmployeeID 
SELECT * FROM JobHistoryView

--task-8. Write a query to display the department ID, department name and manager first name. 
CREATE VIEW DepartmentManagerView
AS
SELECT E.EmployeeID,E.JobId,DATEDIFF(DAY,J.StartDate,J.EndDate) AS DAYS FROM 

--task-9. Write a query to display the department name, manager name, and city. 
CREATE VIEW DepartmentsView
AS
SELECT D.DepartmentName,CONCAT(E.FirstName,' ',E.LastName) AS Name,City FROM Departments D JOIN Employees E ON D.ManagerID=E.EmployeeID JOIN Locations L ON L.LocationID=D.LocationID
SELECT * FROM DepartmentsView

--task-10. Write a query to display the job title and average salary of employees. 
CREATE VIEW AverageSalaryView
AS
SELECT JobId, AVG(Salary) AS 'AvgSal'
FROM Employees
GROUP BY JobId
GO
SELECT * FROM AverageSalaryView

--task-11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
CREATE VIEW EmployeeSalaryView
AS
SELECT E.JobId,CONCAT(E.FirstName,' ',E.LastName) AS Name ,Salary,MinSal = (SELECT MIN(Salary) FROM Employees WHERE JobId=E.JobId ) FROM Employees E
SELECT JobId,Name,Salary-MinSal FROM EmployeeSalaryView

--task-12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
CREATE VIEW JobHistoryView
AS
SELECT *
FROM JobHistory
WHERE EmployeeID
IN (SELECT EmployeeID FROM Employees WHERE Salary>10000)
GO

--task-13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 
CREATE VIEW ManagerView
AS
SELECT D.DepartmentName,CONCAT(E.FirstName,' ',E.LastName) AS Name FROM Departments D JOIN Employees E ON D.ManagerID=E.EmployeeID
WHERE DATEDIFF(YEAR, E.HireDate, GetDate()) >15
SELECT * FROM ManagerView