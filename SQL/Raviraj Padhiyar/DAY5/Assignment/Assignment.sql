USE SampleTable

SELECT * FROM Employees
	LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID

CREATE TABLE Incentive (
	EmployeeID Decimal(6,0) CONSTRAINT emp_fk REFERENCES Employees(EmployeeID)
	,IncentiveDate DATE NOT NULL
	,IncentiveAmount MONEY NOT NULL
)

INSERT INTO Incentive
 VALUES (100, '1987-08-17', 5000)
	,(101, '1987-08-18', 3000)
	,(102, '1987-08-19', 4000)
	,(102, '1987-08-20', 2000)
	,(102, '1987-08-21', 6000)
	,(102, '1987-08-22', 3000)

sp_rename 'Employees.HireDate', 'JoiningDate','COLUMN';

SELECT EmployeeID
	,FirstName
	,LastName
	,Salary
	,JoiningDate
	,DepartmentID
	,ManagerID
FROM Employees

--Query1
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT e.EmployeeID
	,DATEDIFF(MM,e.JoiningDate,i.IncentiveDate) AS 'DIFF IN MONTHS'
FROM Employees AS e
	INNER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID

--query2
--Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT e.EmployeeID
	,e.FirstName
	,i.IncentiveAmount
FROM Employees AS e
	INNER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
WHERE i.IncentiveAmount > 3000

--query3
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT e.EmployeeID
	,e.FirstName
	,i.IncentiveAmount
FROM Employees AS e
	LEFT OUTER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID

--query4
--Select EmployeeName, ManagerName from the employee table.

SELECT
	e.FirstName As Employee
	,m.FirstName
FROM Employees as e 
	LEFT OUTER JOIN Employees m
		ON e.ManagerID = m.EmployeeID

--query5
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
SELECT e.EmployeeID
	,e.FirstName
	,ISNULL(i.IncentiveAmount,0)
FROM Employees AS e
	LEFT OUTER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID