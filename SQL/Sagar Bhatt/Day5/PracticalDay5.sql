SELECT * 
FROM Employees
SELECT * 
FROM Incentives

--1-Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT Emp.FirstName + ' ' + Emp.LastName 'FULL NAME'
	, CONVERT(VARCHAR, Emp.HireDate, 105) 'Hire Date'
	, FORMAT(Inc.Incentive_Date, 'dd-MM-yyyy') 'Incentive Date'
	, DATEDIFF(yy,Emp.HireDate, Inc.Incentive_Date) 'Date Difference'
FROM Employees Emp
JOIN Incentives Inc
ON Emp.EmployeeID = Inc.Employee_Ref_ID 

--2-Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT Emp.FirstName
	, Inc.Incentive_Amount
FROM Employees Emp
JOIN Incentives Inc
ON Emp.EmployeeID = Inc.Employee_Ref_ID
WHERE Inc.Incentive_Amount > 3000

--3-Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT Emp.FirstName
	, Inc.Incentive_Amount
FROM Employees Emp
LEFT JOIN Incentives Inc
ON Emp.EmployeeID = Inc.Employee_Ref_ID

--4-Select EmployeeName, ManagerName from the employee table.
SELECT Emp.FirstName + ' ' + Emp.LastName 'Employee NAME'
	, Emp.EmployeeID [Employee Id]
	, Mgr.FirstName + ' ' + Mgr.LastName 'Manager NAME'
	, Mgr.EmployeeID [Manager Id]
FROM Employees Mgr
RIGHT JOIN Employees Emp
ON Emp.ManagerID = Mgr.EmployeeID
ORDER BY Emp.EmployeeID

--5-Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and 
--set incentive amount as 0 for those employees who didn’t get incentives.
SELECT Emp.FirstName
	, ISNULL(Inc.Incentive_Amount, 0)
FROM Employees Emp
LEFT JOIN Incentives Inc
ON Emp.EmployeeID = Inc.Employee_Ref_ID
