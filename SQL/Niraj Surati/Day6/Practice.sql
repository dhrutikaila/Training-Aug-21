USE Assignment2

SELECT * FROM Employees

--  Subquery

SELECT * 
FROM Employees
WHERE Salary > 
	(
		SELECT Salary
		FROM Employees
		WHERE FirstName = 'David' AND LastName = 'Lee'
	)	

SELECT * FROM Locations


SELECT * 
FROM Locations
WHERE City = 'Roma'


USE AdventureWorks2019
 
 -- IN

SELECT *
FROM Person.Person

SELECT *
FROM  HumanResources.Employee
WHERE BusinessEntityID IN(
		SELECT BusinessEntityID
		FROM Person.Person
		WHERE MiddleName = 'N'
)
 
 -- EXISTS

SELECT *
FROM HumanResources.Employee
WHERE EXISTS(
	SELECT *
	FROM HumanResources.EmployeeDepartmentHistory 
	WHERE BusinessEntityID = HumanResources.Employee.BusinessEntityID 
	AND DepartmentID = 15
)


-- NESTED

SELECT * FROM HumanResources.Employee

SELECT * FROM Person.PersonPhone

SELECT * FROM Person.PhoneNumberType


SELECT COUNT(DepartmentID) AS 'Total'
FROM HumanResources.EmployeeDepartmentHistory
WHERE BusinessEntityID  IN (
	SELECT BusinessEntityID 
	FROM Person.PersonPhone
	WHERE PhoneNumberTypeID = (
		SELECT PhoneNumberTypeID
		FROM Person.PhoneNumberType
		WHERE Name = 'Work'
	)
)

-- copy

SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID IN
(
SELECT BusinessEntityID
FROM HumanResources.EmployeeDepartmentHistory
WHERE DepartmentID =
(
SELECT DepartmentID
FROM HumanResources.Department
WHERE Name = 'Engineering'
)
)


-- Coralted Query

USE Assignment2

SELECT * 
FROM Employees AS Emp
WHERE Salary = (
	SELECT MAX(Salary) 
	FROM Employees
	WHERE DepartmentID = Emp.DepartmentID
)


-- Creating View

USE AdventureWorks2019

SELECT *
FROM HumanResources.EmployeeDepartmentHistory

SELECT * 
FROM HumanResources.Department

SELECT *
FROM Person.Person

SELECT * 
FROM HumanResources.Employee

CREATE VIEW View_Emp
AS
SELECT P.FirstName
	,	P.LastName
	,	Dept.GroupName
FROM Person.Person AS P
JOIN HumanResources.EmployeeDepartmentHistory AS EDH
ON P.BusinessEntityID = EDH.BusinessEntityID
JOIN HumanResources.Department AS Dept
ON Dept.DepartmentID = EDH.DepartmentID
WHERE EDH.DepartmentID IN (1,14)

SELECT * FROM View_Emp


-- Variable

DECLARE @Demo VARCHAR(10)

SET @Demo = 'Niraj'

SELECT @Demo AS 'Variable'

PRINT @Demo 


-- Program

-- IF-Else

SELECT * FROM HumanResources.EmployeePayHistory

DECLARE @rate MONEY
DECLARE @b_id INT

SELECT @rate = Rate , @b_id =BusinessEntityID
FROM HumanResources.EmployeePayHistory
WHERE BusinessEntityID = 14

IF @rate < 15
	BEGIN
		PRINT 'Reviw is required'
		PRINT @b_id
		PRINT CONCAT('RATE:', @rate)
	END
ELSE
	BEGIN
		PRINT 'Reviw not required'
		PRINT @b_id
		PRINT CONCAT('RATE:', @rate)
	END


-- CASE 

SELECT BusinessEntityID, MaritalStatus = 
CASE MaritalStatus
WHEN 's' THEN 'Single'
WHEN 'm' THEN  'Married'
ELSE 'Unknown'
END
FROM HumanResources.Employee

-- WHILE

DECLARE @e_id INT
DECLARE @rate MONEY
DECLARE @flag INT

SELECT TOP 1 @flag = BusinessEntityID
FROM HumanResources.EmployeePayHistory
ORDER BY BusinessEntityID 

SELECT TOP 1 @e_id = BusinessEntityID
FROM HumanResources.EmployeePayHistory
ORDER BY BusinessEntityID DESC


WHILE(@flag <= @e_id)
BEGIN

SELECT @rate = Rate 
FROM HumanResources.EmployeePayHistory
WHERE BusinessEntityID = @flag

IF @rate < 15
	BEGIN
		PRINT 'Reviw is required'
		PRINT CONCAT('ID:',@flag,SPACE(5),'RATE:', @rate)
	END
ELSE
	BEGIN
		PRINT 'Reviw not required'
		PRINT CONCAT('ID:',@flag,SPACE(5),'RATE:', @rate)
	END

SET @flag += 1
END
