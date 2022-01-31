--1. country query
SELECT * FROM Countries WHERE CountryName LIKE 'I%'

--2. country query
SELECT * FROM Countries WHERE RegionID BETWEEN 1 AND 3

--3.department query
SELECT DepartmentName, ManagerID FROM Departments WHERE DepartmentID IN (100,110,120)

--4. select manager name from employees
SELECT EmployeeID, CONCAT(FirstName,' ',LastName) AS 'ManagerName' FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Departments)

--5. select Top 5 salaries from employees
SELECT TOP 5 Salary, EmployeeID, CONCAT(FirstName,' ',LastName) AS 'Name' FROM Employees

--6. select Top 5 salaries from employees who are not manager
SELECT TOP 5 Salary, EmployeeID, CONCAT(FirstName,' ',LastName) AS 'Name' FROM Employees WHERE EmployeeID NOT IN (SELECT ManagerID FROM Departments)

--7. select last 5 records from employees.
SELECT TOP 5 EmployeeID,CONCAT(FirstName,' ',LastName) AS 'Name' FROM Employees ORDER BY EmployeeID DESC

--8. difference between max & min salary.
SELECT MAX(Salary)-MIN(Salary) AS 'Difference' FROM Employees

--9. select blank stateprovince
SELECT * FROM Locations WHERE StateProvince=''

--10. select locations minus 2000-2999 locationId
SELECT * FROM Locations WHERE LocationID NOT LIKE '2%'