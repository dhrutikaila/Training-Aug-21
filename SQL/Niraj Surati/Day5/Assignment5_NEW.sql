USE Assignment2

SELECT * FROM Employees

SELECT * FROM Incentives

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT CONCAT(EMP.FirstName,SPACE(2),EMP.LastName) AS 'Fullname'
	,	EMP.HireDate AS 'Joining Date'
	,	Inc.Incentive_Date AS 'Incentive Date'
	,	DATEDIFF(YYYY,EMP.HireDate,Inc.Incentive_Date) AS 'Differenve'
FROM Employees AS EMP
JOIN Incentives AS Inc
ON EMP.EmployeeID = Inc.Employee_Ref_Id


-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT CONCAT(EMP.FirstName,SPACE(2),EMP.LastName) AS 'Fullname'
	,	EMP.HireDate AS 'Joining Date'
	,	Inc.Incentive_Date AS 'Incentive Date'
	,	Inc.Incentive_Amount
FROM Employees AS EMP
JOIN Incentives AS Inc
ON EMP.EmployeeID = Inc.Employee_Ref_Id
WHERE Inc.Incentive_Amount > 3000


-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT CONCAT(EMP.FirstName,SPACE(2),EMP.LastName) AS 'Fullname'
	,	EMP.HireDate AS 'Joining Date'
	,	Inc.Incentive_Date AS 'Incentive Date'
	,	Inc.Incentive_Amount
FROM Employees AS EMP
LEFT JOIN Incentives AS Inc
ON EMP.EmployeeID = Inc.Employee_Ref_Id


-- 4. Select EmployeeName, ManagerName from the employee table.

SELECT CONCAT(E2.FirstName,SPACE(1),E2.LastName) AS 'Employee Name'
	,	E2.EmployeeID AS 'Employee ID'
	,	CONCAT(E1.FirstName,SPACE(1),E1.LastName) AS 'Manager Name'
	,	E1.EmployeeID AS 'Manager ID'
FROM Employees AS E1
RIGHT JOIN  Employees AS E2
ON E2.ManagerID = E1.EmployeeID
ORDER BY E2.EmployeeID

-- 5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT CONCAT(EMP.FirstName,SPACE(2),EMP.LastName) AS 'Fullname'
	,	EMP.HireDate AS 'Joining Date'
	,	Inc.Incentive_Date AS 'Incentive Date'
	,	ISNULL(Inc.Incentive_Amount,0) AS 'Incetive Amont'
FROM Employees AS EMP
LEFT JOIN Incentives AS Inc
ON EMP.EmployeeID = Inc.Employee_Ref_Id




