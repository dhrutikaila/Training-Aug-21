
USE Subqueries
select * from [dbo].[Employees]

select * from [dbo].[Departments]

select * from [dbo].[Locations]

select * from [dbo].[JobHistory]

select * from [dbo].[Countries]

--- 1. Create a View to Find the names (first_name, last_name), job, department number, and department name 
--of the employees who work in London

CREATE VIEW NameDepartment
AS
SELECT E.FirstName+' '+E.LastName AS Name,E.JobId, E.DepartmentID,D.DepartmentName
	FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID
	JOIN Locations L ON L.LocationID=D.LocationID
	WHERE L.City='London'
	WITH CHECK OPTION ; 

SELECT * FROM NameDepartment


----- 2. Create a View to get the department name and number of employees in the department.

CREATE VIEW EmployeesInDepartment
AS
SELECT D.DepartmentName,COUNT(E.EmployeeID) AS NoOfEmployee
	FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID
	GROUP BY D.DepartmentName

SELECT * FROM EmployeesInDepartment


--- 3. Find the employee ID, job title, number of days between ending date and starting date for 
----all jobs in department 90 from job history.

CREATE VIEW EmployeeJobHistory
AS
SELECT E.EmployeeID,E.JobId,DATEDIFF(DAY,J.StartDate,J.EndDate) AS NoOFDays
	FROM Employees E JOIN JobHistory J ON E.EmployeeID=J.EmployeeID
	WHERE J.DepartmentID=90

SELECT * FROM EmployeeJobHistory


--- 4. Write a View to display the department name, manager name, and city.

CREATE VIEW DepartmentManagerNameCity
AS
SELECT D.DepartmentName,E.FirstName+' '+E.LastName AS ManagerName, L.City 
	FROM Employees E JOIN Departments D ON E.EmployeeID=D.ManagerID
	JOIN Locations L ON L.LocationID=D.LocationID

SELECT * FROM DepartmentManagerNameCity


---- 5. Create a View to display department name, name (first_name, last_name), hire date, salary 
--- of the manager for all managers whose experience is more than 15 years.


CREATE VIEW ManagerInfo
AS
SELECT distinct E.FirstName+' '+E.LastName AS ManagerName, E.HireDate,D.DepartmentName,E.Salary 
	FROM Employees M JOIN Employees E ON M.ManagerID=E.EmployeeID
	JOIN Departments D ON D.DepartmentID=E.DepartmentID
	WHERE DATEDIFF(YEAR,E.HireDate,GETDATE())>15

SELECT * FROM ManagerInfo


----------------

----1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

CREATE VIEW AddressOFDepartment
AS
SELECT D.DepartmentName, CAST(D.LocationID AS varchar)+', '+L.StreetAddress+', '+L.City+', '+L.StateProvince+', '+C.CountryName AS Address
	FROM Departments D JOIN Locations L ON D.LocationID=L.LocationID
	JOIN Countries C ON C.CountryID=L.CountryID

SELECT * FROM AddressOFDepartment

----- 2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 

CREATE VIEW EmployeesDepartments
AS
SELECT E.FirstName+' '+E.LastName AS Name, E.DepartmentID, D.DepartmentName
	FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID

SELECT * FROM EmployeesDepartments

----- 3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

----- 4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

CREATE VIEW EmployeesManager
AS
SELECT	TOP (106)E.EmployeeID,E.LastName Employee_LastName,E.ManagerID,M.LastName Manager_LastName
	FROM Employees E JOIN Employees M ON E.ManagerID=M.EmployeeID
	ORDER BY E.EmployeeID

SELECT * FROM EmployeesManager

------5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

CREATE VIEW HiredAfterJones
AS
SELECT FirstName+' '+LastName AS Name,HireDate
	FROM Employees
	WHERE HireDate>(SELECT HireDate FROM Employees WHERE FirstName='Jones' OR LastName='Jones')

SELECT * FROM HiredAfterJones

--- 6. Write a query to get the department name and number of employees in the department. 

--- 7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

---- 8. Write a query to display the department ID, department name and manager first name. 

CREATE VIEW DeparmentsManager
AS
SELECT D.DepartmentID, D.DepartmentName, E.FirstName
	FROM Employees E JOIN Departments D ON E.EmployeeID=D.ManagerID

SELECT * FROM DeparmentsManager

----- 9. Write a query to display the department name, manager name, and city. 


----- 10. Write a query to display the job title and average salary of employees. 

CREATE VIEW AverageSal
AS
SELECT JobId, AVG(Salary) Average_Sal
	FROM Employees 
	GROUP BY JobId

SELECT * FROM AverageSal

----- 11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

CREATE VIEW Salary
AS
SELECT JobID,FirstName, SALARY = Salary-(SELECT MIN(Salary) FROM Employees E1  WHERE E1.JobId=E2.JobId GROUP BY JobId)
FROM Employees E2

SELECT * FROM Salary


---12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

CREATE VIEW JobHistoryView
AS
SELECT j.*
FROM Employees e JOIN JobHistory j ON e.EmployeeID=j.EmployeeID
WHERE e.Salary>10000

SELECT * FROM JobHistoryView


