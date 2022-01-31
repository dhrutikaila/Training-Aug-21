-- Day 4 Exercise with Derived Tables --

-- 1. Write a query to rank employees based on their salary for a month 
SELECT Rank,EmployeeID FROM
(SELECT EmployeeID,RANK() OVER (ORDER BY Salary DESC) AS Rank 
From Employees) Temp
 

-- 2. Select 4th Highest salary from employee table using ranking function
SELECT  Rank,Salary FROM
(SELECT Rank= DENSE_RANK() OVER (ORDER BY SALARY DESC)  , Salary
FROM Employees) Temp
WHERE Rank=4


-- 3. Get department, total salary with respect to a department from employee table.
SELECT DepartmentID,DeptSalary FROM
(	SELECT DepartmentID,SUM(Salary) AS DeptSalary
	FROM Employees
	GROUP BY DepartmentID) Temp
WHERE DepartmentID != 0


-- 4. Get department, total salary with respect to a department from employee table order by total salary descending
SELECT DepartmentID,DeptSalary FROM
(
SELECT DepartmentID,SUM(Salary) AS DeptSalary
FROM Employees
GROUP BY DepartmentID
) Temp
WHERE DepartmentID != 0
ORDER BY DeptSalary DESC


 -- 5. Get department wise maximum salary from employee table order by salary ascending
SELECT DepartmentID,Salary FROM
( 
	SELECT DepartmentID,MAX(Salary) AS Salary
	FROM Employees
	GROUP BY DepartmentID
) Temp
WHERE DepartmentID != 0
ORDER BY Salary 


-- 6. Get department wise minimum salary from employee table order by salary ascSELECT DepartmentID,DeptSalary FROM(
SELECT DepartmentID,Salary FROM
( 
SELECT DepartmentID, MIN(Salary) AS Salary
	FROM Employees 
	GROUP BY DepartmentID
) Temp
WHERE DepartmentID != 0
ORDER BY Salary 


-- 7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID,TotalSalary FROM
(
SELECT DepartmentID,TotalSalary=SUM(Salary)
FROM Employees
GROUP BY DepartmentID
) Temp
WHERE DepartmentID != 0 AND DeptSalary>50000
ORDER BY TotalSalary DESC



-- Day 5 Exercise with CTE --

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT EmployeeID ,DateDiff FROM
(
		SELECT e.EmployeeID
			,DATEDIFF(MM,e.JoiningDate,i.IncentiveDate) AS DateDiff
		FROM Employees AS e
			INNER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
) Temp


-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT EmployeeID,FirstName,IncentiveAmount FROM
(
SELECT e.EmployeeID
		,e.FirstName
		,i.IncentiveAmount
FROM Employees AS e
			INNER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
WHERE i.IncentiveAmount > 3000
)Temp

-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives.
		


-- 4. Select EmployeeName, ManagerName from the employee table.
SELECT EmployeeName , ManagerName FROM
(
SELECT
	e.FirstName AS EmployeeName
	,m.FirstName AS ManagerName
FROM Employees as e 
	LEFT OUTER JOIN Employees m
		ON e.ManagerID = m.EmployeeID
) temp


-- 5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn�t get incentives.


SELECT EmployeeID,FirstName, IncetiveAmount FROM
(
	SELECT e.EmployeeID
		,e.FirstName
		,ISNULL(i.IncentiveAmount,0) AS IncetiveAmount
	FROM Employees AS e
		LEFT OUTER JOIN Incentive AS i ON e.EmployeeID=i.EmployeeID
) temp