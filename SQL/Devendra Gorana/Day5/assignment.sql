CREATE TABLE Incentive (
	EmployeeID Decimal(6,0) CONSTRAINT emp_fk REFERENCES Employees(EmployeeID)
	,IncentiveDate DATE NOT NULL
	,IncentiveAmount MONEY NOT NULL
)

INSERT INTO Incentive
 VALUES (100, '1985-08-07', 6000)
	,(101, '2019-10-10', 5000)
	,(102, '2010-06-11', 7000)
	,(102, '1987-04-02', 1000)
	,(102, '1998-04-12', 8000)
	,(102, '2009-07-24', 3500)

SELECT * FROM Incentive

sp_rename 'Employees.HireDate', 'JoiningDate','COLUMN';


--
SELECT Employees.EmployeeID, 
DATEDIFF(MM,Employees.JoiningDate,Incentive.IncentiveDate) AS 'DIFF IN MONTHS'
FROM Employees INNER JOIN Incentive ON Employees.EmployeeID=Incentive.EmployeeID

--
SELECT Employees.EmployeeID, Employees.FirstName, Incentive.IncentiveAmount
FROM Employees INNER JOIN Incentive ON Employees.EmployeeID=Incentive.EmployeeID
WHERE Incentive.IncentiveAmount > 3000

--query3
SELECT Employees.EmployeeID, Employees.FirstName, Incentive.IncentiveAmount
FROM Employees LEFT JOIN Incentive ON Employees.EmployeeID = Incentive.EmployeeID

--query4
SELECT * FROM JobHistory

SELECT e.FirstName As Employee, m.FirstName FROM Employees as e 
LEFT OUTER JOIN Employees m ON e.ManagerID = m.EmployeeID

--query5
SELECT e.EmployeeID, e.FirstName, ISNULL (i.IncentiveAmount,0) FROM Employees AS e
LEFT OUTER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID