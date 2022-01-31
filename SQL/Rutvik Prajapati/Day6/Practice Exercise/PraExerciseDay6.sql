--Subqueries
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees 
WHERE Salary > (SELECT AVG(salary) FROM Employees)

SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees 
WHERE Salary = (SELECT AVG(Salary) FROM Employees)

SELECT E.FirstName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.LocationID = (SELECT LocationID FROM Locations WHERE City='London')

--VIEW
CREATE VIEW VIEWNAME AS
SELECT COUNT(E.FirstName) AS CountEmp,D.DepartmentName
FROM Employees AS E 
INNER JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentID,D.DepartmentName

select * from VIEWNAME
