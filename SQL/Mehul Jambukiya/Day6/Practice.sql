--USE SqlDay6



--Subqueries
SELECT * FROM Departments
SELECT * FROM Employees WHERE DepartmentID IN ( SELECT DepartmentID  FROM Departments WHERE DepartmentName = 'IT')

SELECT * FROM Locations
SELECT * FROM Departments WHERE LocationID IN ( SELECT LocationID FROM Locations WHERE CountryID NOT IN ('US','UK'))

SELECT * FROM Employees WHERE EXISTS (SELECT ManagerID FROM Employees WHERE EmployeeID=1100)


SELECT * FROM Employees WHERE DepartmentID IN (
SELECT DepartmentID FROM Departments WHERE LocationID IN(
SELECT LocationID FROM Locations WHERE CountryID NOT IN ('US','UK')))

SELECT E1.EmployeeID,E1.Salary FROM Employees E1 WHERE E1.Salary >(
SELECT E2.Salary FROM Employees E2 WHERE E2.EmployeeID=E1.ManagerID)

--Views

CREATE VIEW DemoView
AS
SELECT EmployeeID,FirstName+' '+LastName AS EmployeeName, Salary FROM Employees

SELECT * FROM DemoView ORDER BY Salary DESC

ALTER VIEW DemoView 
AS
SELECT EmployeeID,FirstName+' '+LastName AS EmployeeName FROM Employees
SELECT * FROM DemoView

CREATE VIEW ViewWithEncryption
WITH ENCRYPTION
AS
SELECT EmployeeID,FirstName+' '+LastName AS EmployeeName, Salary FROM Employees

SELECT * FROM ViewWithEncryption ORDER BY Salary DESC


ALTER VIEW ViewWithEncryption 
AS
SELECT EmployeeID,FirstName+' '+LastName AS EmployeeName FROM Employees
SELECT * FROM ViewWithEncryption


CREATE VIEW DemoView2
AS
SELECT EmployeeID,FirstName+' '+LastName AS EmployeeName, Salary FROM Employees 
WHERE EmployeeID IN (101,102,103)

WITH CHECK OPTION

SELECT * FROM DemoView2 ORDER BY Salary DESC


