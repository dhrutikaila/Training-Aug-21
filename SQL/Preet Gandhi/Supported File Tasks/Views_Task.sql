USE Day6_SQL_View


--1)Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
CREATE VIEW View1_Address
AS
SELECT  CONCAT(LocationID , ' ', StreetAddress, ' ', City, ' ', StateProvince, ' ', CountryID)  AS 'Address'
FROM  dbo.Locations
SELECT * FROM View1_Address

--2)Write a query to find the names (first_name, last name), department ID and name of all the employees.
CREATE VIEW View2_EmpName
AS
SELECT CONCAT(E.FirstName,' ',E.LastName) AS 'Name', D.DepartmentID, D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID=D.DepartmentID
SELECT * FROM View2_EmpName


--3)Create a View to Find the names (first_name, last_name), job, department number, 
--  and department name of the employees who work in London
CREATE VIEW View3_EmpDetails
AS
SELECT e.FirstName,e.LastName,e.JobId,e.DepartmentID,d.DepartmentName 
FROM Employees AS e INNER JOIN Departments AS d
ON e.DepartmentID=d.DepartmentID INNER JOIN Locations AS l
ON d.LocationID=l.LocationID WHERE l.City='London'
SELECT * FROM View3_EmpDetails

--4)Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
CREATE VIEW View4_EmpWithMgr
AS
SELECT M.EmployeeID, M.LastName AS 'Employee', M.ManagerID, E.LastName AS 'Manager'
FROM Employees E 
INNER JOIN Employees M ON E.EmployeeID=M.ManagerID
SELECT * FROM View4_EmpWithMgr

--5)Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
CREATE VIEW View5_EmpHire
AS
SELECT CONCAT(FirstName,' ',LastName) AS 'Name', HireDate
FROM Employees
WHERE HireDate > (SELECT HireDate FROM Employees WHERE LastName='Jones')
SELECT * FROM View5_EmpHire

--6)Write a query to get the department name and number of employees in the department.
CREATE VIEW View6_DeptEmp
AS
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS Count
FROM   Departments AS d FULL OUTER JOIN 
Employees AS e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
SELECT * FROM View6_DeptEmp

--7)Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
CREATE VIEW View7_Emp90
AS
SELECT EmployeeID,JobID,DATEDIFF(dd,StartDate,EndDate) AS 'DateDifference' FROM JobHistory WHERE DepartmentID=90
SELECT * FROM View7_Emp90

--8)Write a query to display the department ID, department name and manager first name. 
CREATE VIEW View8_DepDetails
AS
SELECT D.DepartmentID, D.DepartmentName ,CONCAT(E.FirstName,' ',E.LastName) AS 'Manager'
FROM Departments D 
INNER JOIN Employees E ON D.ManagerID=E.EmployeeID
SELECT * FROM View8_DepDetails

--9)Write a query to display the department name, manager name, and city. 
CREATE VIEW View9_DepDetail
AS
SELECT e.FirstName,e.LastName,d.DepartmentName,l.City
FROM Departments AS d INNER JOIN Employees AS e
ON e.EmployeeID=d.ManagerID
INNER JOIN Locations AS l
ON d.LocationID=l.LocationID
SELECT * FROM View9_DepDetail

--10)Write a query to display the job title and average salary of employees. 
CREATE VIEW View10_AvgSal
AS
SELECT JobId, AVG(Salary) AS 'AvgSalary'
FROM EmployeesGROUP BY JobId
SELECT * FROM View10_AvgSal

--11)Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
CREATE VIEW View11_SalaryDiff
AS 
SELECT E.JobId, CONCAT(E.FirstName,' ',E.LastName) AS 'Name',E.Salary, MinSalary = 
(SELECT MIN(Salary) FROM Employees WHERE JobId=E.JobID) FROM Employees E
SELECT JobId, Name, Salary-MinSalary AS 'Difference' FROM View11_SalaryDiff

--12)Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
CREATE VIEW View12_EmpHistory
AS
SELECT * FROM JobHistoryWHERE EmployeeID 
IN (SELECT EmployeeID FROM Employees WHERE Salary>10000)
SELECT * FROM View12_EmpHistory

--13)Create a View to display department name, name (first_name, last_name), hire date, 
--  salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW View13_Dep
AS
SELECT d.DepartmentName,e.FirstName,e.LastName,e.HireDate,e.Salary
FROM Departments As d INNER JOIN Employees As e
ON d.ManagerID=e.EmployeeID 
WHERE DATEDIFF(yy,e.HireDate,GETDATE())>15
SELECT * FROM View13_Dep


SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Countries
SELECT * FROM Locations
SELECT * FROM JobHistory