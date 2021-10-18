USE [Day9 (JOIN)]

-------------------------------------------------------------------------------------------------------
-- Query to create Incentive Table 

--sp_rename 'Employees.HireDate', 'JoiningDate', 'COLUMN';

--SELECT EmployeeID , DATEADD(YY,1,JoiningDate) AS 'IncentiveDate' , 
--( Salary*0.255) AS 'IncentiveAmount' ,DepartmentID into Incentive FROM Employees

SELECT * FROM Incentive

--UPDATE Incentive SET IncentiveDate = CASE
--				WHEN DepartmentID = 80 THEN DATEADD(MM,3,IncentiveDate)
--				WHEN DepartmentID = 110 THEN DATEADD(MM,8,IncentiveDate)
--				WHEN DepartmentID = 30 THEN DATEADD(MM,5,IncentiveDate)
--				WHEN DepartmentID = 10 THEN DATEADD(MM,10,IncentiveDate)
--				ELSE IncentiveDate
--				END;
------------------------------------------------------------------------------------------------------

--Assignment

/*
Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
Select EmployeeName, ManagerName from the employee table.
*/



-- Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT DATEDIFF(MM,JoiningDate,IncentiveDate) AS 'Difference in Month' FROM Employees AS e
JOIN Incentive AS i
ON e.EmployeeID = i.EmployeeID



-- Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT e.FirstName , i.IncentiveAmount FROM Employees AS e
JOIN Incentive AS i
ON e.EmployeeID = i.EmployeeID
WHERE i.IncentiveAmount > 3000



-- Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT e.FirstName , i.IncentiveAmount FROM Employees AS e
LEFT JOIN Incentive AS i
ON e.EmployeeID = i.EmployeeID

-- OR 

SELECT e.FirstName , i.IncentiveAmount FROM Employees AS e
FULL JOIN Incentive AS i
ON e.EmployeeID = i.EmployeeID


-- Select EmployeeName, ManagerName from the employee table.
	

SELECT c.FirstName AS 'EmployeeName'  ,o.FirstName AS 'ManagerName' FROM Employees AS o
JOIN Employees AS c
ON o.EmployeeID = c.ManagerID
