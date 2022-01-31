Query-1
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH DIFF (FirstName,JoiningDate,IncentiveDate,Experience)
AS (SELECT e.FirstName, e.JoiningDate , i.IncentiveDate, DATEDIFF(dd,JoiningDate,GETDATE()) - DATEDIFF(dd,IncentiveDate,GETDATE()) AS 'Difference' FROM Employee e left join Incentives i on e.EmployeeId=i.EmployeeRefId)
SELECT * FROM DIFF


Query-2
--Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
WITH GREAT (FirstName,IncentiveAmount)
AS (select e.FirstName,i.IncentiveAmount from Employee e join Incentives i on e.EmployeeId=i.EmployeeRefId where i.IncentiveAmount>3000)
SELECT * FROM GREAT


Query-3
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
WITH IncenNot (FirstName,IncentiveAmount)
AS (select e.FirstName,i.IncentiveAmount from Employee e left join Incentives i on e.EmployeeId=i.EmployeeRefId)
SELECT * FROM IncenNot


Query-4
--Select EmployeeName, ManagerName from the employee table.
WITH EmpMan (EmployeeName,ManagerName)
AS (select e.FirstName as 'EmployeeName', f.FirstName as 'ManagerName' from employee e left join employee f on e.ManagerId=f.EmployeeId)
SELECT * FROM EmpMan


Query-5
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
WITH DNINT (FirstName,IncentiveAmount)
AS (SELECT e.FirstName, CASE WHEN IncentiveAmount IS NULL THEN 0 ELSE IncentiveAmount END AS 'IncentiveAmount'
FROM Employee e left join Incentives i ON e.EmployeeId=i.EmployeeRefId)
SELECT * FROM DNINT


Query-6
--Write a query to rank employees based on their salary for a month
WITH RNK
AS (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) [Salary_Rank],* FROM Employees)
SELECT * FROM RNK


Query-7
--Select 4th Highest salary from employee table using ranking function
WITH HST
AS (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS [TOP_SALARY],* FROM Employees) 
SELECT * FROM HST WHERE TOP_SALARY=4


Query-8
--Get department, total salary with respect to a department from employee table.
WITH DEPT (DepartmentID, SalaryPerDept)
AS (SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM DEPT


Query-9
--Get department, total salary with respect to a department from employee table order by total salary descending
WITH DEP (DepartmentID, SalaryPerDept)
AS (SELECT DepartmentID, SUM(Salary) AS Salary FROM Employees GROUP BY DepartmentID)
SELECT * FROM DEP ORDER BY SalaryPerDept DESC


Query-10
--Get department wise maximum salary from employee table order by salary ascending
WITH DEPMAX (DepartmentID, SalaryPerDept)
AS (SELECT DepartmentID, MAX(Salary) AS Salary FROM Employees GROUP BY DepartmentID)
SELECT * FROM DEPMAX ORDER BY SalaryPerDept ASC

Query-11
--Get department wise minimum salary from employee table order by salary ascending
WITH DEPMIN (DepartmentID, SalaryPerDept)
AS (SELECT DepartmentID, MIN(Salary) AS Salary FROM Employees GROUP BY DepartmentID)
SELECT * FROM DEPMIN ORDER BY SalaryPerDept ASC


Query-12
--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH SALGRT (DepartmentID, TotalSalary)
AS (SELECT DepartmentID, SUM(Salary) AS Salary FROM Employees GROUP BY DepartmentID)
SELECT * FROM SALGRT WHERE TotalSalary>5000 ORDER BY TotalSalary DESC