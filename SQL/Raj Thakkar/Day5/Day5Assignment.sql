CREATE TABLE Employee1
(
Employee_id INT PRIMARY KEY,
First_name VARCHAR(30),
Last_name VARCHAR(30),
Salary MONEY,
Joining_Date DATETIME,
Department VARCHAR(20),
Manager_id INT
)

CREATE TABLE Incentives
(
Employee_ref_id INT PRIMARY KEY,
Incentive_Date DATETIME,
Incentive_amount MONEY
)

INSERT INTO Employee1 VALUES(1,'Jerry','Parker',20000,'10-12-2011 12:13','Banking',NULL)
INSERT INTO Employee1 VALUES(2,'Merry','Geller',25000,'11-12-2011 12:13','Insurence',1)
INSERT INTO Employee1 VALUES(3,'Steave','Gomez',30000,'08-12-2011 12:13','Banking',1)
INSERT INTO Employee1 VALUES(4,'Michelle','Specter',35000,'08-08-2015 12:13','Services',2)
INSERT INTO Employee1 VALUES(5,'Mike','Stinson',40000,'10-09-2016 12:13','Banking',3)
INSERT INTO Employee1 VALUES(6,'Loretta','Green',45000,'10-10-2017 12:13','Banking',3)
INSERT INTO Employee1 VALUES(7,'Cody','Miskell',50000,'11-11-2018 12:13','Services',2)

INSERT INTO Incentives VALUES(1,'10-12-2011 12:13',5000)
INSERT INTO Incentives VALUES(2,'10-12-2011 12:13',4000)
INSERT INTO Incentives VALUES(3,'10-12-2011 12:13',3000)
INSERT INTO Incentives VALUES(4,'10-12-2011 12:13',2000)
INSERT INTO Incentives VALUES(5,'10-12-2011 12:13',0)
 

SELECT * FROM Employee1
SELECT * FROM Incentives

--1.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT DATEDIFF(dd,E.Joining_Date,I.Incentive_Date) AS Date_Diff 
FROM Employee1 E 
     JOIN Incentives I 
     ON E.Employee_id = I.Employee_ref_id

--2.Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT E.First_name
,      I.Incentive_amount 
FROM Employee1 E 
     JOIN Incentives I 
     ON E.Employee_id = I.Employee_ref_id 
WHERE Incentive_amount>3000

--3.Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT E.First_name
,      I.Incentive_amount 
FROM Employee1 E 
     JOIN Incentives I 
     ON  E.Employee_id = I.Employee_ref_id

--4.Select EmployeeName, ManagerName from the employee table.
SELECT E.First_name AS EmployeeName
,      M.FIrst_name AS ManagerName 
FROM Employee1 E 
     JOIN Employee1 M 
	 ON M.Employee_id = E.Manager_id

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
SELECT E.First_name
,      CASE 
       WHEN I.Incentive_amount IS NULL THEN 0 
	   ELSE I.Incentive_amount 
	   END 
	   AS IAmount 
FROM Employee1 E 
     JOIN Incentives I 
	 ON E.Employee_id = I.Employee_ref_id


