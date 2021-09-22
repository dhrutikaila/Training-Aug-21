--- create view to find employeeid.firstname from employees table whose salary  8000 to 1000

SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations
CREATE VIEW SAL
AS
(
SELECT EmployeeID,FirstName FROM Employees
WHERE Salary BETWEEN 8000 AND 10000)

---create view to find the employeeid whose cityid id 'us'

CREATE VIEW EMP
AS
(SELECT EmployeeID FROM Employees e JOIN Departments d
ON e.DepartmentID=d.DepartmentID
JOIN Locations l ON D.LocationID=L.LocationID
WHERE l.CountryID='US')
