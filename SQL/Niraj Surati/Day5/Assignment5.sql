USE AdventureWorks2019

SELECT * FROM Person.Person

SELECT * FROM HumanResources.Employee

SELECT * FROM HumanResources.EmployeePayHistory

SELECT * FROM HumanResources.EmployeeDepartmentHistory


-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
	, Emp.JobTitle
	, FORMAT(Emp.BirthDate,'dd-MM-yyyy') AS 'Date of Birth'
	, FORMAT(P.ModifiedDate,'dd-MM-yyyy') AS 'Hire Date'
	--, DATEDIFF(CAST(Emp.BirthDate) AS DATE,CAST(P.ModifiedDate AS DATE)
	, DATEDIFF(YYYY,Emp.BirthDate,P.ModifiedDate) AS 'Age Difference'
FROM HumanResources.Employee AS Emp
JOIN Person.Person AS P
ON Emp.BusinessEntityID = P.BusinessEntityID


-- Changing database

USE Assignment2

-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT * FROM SYS.tables

SELECT * FROM Employees

SELECT * FROM Countries

SELECT * FROM Locations


SELECT Emp.FirstName
	, Emp.Salary
	, Dept.DepartmentName
	, Loc.City
FROM Employees AS Emp
JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
JOIN Locations AS Loc
ON Loc.LocationID = Dept.LocationID
WHERE Emp.Salary > 3000

 
-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT Emp.FirstName
	, Emp.Salary
	, Dept.DepartmentName
	, Loc.City
FROM Employees AS Emp
LEFT JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
LEFT JOIN Locations AS Loc
ON Loc.LocationID = Dept.LocationID



-- 4. Select EmployeeName, ManagerName from the employee table.

SELECT CONCAT(E2.FirstName,SPACE(1),E2.LastName) AS 'Employee Name'
	,  CONCAT(E1.FirstName,SPACE(1),E1.LastName) AS 'Manager Name'
FROM Employees AS E1
JOIN  Employees AS E2
ON E2.ManagerID = E1.EmployeeID






