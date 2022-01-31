--CREATE INCENTIVES TABLE

CREATE TABLE Incentives(
EmployeeId DECIMAL(6,0) CONSTRAINT FK_EMP_ID FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeID),
IncentiveDate DATE NOT NULL,
IncentiveAmount MONEY NOT NULL
)

--INSERT DATA IN INCENTIVES TABLE:
INSERT INTO Incentives  
  VALUES(177,'1987-7-7',2000),
		(177,'1987-7-8',10000),
		(177,'1987-7-10',4000),
		(177,'1987-7-11',5000),
		(179,'1987-7-23',7000),
		(179,'1987-7-24',9000)

USE SampleDB
-- Joins
-- Inner join
SELECT E.FirstName,D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D ON E.DepartmentID = D.DepartmentID

USE EMPDB
SELECT *
FROM Emp AS E
INNER JOIN Department AS D ON E.DepartmentId = D.DepartmentId

-- Outer join
	-- Left Outer Join OR LEFT JOIN 
	SELECT E.FirstName,D.DepartmentName
	FROM Employees AS E
	LEFT JOIN Departments AS D ON E.DepartmentID=D.DepartmentID

	USE EMPDB
	SELECT * 
	FROM Emp AS E
	LEFT JOIN Department AS D ON E.DepartmentId = d.DepartmentId

	SELECT * 
	FROM Department AS D
	LEFT JOIN Emp AS E ON E.DepartmentId = d.DepartmentId

	-- Right Outer join
	SELECT D.DepartmentName, E.FirstName
	FROM Departments AS D 
	RIGHT JOIN Employees AS E ON D.DepartmentID = E.DepartmentID

	SELECT E.FirstName,D.DepartmentName
	FROM Employees AS E
	RIGHT JOIN Departments AS D ON E.DepartmentID=D.DepartmentID

	USE EMPDB
	SELECT *
	FROM Emp AS E
	RIGHT JOIN Department AS D ON E.DepartmentId = D.DepartmentId 

	-- Full Outer Join
	SELECT E.FirstName,D.DepartmentName
	FROM Employees AS E
	FULL JOIN Departments AS D ON E.DepartmentID = D.DepartmentID

	USE EMPDB
	SELECT *
	FROM Emp AS E
	FULL JOIN Department AS D ON E.DepartmentId = D.DepartmentId 

-- Self-Join
SELECT E.FirstName,M.FirstName AS 'Emp_Manager'
FROM Employees AS E 
LEFT JOIN Employees AS M ON E.ManagerID = M.EmployeeID

