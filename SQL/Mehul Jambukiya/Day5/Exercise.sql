
CREATE DATABASE JOINPRACTICE

USE JOINPRACTICE

CREATE TABLE Employee(
Employee_Id int CONSTRAINT PkEmpId PRIMARY KEY IDENTITY(1,1),
First_Name varchar(20) CONSTRAINT FNameNotNull NOT NULL,
Last_Name varchar(20) CONSTRAINT LNameNotNull NOT NULL,
Salary money CONSTRAINT SalaryNotNull NOT NULL,
Joining_Date DATETIME CONSTRAINT JoinDtNotNull NOT NULL,
Department varchar(30) CONSTRAINT DeptNotNull NOT NULL,
Manager_Id int CONSTRAINT FkMgrreftoEmp FOREIGN KEY REFERENCES Employee(Employee_Id) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Incentives(
Incentive_Id int CONSTRAINT PkIncentiveId PRIMARY KEY IDENTITY(1,1),
Employee_Ref_Id int CONSTRAINT FkEmpId FOREIGN KEY REFERENCES Employee(Employee_Id) ON DELETE SET NULL,
Incentive_Date DATE CONSTRAINT IncentiveDtNotNull NOT NULL,
Incentive_Amount money CONSTRAINT IncentiveAmountNotNull NOT NULL
)

INSERT INTO Employee VALUES ('John','Abraham',1000000,'2013-01-01 12:00','Banking',NULL)
INSERT INTO Employee VALUES ('Michale','Clarke',800000,'2013-01-01 12:00','Insurance',1),
							('Roy','Thomas',700000,'2013-02-01 12:00','Banking',1),
							('Tom','Jose',600000,'2013-02-01 12:00','Insurance',2),
							('Jerry','Pinto',650000,'2013-02-01 12:00','Insurance',3),
							('Philip','Methew',750000,'2013-01-01 12:00','Services',3),
							('Testname1','123',650000,'2013-01-01 12:00','Services',2),
							('Testname2','Lname%',600000,'2013-02-01 12:00','Insurance',2)

INSERT INTO Incentives VALUES (1,'02/01/2013',5000),(2,'02/01/2013',3000),(3,'02/01/2013',4000)

SELECT * FROM Employee
SELECT * FROM Incentives


--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT e.Joining_Date, i.Incentive_Date, DATEDIFF(DD,e.Joining_Date,i.Incentive_Date) AS [Differnce(in Days)] FROM Employee e JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id

--Select first_name, incentive amount from employee and incentives table for those employees who have
--incentives and incentive amount greater than 3000

SELECT e.First_Name, i.Incentive_Amount AS IncentiveAmount FROM Employee e JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id WHERE i.Incentive_Amount > 3000;

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT e.First_Name, i.Incentive_Amount AS IncentiveAmount FROM Employee e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id 

--Select EmployeeName, ManagerName from the employee table.

SELECT e.First_Name AS Employee, m.First_Name AS Manager FROM Employee e LEFT JOIN Employee m ON e.Manager_Id=m.Employee_Id

--Select first_name, incentive amount from employee and incentives table for all employees 
--even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.First_Name, ISNULL(i.Incentive_Amount,0) AS IncentiveAmount FROM Employee e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id

