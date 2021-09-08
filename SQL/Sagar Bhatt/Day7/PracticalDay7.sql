USE Day2

SELECT *
FROM Employees
SELECT *
FROM Departments
SELECT *
FROM Locations
SELECT *
FROM Countries
SELECT *
FROM JobHistory
SELECT *
FROM Incentives

-- 1.Write a query to rank employees based on their salary for a month
WITH CTE_Employees_RankBySalary(EmployeeRank,EmployeeID, FirstName, LastName, Salary)
AS
(
	SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) 'EmployeeRank'
		, EmployeeID
		, FirstName
		, LastName
		, Salary
	FROM Employees
)
SELECT * 
FROM CTE_Employees_RankBySalary

-- 2.Select 4th Highest salary from employee table using ranking function
WITH CTE_Employees_RankBySalary(EmployeeRank,EmployeeID, FirstName, LastName, Salary)
AS
(
	SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) 'EmployeeRank'
		, EmployeeID
		, FirstName
		, LastName
		, Salary
	FROM Employees
)
SELECT * 
FROM CTE_Employees_RankBySalary WHERE EmployeeRank = 4

-- 3.Get department, total salary with respect to a department from employee table.
WITH CTE_Department_Employee_TotalSalary(DepartmentID, DepartmentName, TotalSalary)
AS
(
	SELECT E.DepartmentID
		, D.DepartmentName
		, SUM(E.Salary) 'TotalSalary'
	FROM Employees E
	JOIN Departments D
	ON E.DepartmentID = D.DepartmentID
	GROUP BY E.DepartmentID, D.DepartmentName
)
SELECT *
FROM CTE_Department_Employee_TotalSalary

-- 4.Get department, total salary with respect to a department from employee table order by total salary descending
WITH CTE_Department_Employee_TotalSalary(DepartmentID, DepartmentName, TotalSalary)
AS
(
	SELECT E.DepartmentID
		, D.DepartmentName
		, SUM(E.Salary) 'TotalSalary'
	FROM Employees E
	JOIN Departments D
	ON E.DepartmentID = D.DepartmentID
	GROUP BY E.DepartmentID, D.DepartmentName
)
SELECT *
FROM CTE_Department_Employee_TotalSalary 
ORDER BY TotalSalary DESC

-- 5.Get department wise maximum salary from employee table order by salary ascending
WITH CTE_Department_Employee_MaximumSalary(DepartmentID, DepartmentName, MaxSalary)
AS
(
	SELECT E.DepartmentID
		, D.DepartmentName
		, MAX(E.Salary) 'MaxSalary'
	FROM Employees E
	JOIN Departments D
	ON E.DepartmentID = D.DepartmentID
	GROUP BY E.DepartmentID, D.DepartmentName
)
SELECT *
FROM CTE_Department_Employee_MaximumSalary 

-- 6.Get department wise minimum salary from employee table order by salary ascending
WITH CTE_Department_Employee_MinimumSalary(DepartmentID, DepartmentName, MinSalary)
AS
(
	SELECT E.DepartmentID
		, D.DepartmentName
		, MIN(E.Salary) 'MinSalary'
	FROM Employees E
	JOIN Departments D
	ON E.DepartmentID = D.DepartmentID
	GROUP BY E.DepartmentID, D.DepartmentName
)
SELECT *
FROM CTE_Department_Employee_MinimumSalary

-- 7.Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH CTE_Department_Employee_TotalSalary(DepartmentID, DepartmentName, TotalSalary)
AS
(
	SELECT E.DepartmentID
		, D.DepartmentName
		, SUM(E.Salary) 'TotalSalary'
	FROM Employees E
	JOIN Departments D
	ON E.DepartmentID = D.DepartmentID
	GROUP BY E.DepartmentID, D.DepartmentName
)
SELECT *
FROM CTE_Department_Employee_TotalSalary
WHERE TotalSalary > 50000
ORDER BY TotalSalary DESC

-- 8.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH CTE_Employee_Incentive_DateDiff(EmployeeID, FullName, HireDate, Incentive_Date, DateDifference)
AS
(
	SELECT E.EmployeeID
		, CONCAT(E.FirstName, SPACE(1), E.LastName) 'FullName'
		, E.HireDate
		, I.Incentive_Date
		, DATEDIFF(yyyy, E.HireDate, I.Incentive_Date) 'DateDifference'
	FROM Employees E
	JOIN Incentives	I
	ON E.EmployeeID = I.Employee_Ref_Id
)
SELECT *
FROM CTE_Employee_Incentive_DateDiff

-- 9.Select first_name, incentive amount from employee and incentives table for those employees who have incentives and 
--incentive amount greater than 3000
WITH CTE_Employee_Incentive_Incentive_Amount(FirstName, Incentive_Amount)
AS
(
	SELECT E.FirstName
		, I.Incentive_Amount
	FROM Employees E
	JOIN Incentives	I
	ON E.EmployeeID = I.Employee_Ref_Id
)
SELECT *
FROM CTE_Employee_Incentive_Incentive_Amount
WHERE Incentive_Amount > 3000

-- 10.Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
WITH CTE_Employee_Incentive_Incentive_Amount(FirstName, Incentive_Amount)
AS
(
	SELECT E.FirstName
		, I.Incentive_Amount
	FROM Employees E
	FULL JOIN Incentives	I
	ON E.EmployeeID = I.Employee_Ref_Id
)
SELECT *
FROM CTE_Employee_Incentive_Incentive_Amount

-- 11.Select EmployeeName, ManagerName from the employee table.
WITH CTE_Employees_Manager(EmployeeName, ManagerName)
AS
(
	SELECT CONCAT(E.FirstName, SPACE(1), E.LastName) 'EmployeeName'
		, CONCAT(M.FirstName, SPACE(1), M.LastName) 'ManagerName'
	FROM Employees E
	LEFT JOIN Employees M
	ON E.ManagerID = M.EmployeeID
)
SELECT *
FROM CTE_Employees_Manager

-- 12.Select first_name, incentive amount from employee and incentives table for all employees even 
--if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
WITH CTE_Employee_Incentive_Incentive_Amount(FirstName, Incentive_Amount)
AS
(
	SELECT E.FirstName
		--, CASE 
		--WHEN I.Incentive_Amount IS NULL THEN 0
		--ELSE I.Incentive_Amount
		--END
		, ISNULL(I.Incentive_Amount, 0)
	FROM Employees E
	FULL JOIN Incentives	I
	ON E.EmployeeID = I.Employee_Ref_Id
)
SELECT *
FROM CTE_Employee_Incentive_Incentive_Amount
