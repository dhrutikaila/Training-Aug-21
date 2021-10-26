USE Day3_SQL

--DERIVED TABLE and CTE Queries--

--1)Write a query to rank employees based on their salary for a month
--Derived--
SELECT * FROM (SELECT RANK() OVER(ORDER BY Salary DESC)[RANK], Salary,FirstName,LastName FROM Employees)temp
--CTE--
WITH Salary_CTE (Ranking,Salary,FirstName,LastName)
AS (SELECT RANK() OVER(ORDER BY Salary DESC)[RANK], Salary,FirstName,LastName FROM Employees)
SELECT * FROM Salary_CTE

--2)Select 4th Highest salary from employee table using ranking function
--Derived--
SELECT * FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)temp WHERE DRANK=4
--CTE--
WITH Salary_CTE(Ranking,Salary)
AS
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)[DRANK],Salary FROM Employees)
SELECT * FROM Salary_CTE WHERE Ranking=4

--3)Get department, total salary with respect to a department from employee table.
--Derived--
SELECT * FROM (SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)temp
--CTE--
WITH Department_CTE(DepartmentID,Dep_Wise_Salary)
AS
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM Department_CTE

--4)Get department, total salary with respect to a department from employee table order by total salary descending
--Derived--
SELECT * FROM 
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)temp  
ORDER BY TotalSalary DESC
--CTE--
WITH Department_CTE (DepartmentID,Dep_Wise_Salary)
AS
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM Department_CTE ORDER BY Dep_Wise_Salary DESC

--5)Get department wise maximum salary from employee table order by salary ascending
--Derived--
SELECT * FROM 
(SELECT DepartmentId,MAX(Salary) AS MaxSalary  FROM Employees GROUP BY DepartmentId)temp
ORDER BY MaxSalary ASC
--CTE--
WITH Salary_CTE(DepartmentID, Dep_Wise_Max_Salary)
AS
(SELECT DepartmentId,MAX(Salary) AS MaxSalary FROM Employees GROUP BY DepartmentId)
SELECT * FROM Salary_CTE ORDER BY Dep_Wise_Max_Salary ASC

--6)Get department wise minimum salary from employee table order by salary ascending
--Derived--
SELECT * FROM 
(SELECT DepartmentId,MIN(Salary) AS MinSalary  FROM Employees GROUP BY DepartmentId)temp
ORDER BY MinSalary ASC
--CTE--
WITH Salary_CTE(DepartmentID, Dep_Wise_Min_Salary)
AS
(SELECT DepartmentId,MIN(Salary) AS MinSalary  FROM Employees GROUP BY DepartmentId)
SELECT * FROM Salary_CTE ORDER BY Dep_Wise_Min_Salary ASC

--7)Select department, total salary with respect to a department from employee table 
--  where total salary greater than 50000 order by TotalSalary descending
--Derived--
SELECT * FROM 
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)temp
WHERE TotalSalary>50000 ORDER BY TotalSalary DESC
--CTE--
WITH Salary_CTE(DepartmentID,TotalSalary)
AS
(SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID)
SELECT * FROM Salary_CTE WHERE TotalSalary>50000 ORDER BY TotalSalary DESC  


-----------------------------------------------------------------------------------



USE Day5_SQL

--1)Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
--Derived--
SELECT * FROM
(SELECT emp.Joining_Date,inc.Incentive_Date , 
DATEDIFF(dd,emp.Joining_Date , inc.Incentive_Date) AS DayDifference 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_ID)temp 
--CTE--
WITH CTE(JoiningDate,IncentiveDate,DayDifference)
AS
(SELECT emp.Joining_Date,inc.Incentive_Date , 
DATEDIFF(dd,emp.Joining_Date , inc.Incentive_Date) AS DateDifference 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_ID)
SELECT * FROM CTE

--2)Select first_name, incentive amount from employee and incentives table for those employees 
--  who have incentives and incentive amount greater than 3000
--Derived--
SELECT * FROM 
(SELECT emp.First_Name,inc.Incentive_Amount 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_Id
WHERE inc.Incentive_Amount > 3000)temp
--CTE--
WITH CTE (First_Name,Incentive_amount)
AS
(SELECT emp.First_Name,inc.Incentive_Amount 
FROM Employee AS emp 
INNER JOIN Incentives AS inc 
ON emp.Employee_ID=inc.Employee_Ref_Id
WHERE inc.Incentive_Amount > 3000)
SELECT * FROM CTE

--3)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
--Derived--
SELECT * FROM 
(SELECT emp.First_Name,inc.Incentive_Amount FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc ON emp.Employee_ID=inc.Employee_Ref_ID)temp 
--CTE--
WITH CTE(First_Name,Incentive_Amount)
AS
(SELECT emp.First_Name,inc.Incentive_Amount FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc ON emp.Employee_ID=inc.Employee_Ref_ID)
SELECT * FROM CTE

--4)Select EmployeeName, ManagerName from the employee table.
--Derived--
SELECT * FROM
(SELECT emp.First_Name AS 'emp-FirstName',
	   mgr.First_Name AS 'mgr-FirstName'
	   FROM Employee AS emp,
	   Employee AS mgr
	   WHERE mgr.Employee_ID=emp.Manager_ID)temp
--CTE
WITH CTE(Emp_First_Name,Mgr_First_Name)
AS
(SELECT emp.First_Name AS 'emp-FirstName',
	   mgr.First_Name AS 'mgr-FirstName'
	   FROM Employee AS emp,
	   Employee AS mgr
	   WHERE mgr.Employee_ID=emp.Manager_ID)
SELECT * FROM CTE

--5)Select first_name, incentive amount from employee and incentives table for 
--  all employees even if they didn’t get incentives and set incentive amount as 0 
--  for those employees who didn’t get incentives.
--Derived--
SELECT * FROM
(SELECT emp.First_Name ,ISNULL(inc.Incentive_Amount,0) AS 'inc-Incentive_Amount'
FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc
ON emp.Employee_ID=inc.Employee_Ref_ID)temp
--CTE
WITH CTE(emp_FirstName,inc_Incentive_Amount)
AS
(SELECT emp.First_Name ,ISNULL(inc.Incentive_Amount,0) AS 'inc-Incentive_Amount'
FROM Employee AS emp 
LEFT OUTER JOIN Incentives AS inc
ON emp.Employee_ID=inc.Employee_Ref_ID)
SELECT * FROM CTE