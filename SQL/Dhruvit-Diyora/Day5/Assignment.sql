CREATE TABLE Employee
(
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Salary DECIMAL(8,0) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    Department VARCHAR(30),
    ManagerID INT
)


INSERT INTO Employee VALUES ('John', 'Abraham', 1000000, '2013-01-01', 'Banking', NULL), 
                           ('Michael', 'Clarke', 800000, '2013-01-01', 'Insurance', 1), 
                           ('Roy', 'Thomas', 700000, '2013-02-01', 'Banking', 1), 
                           ('Tom', 'Jose', 600000, '2013-02-01', 'Insurance', 2), 
                           ('Jerry', 'Pinto', 650000, '2013-02-01', 'Insurance', 3), 
                           ('Philip', 'Mathew', 750000, '2013-01-01', 'Services', 3), 
                           ('TestName1', '123', 650000, '2013-01-01', 'Services', 2), 
                           ('TestName2', 'Lname%', 600000, '2013-02-01', 'Insurance', 2)


SELECT * FROM Employee

CREATE TABLE Incentives
(
    EmployeeRefID INT PRIMARY KEY, IncentiveDate DATETIME NOT NULL, IncentiveAmount DECIMAL(5,0) NOT NULL DEFAULT 0,CONSTRAINT FK_Employee_Ref_ID FOREIGN KEY (EmployeeRefID) REFERENCES Employee(EmployeeID)
)


INSERT INTO Incentives VALUES (1, '2013-02-01', 5000), (2, '2013-02-01', 3000), (3, '2013-02-01', 4000)


SELECT * FROM Incentives


--assignment
--task1-Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT FirstName,DATEDIFF(DAY,JoiningDate,IncentiveDate) AS 'Difference' FROM Employee E inner join Incentives Em on E.EmployeeID = Em.EmployeeRefID


--task2-Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT FirstName,IncentiveAmount 
FROM Employee E INNER JOIN Incentives I 
  ON E.EmployeeID=I.EmployeeRefID 
AND IncentiveAmount >3000;


--task3-Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT FirstName, IncentiveAmount
FROM Employee E LEFT JOIN Incentives I 
     ON E.EmployeeID=I.EmployeeRefID;


--task4-Select EmployeeName, ManagerName from the employee table.
SELECT E.FirstName AS EmployeeName, E2.FirstName 
FROM Employee E LEFT JOIN Employee E2 
	ON E.ManagerID = E2.EmployeeID

--task5-Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT FirstName, ISNULL(IncentiveAmount,0) FROM Employee E left join Incentives I ON E.EmployeeID = I.EmployeeRefID