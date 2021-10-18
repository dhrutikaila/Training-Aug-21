--SQL Supported Files inside task ---
--only for VIEW task--
USE SampleDB
-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
CREATE VIEW DepartmentAddresses
AS
SELECT L.LocationID,L.StreetAddress,L.City,L.StateProvince,C.CountryName
FROM Departments D
INNER JOIN Locations L ON D.LocationID=L.LocationID
INNER JOIN Countries C ON L.CountryID = C.CountryID

-- 2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
CREATE VIEW EmpWithDepartment
AS
SELECT E.FirstName+' '+LastName AS Names,D.DepartmentID,D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID

-- 3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 
CREATE VIEW V7
AS
SELECT E.FirstName+' '+E.LastName AS Names,E.JobId,D.DepartmentID,D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
INNER JOIN Locations L ON D.LocationID = L.LocationID
WHERE L.City='London'

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
CREATE VIEW V8
AS
SELECT E.EmployeeID,E.LastName AS Name,M.EmployeeID AS ManagerId,M.LastName as ManagerName
FROM Employees E 
INNER JOIN Employees M ON E.ManagerID = M.EmployeeID

-- 5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW V9
AS
SELECT FirstName+' '+LastName AS Names,HireDate
FROM Employees
WHERE HireDate > (SELECT HireDate FROM Employees WHERE FirstName='Jones' OR LastName='Jones')
-- 6. Write a query to get the department name and number of employees in the department. 
CREATE VIEW V10
AS
SELECT D.DepartmentName,COUNT(E.EmployeeID) AS NoOfEmp
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentName

-- 7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 
CREATE VIEW V11
AS
SELECT E.EmployeeID,E.JobId,DATEDIFF(YY,JH.StartDate,JH.EndDate) DIFFDAYS
FROM Employees E
INNER JOIN JobHistory JH ON JH.EmployeeID=E.EmployeeID
WHERE JH.DepartmentID = 90
-- 8. Write a query to display the department ID, department name and manager first name. 
CREATE VIEW V12
AS
SELECT D.DepartmentID,D.DepartmentName,E.FirstName AS ManagerName
FROM Employees E
INNER JOIN Departments D ON E.ManagerID = D.ManagerID
-- 9. Write a query to display the department name, manager name, and city. 
CREATE VIEW V13
AS
SELECT D.DepartmentName,E.FirstName AS ManagerName,L.City
FROM Employees  E 
INNER JOIN Departments D ON E.ManagerID = D.ManagerID
INNER JOIN Locations L ON D.LocationID = L.LocationID
-- 10. Write a query to display the job title and average salary of employees. 
CREATE VIEW V14
AS
SELECT JobId,AVG(Salary) AS JobIDAvgSalaryEmp
FROM Employees 
GROUP BY JobId
-- 11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
CREATE VIEW V15
AS
SELECT JobId,FirstName,Salary-(SELECT MIN(Salary) FROM Employees GROUP BY JobId HAVING JobId=E.JobId) AS SALARY_DIFFERENCE
FROM Employees E
GROUP BY JobId,FirstName,Salary

-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
CREATE VIEW V16
AS
SELECT JH.EmployeeID,JH.StartDate,JH.EndDate,JH.JobID,JH.DepartmentID
FROM Employees E
INNER JOIN JobHistory JH ON E.EmployeeID = JH.EmployeeID
WHERE E.Salary>10000
-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 
CREATE VIEW V17
AS
SELECT D.DepartmentName,E.FirstName+' '+E.LastName AS Name,E.HireDate,E.Salary
FROM Employees E 
INNER JOIN Departments D ON E.ManagerID = D.ManagerID
WHERE DATEDIFF(YY,E.HireDate,GETDATE())> 15


--Assignment: FROM DAY9 
--BATCH
--Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table
USE NewEmpDB
SELECT 
CASE DEPARTMENT 
	WHEN 'Banking' THEN 'Bank Dept' 
	WHEN 'Insurance' THEN 'Insurance Dept' 
	WHEN 'Services' THEN 'Services Dept' 
END 
FROM EMPLOYEE