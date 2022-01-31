USE Assignment2

SELECT *
FROM Employees
WHERE DepartmentID = 90

-- 1. Write a query to rank employees based on their salary for a month

WITH CTE_Employee_rank(Rank, Fullname, Salary)
AS
(
	SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS 'Rank'
		,	CONCAT(FirstName,SPACE(1),LastName) AS 'Fullname'
		,	Salary
	FROM Employees
)

SELECT *
FROM CTE_Employee_rank

-- 2. Select 4th Highest salary from employee table using ranking function

WITH CTE_Employee_rank(Rank, Fullname, Salary)
AS
(
	SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS 'Rank'
		,	CONCAT(FirstName,SPACE(1),LastName) AS 'Fullname'
		,	Salary
	FROM Employees
)

SELECT *
FROM CTE_Employee_rank
WHERE Rank = 4


-- 3. Get department, total salary with respect to a department from employee table.

WITH CTE_department_salary(DepartmentName, Total_Salary)
AS
(	
	SELECT  Dept.DepartmentName
		,	SUM(Emp.Salary) AS 'Total Salary'
	FROM Departments AS Dept
	JOIN Employees AS Emp
	ON Dept.DepartmentID = Emp.DepartmentID
	GROUP BY Dept.DepartmentName
)
SELECT *  
FROM CTE_department_salary

-- 4. Get department, total salary with respect to a department from employee table order by total salary descending

WITH CTE_department_salary(DepartmentName, Total_Salary)
AS
(	
	SELECT  Dept.DepartmentName
		,	SUM(Emp.Salary) AS 'Total Salary'
	FROM Departments AS Dept
	JOIN Employees AS Emp
	ON Dept.DepartmentID = Emp.DepartmentID
	GROUP BY Dept.DepartmentName
)

SELECT *
FROM CTE_department_salary
ORDER BY Total_salary DESC

-- 5. Get department wise maximum salary from employee table order by salary ascending

WITH CTE_department_salary_max(DepartmentName, Max_Salary)
AS
(	
	SELECT  Dept.DepartmentName
		,	MAX(Emp.Salary) AS 'Max Salary'
	FROM Departments AS Dept
	JOIN Employees AS Emp
	ON Dept.DepartmentID = Emp.DepartmentID
	GROUP BY Dept.DepartmentName
)

SELECT *
FROM CTE_department_salary_max
ORDER BY Max_salary ASC

-- 6. Get department wise minimum salary from employee table order by salary ascending


WITH CTE_department_salary_max(DepartmentName, Min_Salary)
AS
(	
	SELECT  Dept.DepartmentName
		,	MIN(Emp.Salary) AS 'Min Salary'
	FROM Departments AS Dept
	JOIN Employees AS Emp
	ON Dept.DepartmentID = Emp.DepartmentID
	GROUP BY Dept.DepartmentName
)

SELECT *
FROM CTE_department_salary_max
ORDER BY Min_salary ASC

-- 7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

WITH CTE_department_salary_greater(DepartmentName, Total_Salary)
AS
(	
	SELECT  Dept.DepartmentName
		,	SUM(Emp.Salary) AS 'Total Salary'
	FROM Departments AS Dept
	JOIN Employees AS Emp
	ON Dept.DepartmentID = Emp.DepartmentID
	GROUP BY Dept.DepartmentName
)

SELECT *
FROM CTE_department_salary_greater
WHERE Total_Salary > 50000
ORDER BY Total_salary DESC


-- 8. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

WITH CTE_DATE_DIFF(EmployeeID, Fullname, HireDate, IncentiveDate, Difference)
AS
(
	SELECT Emp.EmployeeID
		,	CONCAT(Emp.FirstName,SPACE(1),Emp.LastName) AS 'Fullname'
		,	Emp.HireDate
		,	Inc.Incentive_Date
		,	DATEDIFF(yyyy,Emp.HireDate,Inc.Incentive_Date) AS 'Difference'
	FROM Employees AS Emp
	JOIN Incentives AS Inc
	ON Emp.EmployeeID = INc.Employee_Ref_Id
)

SELECT * 
FROM CTE_DATE_DIFF

-- 9. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

WITH CTE_Inc_Amount_Greater(EmployeeID, Fullname, Incentive_Amount)
AS
(
	SELECT Emp.EmployeeID
		,	CONCAT(Emp.FirstName,SPACE(1),Emp.LastName) AS 'Fullname'
		,	Inc.Incentive_Amount
	FROM Employees AS Emp
	JOIN Incentives AS Inc
	ON Emp.EmployeeID = INc.Employee_Ref_Id
)

SELECT * 
FROM Incentive_Amount
WHERE Incentive_Amount > 3000

-- 10. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

WITH CTE_Inc_Full_Join(EmployeeID, Fullname, Incentive_Amount)
AS
(
	SELECT Emp.EmployeeID
		,	CONCAT(Emp.FirstName,SPACE(1),Emp.LastName) AS 'Fullname'
		,	Inc.Incentive_Amount
	FROM Employees AS Emp
	FULL JOIN Incentives AS Inc
	ON Emp.EmployeeID = INc.Employee_Ref_Id
)

SELECT * 
FROM CTE_Inc_Full_Join


-- 11. Select EmployeeName, ManagerName from the employee table.

WITH CTE_Manager(Employee, Manager)
AS
(
	SELECT	CONCAT(Emp.FirstName,SPACE(1),Emp.LastName) AS 'Employee'
		,	CONCAT(Mgr.FirstName,SPACE(1),Mgr.LastName) AS 'Manager'
	FROM Employees AS Emp
	JOIN Employees AS Mgr
	ON Mgr.EmployeeID = Emp.ManagerID
)

SELECT *
FROM CTE_Manager

-- 12. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.


WITH CTE_Inc_Full_Join_Case(EmployeeID, Fullname, Incentive_Amount)
AS
(
	SELECT Emp.EmployeeID
		,	CONCAT(Emp.FirstName,SPACE(1),Emp.LastName) AS 'Fullname'
		,	Inc.Incentive_Amount
	FROM Employees AS Emp
	FULL JOIN Incentives AS Inc
	ON Emp.EmployeeID = INc.Employee_Ref_Id
)

SELECT	EmployeeID
	,	Fullname
	,	 CASE
			WHEN  Incentive_Amount IS NULL  THEN 0
			ELSE Incentive_Amount
		END AS 'Incentive_Amount'
		
FROM CTE_Inc_Full_Join_case
