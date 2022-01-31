/* Assignment day 7 - Convert Day4 and Day5 Exercises with CTE and Derived Table. */


-- Day4 queries

use db2
-- Q1 Write a query to rank employees based on their salary for a month

With Salary_CTE(EmployeeID,FirstName,LastName,Salary)
AS
(SELECT EmployeeID,FirstName,LastName,Salary FROM Employees)
SELECT *,DENSE_RANK() OVER (ORDER BY Salary DESC) as 'rank' FROM Salary_CTE


-- Q2 Select 4th Highest salary from employee table using ranking function

With SalryRank_CTE(EmployeeId,Name,Salary,Salary_Rank) AS (
SELECT EmployeeID,
		'Name' = FirstName +' '+LastName,
		Salary, 
		DENSE_RANK() OVER ( ORDER BY Salary DESC) as [Salary_Rank] 
FROM dbo.Employees)
SELECT * FROM SalryRank_CTE WHERE Salary_RAnk = 4


-- Q3 Get department, total salary with respect to a department from employee table.

With Dept_CTE(DepartmentID,Salary) AS (
SELECT DepartmentID,Salary FROM Employees )
SELECT DepartmentID,SUM(Salary) FROM Dept_CTE GROUP BY DepartmentID


-- Q4 Get department, total salary with respect to a department from employee table order by total salary descending

With Dept_CTE(DepartmentID,Salary) AS (
SELECT DepartmentID,Salary FROM Employees )
SELECT DepartmentID,SUM(Salary) FROM Dept_CTE GROUP BY DepartmentID ORDER BY SUM(Salary) DESC


-- Q5 Get department wise maximum salary from employee table order by salary ascending

WITH Dept_Salary_CTE(DepartmentID,Salary) AS (
SELECT DepartmentId, Salary from dbo.Employees )
SELECT DepartmentID,MAX(Salary) FROM Dept_Salary_CTE
GROUP BY DepartmentID ORDER BY MAX(Salary)


-- Q6 Get department wise minimum salary from employee table order by salary ascending

WITH Dept_Salary_CTE(DepartmentID,Salary) AS (
SELECT DepartmentId, Salary from dbo.Employees )
SELECT DepartmentID,MIN(Salary) FROM Dept_Salary_CTE
GROUP BY DepartmentID ORDER BY MIN(Salary)


-- Q7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

With Dept_CTE(DepartmentID,Salary) AS (
SELECT DepartmentID,SUM(Salary) FROM Employees GROUP BY DepartmentID )
SELECT DepartmentID,Salary FROM Dept_CTE WHERE Salary > 50000 ORDER BY Salary DESC	




 -- Day5 queries

 use Demo
 -- Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

With DateDiff_CTE(empID,JoiningDate,IncentiveDate) AS (
SELECT e.Emp_id,
		e.Joining_Date,
		i.Incentive_Date
FROM Employee as e
		JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id)
SELECT *,DATEDIFF(DAY,JoiningDate,IncentiveDate) as 'DayDiff' FROM DateDiff_CTE


-- Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

With incentive_CTE(firstName,Amount) AS (
SELECT e.First_Name,i.Incentive_Amount
FROM Employee e
	INNER JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id )
SELECT * FROM incentive_CTE WHERE Amount>3000


-- Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

With EmpIncentive_CTE(FirstName,Incentive) AS (
SELECT e.First_Name,i.Incentive_Amount
FROM Employee e
	LEFT OUTER JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id )
SELECT * FROM EmpIncentive_CTE


-- Q4 Select EmployeeName, ManagerName from the employee table.

With EmpManager(Employee,Manager) AS (
SELECT emp.First_Name as 'Employee',mgr.First_Name as 'Manager'
FROM Employee emp
	JOIN Employee mgr ON emp.Manager_id = mgr.Emp_id )
SELECT * FROM EmpManager


-- Q5 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

With Emptemp(FirstName,Incentive) AS (
SELECT e.First_Name,i.Incentive_Amount
FROM Employee e
	LEFT JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id )
SELECT FirstName,ISNULL(Incentive,0) FROM Emptemp


