CREATE TABLE Employee
(
EmployeeID INT,
FirstName VARCHAR(100),
LastName VARCHAR(50),
Salary INT ,
JoiningDate DATETIME,
Department VARCHAR(50),
ManagerID INT,
)
SELECT * FROM Employee

CREATE TABLE Incentives
(
Employee_Ref_Id INT,
Incentive_Date DATETIME,
Incentive_Amount INT,
)
SELECT * FROM Incentives

--ASSIGNMENT QUERIES

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT  EmployeeID,DATEDIFF(DD,JoiningDate,Incentive_Date) FROM Employee JOIN Incentives 
ON EmployeeID = Employee_Ref_Id;

--select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT FirstName,Incentive_Amount FROM Employee JOIN Incentives ON EmployeeID = Employee_Ref_Id 
WHERE Incentive_Amount>3000;

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT FirstName,Incentive_Amount FROM  Employee LEFT JOIN Incentives ON EmployeeID = Employee_Ref_ID; 

--Select EmployeeName, ManagerName from the employee table.

SELECT T1.FirstName,T2.FirstName FROM  Employee T1, Employee T2 WHERE T1.EmployeeID = T2.ManagerID

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT FirstName,ISNULL(Incentive_Amount,0) AS Incentive_Amount_Update FROM  Employee LEFT JOIN Incentives 
ON EmployeeID = Employee_Ref_ID 

