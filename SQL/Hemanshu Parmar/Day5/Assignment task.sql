CREATE TABLE Employee (
	EmployeeId INT NOT NULL PRIMARY KEY, 
	FirstName VARCHAR (30) NOT NULL, 
	LastName VARCHAR (30) NOT NULL, 
	Salary MONEY, 
	JoiningDate DATETIME NOT NULL, 
	Department CHAR(25) NOT NULL, 
	ManagerId INT)


INSERT INTO Employee VALUES
(1,'John','Abraham',1000000,'2013/01/01 12:00:00 AM','Banking',null),
(2,'Ricky','Ponting',800000,'2013/01/01 12:00:00 AM','Insurance',1),
(3,'McCalister','Thomas',700000,'2013/02/01 12:00:00 AM','Banking',1),
(4,'Tom','Jerry',600000,'2013/02/01 12:00:00 AM','Insurance',2),
(5,'Freda','Pinto',6500000,'2013/02/01 12:00:00 AM','Insurance',3),
(6,'Philip','Mathew',750000,'2013/01/01 12:00:00 AM','Services',3),
(7,'TestName1','420',650000,'2013/01/01 12:00:00 AM','Service',2),
(8,'TestName2','Check',600000,'2013/2/1 12:00:00 AM','Insurance',2)



CREATE TABLE Incentives (
	EmployeeRefId INT NOT NULL 
	CONSTRAINT fk_empid FOREIGN KEY REFERENCES Employee(EmployeeId) 
	CONSTRAINT pk_Incentives PRIMARY KEY, 
	IncentiveDate DATE,
	IncentiveAmount MONEY
	)

INSERT INTO Incentives VALUES
	(1,'2013-02-1',5000),
	(2,'2013-2-1',3000),
	(3,'2013-02-01',4000)

-------------------------------------Answers----------------------------

Query-1
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT e.FirstName, e.JoiningDate , i.IncentiveDate, 
	DATEDIFF(dd,JoiningDate,GETDATE()) - DATEDIFF(dd,IncentiveDate,GETDATE()) AS 'Difference' 
		FROM Employee e LEFT JOIN Incentives i ON e.EmployeeId=i.EmployeeRefId

Query-2
--Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT e.FirstName,i.IncentiveAmount 
	FROM Employee e JOIN Incentives i ON e.EmployeeId=i.EmployeeRefId 
		WHERE i.IncentiveAmount>3000

Query-3
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT e.FirstName,i.IncentiveAmount 
	FROM Employee e LEFT JOIN Incentives i ON e.EmployeeId=i.EmployeeRefId

Query-4
--Select EmployeeName, ManagerName from the employee table.
SELECT e.FirstName AS 'EmployeeName', f.FirstName AS 'ManagerName' 
	FROM employee e LEFT JOIN employee f ON e.ManagerId=f.EmployeeId


Query-5
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
SELECT e.FirstName,	
	CASE WHEN IncentiveAmount IS NULL THEN 0 
		ELSE IncentiveAmount 
		END 
		AS 'IncentiveAmount'
			FROM Employee e LEFT JOIN Incentives i ON e.EmployeeId=i.EmployeeRefId 

