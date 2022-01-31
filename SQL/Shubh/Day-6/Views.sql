--Views:
--1. Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW EmpInc
AS
SELECT E.FirstName, E.LastName, E.Salary, E.JoiningDate, ISNULL(I.IncentiveDate,'1947-08-15') AS IncentiveDate, ISNULL(I.IncentiveAmount,0) AS IncentiveAmount
FROM dbo.EmployeeInc AS E 
FULL OUTER JOIN dbo.Incentives AS I ON E.EmployeeId = I.EmployeeRefId
GO
SELECT * FROM EmpInc


--2.Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW EmpInc2
AS
SELECT E.FirstName,I.IncentiveAmount
FROM EmployeeInc E 
JOIN Incentives I ON E.EmployeeId = I.EmployeeRefId
WHERE I.IncentiveAmount > 3000
GO
SELECT * FROM EmpInc2


--3.Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW EmpDepLoc
AS
SELECT CONCAT(E.FirstName,' ',E.LastName) AS 'Names', E.JobId, D.DepartmentID, D.DepartmentName, L.City
FROM Departments D 
JOIN Employees E ON D.DepartmentID=E.DepartmentID
JOIN Locations L ON D.LocationID=L.LocationID
WHERE L.City='London'
GO
SELECT * FROM EmpDepLoc


--4.Create a View to get the department name and number of employees in the department.
CREATE VIEW EmpDep
AS
SELECT D.DepartmentName, COUNT(EmployeeID) AS 'TotalEmployees'
FROM Departments D
JOIN Employees E ON D.DepartmentID=E.DepartmentID
GROUP BY D.DepartmentName
GO
SELECT * FROM EmpDep


--5.Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
CREATE VIEW JobHis
AS
SELECT EmployeeID, JobID AS 'JobTitle', DATEDIFF(DAY,EndDate,StartDate) AS 'Experience'
FROM JobHistory
WHERE DepartmentID=90
GO
SELECT * FROM JobHis


--6.Write a View to display the department name, manager name, and city.
CREATE VIEW MgrDep
AS
SELECT D.DepartmentName ,CONCAT(E.FirstName,' ',E.LastName) AS 'Manager', L.City
FROM Departments D 
JOIN Employees E ON D.ManagerID=E.EmployeeID
JOIN Locations L ON D.LocationID=L.LocationID
GO
SELECT * FROM MgrDep


--7.Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW MgrExp
AS
SELECT D.DepartmentName ,CONCAT(E.FirstName,' ',E.LastName) AS 'Manager', E.HireDate, E.Salary
FROM Employees E
JOIN Departments D  ON E.EmployeeID=D.ManagerID
WHERE DATEDIFF(YEAR,2021,E.HireDate)>15
GO
SELECT * FROM MgrExp


--8.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
CREATE VIEW Dept
AS
SELECT D.DepartmentName, D.LocationID, L.StreetAddress, L.City, L.StateProvince, C.CountryName
FROM Locations L
JOIN Departments D ON L.LocationID=D.LocationID
JOIN Countries C ON L.CountryID=C.CountryID
GO
SELECT * FROM Dept


--9.Write a query to find the names (first_name, last name), department ID and name of all the employees. 
CREATE VIEW EmpName
AS
SELECT CONCAT(E.FirstName,' ',E.LastName) AS 'Name', D.DepartmentID, D.DepartmentName
FROM Employees E 
JOIN Departments D ON E.DepartmentID=D.DepartmentID
GO
SELECT * FROM EmpName


--10.Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
CREATE VIEW EmpMgr
AS
SELECT M.EmployeeID, M.LastName AS 'Employee', M.ManagerID, E.LastName AS 'Manager'
FROM Employees E 
JOIN Employees M ON E.EmployeeID=M.ManagerID
GO
SELECT * FROM EmpMgr


--11.Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW EmpJones
AS
SELECT CONCAT(FirstName,' ',LastName) AS 'Name', HireDate
FROM Employees
WHERE HireDate > (SELECT HireDate FROM Employees WHERE LastName='Jones')
GO
SELECT * FROM EmpJones


--12.Write a query to display the department ID, department name and manager first name. 
CREATE VIEW DepMgr
AS
SELECT D.DepartmentID, D.DepartmentName ,CONCAT(E.FirstName,' ',E.LastName) AS 'Manager'
FROM Departments D 
JOIN Employees E ON D.ManagerID=E.EmployeeID
GO
SELECT * FROM DepMgr


--13.Write a query to display the job title and average salary of employees. 
CREATE VIEW EmpSal
AS
SELECT JobId, AVG(Salary) AS 'AvgSal'
FROM Employees
GROUP BY JobId
GO
SELECT * FROM EmpSal


--14.Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
CREATE VIEW MINSAL
AS 
SELECT E.JobId, CONCAT(E.FirstName,' ',E.LastName) AS 'EmpName',E.Salary, MinSal = (SELECT MIN(Salary) FROM Employees WHERE JobId=E.JobID) 
FROM Employees E
GO
SELECT JobId, EmpName, Salary-MinSal AS 'Difference' FROM MINSAL 


--15.Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
CREATE VIEW JHS
AS
SELECT * 
FROM JobHistory
WHERE EmployeeID 
IN (SELECT EmployeeID FROM Employees WHERE Salary>10000)
GO
SELECT * FROM JHS