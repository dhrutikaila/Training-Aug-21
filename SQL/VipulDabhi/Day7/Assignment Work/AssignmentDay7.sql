                                   --WITH CTE AND Derived table
--Day4 Assignment Quries With CTE And Derived table

--Write a query to rank employees based on their salary for a month
WITH Employee_CTE
AS
(SELECT EmployeeID, Salary,RANK() OVER (ORDER BY Salary ASC) AS Rank FROM Employees)

SELECT * FROM Employee_CTE

--Select 4th Highest salary from employee table using ranking function
SELECT * FROM (SELECT *,DENSE_RANK() OVER ( ORDER BY Salary DESC ) 'SalaryRank' 
FROM Employees ) TEMP WHERE SalaryRank = '4'

--Get department, total salary with respect to a department from employee table.
WITH DepartmentWiseOfSumSalary_CTE
AS
(SELECT DepartmentID,SUM(Salary) SumOfSalary FROM Employees GROUP BY DepartmentID)

SELECT * FROM DepartmentWiseOfSumSalary_CTE

--Get department, total salary with respect to a department from employee table order by total salary descending
SELECT * FROM (SELECT DepartmentID,SUM(Salary) AS SumOfSalary FROM Employees GROUP BY DepartmentID ) TEMP ORDER BY SumOfSalary DESC 

--Get department wise maximum salary from employee table order by salary ascending
SELECT * FROM (SELECT DepartmentID,MAX(Salary) MaxOfSalary FROM Employees GROUP BY DepartmentID) TEMP
ORDER BY MaxOfSalary

--Get department wise minimum salary from employee table order by salary ascending
WITH MinOfSalaryOrderByDept_CTE
AS
(SELECT DepartmentID,MIN(Salary)MinOfSalary FROM Employees GROUP BY DepartmentID)

SELECT * FROM MinOfSalaryOrderByDept_CTE ORDER BY MinOfSalary

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT * FROM (SELECT DepartmentID,SUM(Salary)SumOfSalary FROM Employees GROUP BY DepartmentID) TEMP 
WHERE SumOfSalary >= 50000 ORDER BY SumOfSalary DESC 


--Day5 ASSIGNMENT QUERIES With CTE And Derived table

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH DateDiff_CTE
AS
(SELECT  EmployeeID,DATEDIFF(DD,JoiningDate,Incentive_Date) AS DateDiff FROM Employee JOIN Incentives ON EmployeeID = Employee_Ref_Id)

SELECT * FROM DateDiff_CTE

--select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
WITH IncAmotCondition_CTE
AS
(SELECT FirstName,Incentive_Amount FROM Employee JOIN Incentives ON EmployeeID = Employee_Ref_Id) 

SELECT * FROM IncAmotCondition_CTE WHERE Incentive_Amount > 3000

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT * FROM (SELECT FirstName,Incentive_Amount FROM  Employee LEFT JOIN Incentives ON EmployeeID = Employee_Ref_ID) 
AS TEMP 

--Select EmployeeName, ManagerName from the employee table.

SELECT * FROM (SELECT T1.FirstName AS FirstNameT1,T2.FirstName AS FirstnameT2 FROM  Employee T1, Employee T2) 
AS TEMP
WHERE FirstNameT1 = FirstnameT2

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
WITH ISNULL_CTE
AS
(SELECT FirstName,ISNULL(Incentive_Amount,0) AS Incentive_Amount_Update FROM  Employee LEFT JOIN Incentives ON EmployeeID = Employee_Ref_ID )

SELECT * FROM ISNULL_CTE

