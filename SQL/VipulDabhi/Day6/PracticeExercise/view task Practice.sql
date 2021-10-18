SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations
SELECT * FROM JobHistory

--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT L.LocationID,L.StreetAddress,L.City,L.StateProvince,L.CountryID 
FROM Locations L JOIN Departments D ON L.LocationID = D.LocationID

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
SELECT E.FirstName+' '+E.LastName AS Name ,E.DepartmentID FROM Employees E

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 
SELECT E.FirstName+' '+E.LastName AS Name,E.JobId,D.DepartmentID,D.DepartmentName 
FROM Employees E JOIN Departments D ON E.DepartmentID = D.DepartmentID JOIN Locations L 
ON D.LocationID = L.LocationID WHERE City = 'London'

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
CREATE VIEW EmployeeWithManager
AS
SELECT e.EmployeeID AS EmployeeID,e.LastName AS EmployeeName ,m.EmployeeID AS ManagerID,m.LastName AS ManagerName 
FROM Employees m JOIN Employees e ON m.EmployeeID=e.ManagerID

SELECT * FROM EmployeeWithManager

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW EmployeeDetail3
AS
SELECT FirstName+' '+LastName AS EmployeeName,HireDate FROM Employees

SELECT * FROM EmployeeDetail3 
WHERE HireDate > 
(SELECT HireDate FROM Employees WHERE LastName='Jones')

--6. Write a query to get the department name and number of employees in the department. 
CREATE VIEW NoOfEmpInDep
AS
SELECT D.DepartmentName,COUNT(E.EmployeeID) AS Employee FROM Employees E JOIN Departments D 
ON E.DepartmentID = D.DepartmentID GROUP BY D.DepartmentName

SELECT * FROM NoOfEmpInDep

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 
CREATE VIEW EmployeeWith90DepID
AS
SELECT EmployeeID,JobId,DATEDIFF(DD,StartDate,EndDate) AS Days FROM JobHistory WHERE DepartmentID = 90 

SELECT * FROM EmployeeWith90DepID

--8. Write a query to display the department ID, department name and manager first name. 
CREATE VIEW DepartmentDetail
AS 
SELECT D.DepartmentID,D.DepartmentName,E.Firstname AS ManagerName
From Departments D JOIN Employees E ON D.DepartmentID = E.ManagerID

select * from DepartmentDetail

--9. Write a query to display the department name, manager name, and city.
CREATE VIEW ManagerDetails
AS
SELECT DISTINCT D.DepartmentName,E1.Firstname+' '+E1.LastName AS ManagerName,L.City
FROM Employees E1 JOIN Employees E2 ON E1.EmployeeID = E2.ManagerID 
JOIN Departments D ON E1.DepartmentID = D.DepartmentID 
JOIN Locations L ON L.LocationID = D.LocationID

SELECT * FROM ManagerDetails

--10. Write a query to display the job title and average salary of employees.
CREATE VIEW AvgSalaryByJobId
AS
SELECT J.JobId AS JobTitle,AVG(Salary) AS AvgSalary FROM Employees E JOIN JobHistory J ON E.EmployeeID = J.EmployeeID GROUP BY J.JobId

SELECT * FROM AvgSalaryByJobId