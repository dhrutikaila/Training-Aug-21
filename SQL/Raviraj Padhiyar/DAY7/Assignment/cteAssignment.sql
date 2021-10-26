-- Day 4 

-- 1. Write a query to rank employees based on their salary for a month
With SalaryRank_CTE (FirstName,Salary,SalaryRank)
AS(
SELECT FirstName,Salary,RANK() OVER (ORDER BY Salary DESC) AS SalaryRank 
From Employees

)
select FirstName,Salary,SalaryRank from SalaryRank_CTE;


-- 2. Select 4th Highest salary from employee table using ranking function
With Rank_CTE (Rank, Salary)
AS(
SELECT RANK_SALARY= DENSE_RANK() OVER (ORDER BY SALARY DESC)  , Salary
FROM Employees 
)
select Rank , Salary from Rank_CTE
where Rank = 4;

-- 3. Get department, total salary with respect to a department from employee table.
WITH totalsalary_dept (DepartmentID,TotalSalary)
AS(
	SELECT DepartmentID,SUM(Salary) AS TotalSalary
	FROM Employees
	GROUP BY DepartmentID
)
SELECT DepartmentID,TotalSalary FROM totalsalary_dept
WHERE DepartmentID != 0;


-- 4. Get department, total salary with respect to a department from employee table order by total salary descending
With Sumsalary_dept (TotalSalary, DepartmentID)
AS(
SELECT DepartmentID,SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
)
SELECT TotalSalary , DepartmentID  from Sumsalary_dept
 ORDER BY TotalSalary DESC;


 -- 5. Get department wise maximum salary from employee table order by salary ascending
WITH maxsalary_dept (DepartmentID,Salary)
AS(
	SELECT DepartmentID,MAX(Salary) AS Salary
	FROM Employees
	GROUP BY DepartmentID
)
SELECT DepartmentID,Salary FROM maxsalary_dept
WHERE DepartmentID != 0
ORDER BY Salary ;


-- 6. Get department wise minimum salary from employee table order by salary ascending
WITH minsalary_dept (DepartmentID,Salary)
AS(
	SELECT DepartmentID, MIN(Salary) AS Salary
	FROM Employees 
	GROUP BY DepartmentID 
)
SELECT DepartmentID,Salary FROM minsalary_dept
WHERE DepartmentID != 0
ORDER BY Salary ;


-- 7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH sal_more_50k (DepartmentID,Salary)
AS(
	SELECT DepartmentID,TotalSalary=SUM(Salary)
	FROM Employees
	GROUP BY DepartmentID

)
SELECT DepartmentID,Salary FROM sal_more_50k
WHERE DepartmentID != 0 AND Salary>50000
ORDER BY Salary  DESC;


--day5
-- Day 5 Exercise with CTE 

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH DATEDIFF_CTE (EmployeeID ,DateDiff)
AS
	(
		SELECT e.EmployeeID
			,DATEDIFF(MM,e.JoiningDate,i.IncentiveDate) AS 'DIFF IN MONTHS'
		FROM Employees AS e
			INNER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
	)
SELECT  EmployeeID , DateDiff FROM DATEDIFF_CTE;



-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
WITH IncAmount_CTE (EmployeeID,FirstName,IncentiveAmount)
AS
	(
		SELECT e.EmployeeID
			,e.FirstName
			,i.IncentiveAmount
		FROM Employees AS e
			INNER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
		WHERE i.IncentiveAmount > 3000
	)
SELECT EmployeeID,FirstName,IncentiveAmount FROM IncAmount_CTE;



-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives.
WITH EmpCTE (EmployeeID,FirstName,IncentiveAmount)
AS
	(
		SELECT e.EmployeeID
			,e.FirstName
			,i.IncentiveAmount
		FROM Employees AS e
			LEFT OUTER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
	)
SELECT EmployeeID,FirstName,IncentiveAmount FROM EmpCTE;



-- 4. Select EmployeeName, ManagerName from the employee table.
WITH EmpManCTE (EmployeeName , ManagerName)
AS
	(
	SELECT
		e.FirstName As Employee
		,m.FirstName
	FROM Employees as e 
		LEFT OUTER JOIN Employees m
			ON e.ManagerID = m.EmployeeID
	)
SELECT EmployeeName , ManagerName FROM EmpManCTE;



-- 5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn�t get incentives and set incentive amount as 0 for those employees who didn't get incentives.
WITH EmpCTE (EmployeeID,FirstName, IncetiveAmount)
AS
	(
	SELECT e.EmployeeID
		,e.FirstName
		,ISNULL(i.IncentiveAmount,0)
	FROM Employees AS e
		LEFT OUTER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
	)
SELECT EmployeeID,FirstName, IncetiveAmount FROM EmpCTE;



