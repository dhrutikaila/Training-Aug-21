--DML
--SELECT
SELECT * FROM Employees
SELECT * FROM CarsDetails
SELECT * FROM Incentives

--INSERT
INSERT INTO Incentives VALUES(4,2013-02-01 ,6000)

--UPDATE
UPDATE Employees SET Salary = Null WHERE EmployeeID = 2
UPDATE Employees SET DepartmentID = 90 WHERE EmployeeID = 110

--DELETE
DELETE FROM Employees WHERE Salary < 1000

--DQL
--Basic Select Statement
SELECT FirstName+' '+lastname AS Name FROM Employees

--Literals & Concatenate
SELECT FirstName+' '+lastname AS Name FROM Employees
SELECT FirstName+' Hello How Are You' FROM Employees

--Where clause
SELECT * FROM Employees WHERE EmployeeID = 101
SELECT * FROM Employees WHERE EmployeeID = DepartmentID

--Comparison & Logical Operator
SELECT * FROM Employees WHERE Salary > 30000
SELECT * FROM Employees WHERE DepartmentID = 90 OR DepartmentID = 60

--Range Operator
SELECT * FROM Employees WHERE Salary BETWEEN 20000 AND 50000

--In/not in keyword
SELECT * FROM Employees WHERE EmployeeID IN (100,102,110,120)
SELECT * FROM Employees WHERE DepartmentID NOT  IN (100,90,50)

--Like, OrderBy, Top, Distinct
SELECT firstName FROM Employees WHERE FirstName LIKE '%a'
SELECT * FROM Employees ORDER BY Salary
SELECT TOP 10 * FROM Employees WHERE CommissionPct = 0.10
SELECT DISTINCT DepartmentID FROM Employees








