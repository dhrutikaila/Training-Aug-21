CREATE DATABASE Day5;

CREATE TABLE Emp
(
EmployeeID INT,
FirstName VARCHAR(100),
LastName VARCHAR(50),
Salary DECIMAL (8,2) ,
JoiningDate DATETIME,
Department VARCHAR(50),
)

INSERT INTO Emp VALUES (1,'Rutvik','kalasha',10000,2010-10-01,'IT');
INSERT INTO Emp VALUES (2,'Yash','Rangani',25000,2011-10-01,'EC');
INSERT INTO Emp VALUES (3,'Nayan','Muliya',30000,2010-10-01,'HR');
INSERT INTO Emp VALUES (4,'Darshan','Hihoriya',40000,2010-10-01,'COMPUTER');
INSERT INTO Emp VALUES (5,'Rahul','Makwana',70000,2011-10-01,'IT');
INSERT INTO Emp VALUES (6,'Jay','Vaghela',80000,2011-10-01,'EC');

SELECT  FROM Emp;

CREATE TABLE Incentive
(
Employee_Ref_Id INT,
Incentive_Date DATETIME,
Incentive_Amount DECIMAL(8,2),
)


INSERT INTO Incentive VALUES (1,2010-10-01,3000);
INSERT INTO Incentive VALUES (2,2011-10-01,4000);
INSERT INTO Incentive VALUES (3,2010-10-01,2000);
INSERT INTO Incentive VALUES (1,2010-10-01,2500);
INSERT INTO Incentive VALUES (2,2011-10-01,3500);
INSERT INTO Incentive VALUES (3,2011-10-01,5000);

SELECT * FROM Incentive

--ASSIGNMENT QUERIES

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT FirstName,Incentive_Date ,Incentive_Amount FROM Emp A INNER JOIN Incentive B ON A.EmployeeID = B.Employee_Ref_Id;

--select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT FirstName,Incentive_Amount FROM Emp A INNER JOIN Incentive B ON A.EmployeeID = B.Employee_Ref_Id AND Incentive_Amount3000;

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT FirstName,Incentive_Amount FROM  Emp A LEFT JOIN Incentive B ON A.EmployeeID = B.Employee_Ref_ID; 

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT FirstName,ISNULL(Incentive_Amount,0) FROM  Emp A LEFT JOIN Incentive B ON A.EmployeeID = B.Employee_Ref_ID