--Day 4 Tasks
--task1-Write a query to rank employees based on their salary for a month
WITH CTE AS (
SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) Ranks,* FROM Employees)
SELECT * FROM CTE


--task2-Select 4th Highest salary from employee table using ranking function
WITH temp AS (
SELECT RANK() OVER (ORDER BY Salary DESC) TopSalary,* FROM Employees) 
SELECT * FROM temp WHERE TopSalary=4


--task3-Get department, total salary with respect to a department from employee table.
WITH CTE AS (
 SELECT D.DepartmentName, SUM(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName))
SELECT * FROM CTE


--task4-Get department, total salary with respect to a department from employee table order by total salary descending
WITH CTE AS (
SELECT D.DepartmentName, SUM(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) )
SELECT * FROM CTE ORDER BY Salary DESC


--task5-Get department wise maximum salary from employee table order by salary ascending
WITH CTE AS (
SELECT D.DepartmentName, MAX(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) )
SELECT * FROM CTE ORDER BY Salary ASC


--task6-Get department wise minimum salary from employee table order by salary ascending
WITH CTE AS (
SELECT D.DepartmentName, MIN(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName)  )
SELECT * FROM CTE ORDER BY Salary ASC


--task7-Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH CTE AS (
SELECT D.DepartmentName, SUM(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) HAVING  SUM(E.Salary)>50000)
SELECT * FROM CTE  ORDER BY Salary ASC 

--Day 5 Tasks
--task1-Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

WITH CTE(FirstName,Difference) AS (
SELECT FirstName,DATEDIFF(DAY,JoiningDate,IncentiveDate) AS 'Difference' FROM Employee E inner join Incentives Em on E.EmployeeID = Em.EmployeeRefID )
SELECT * FROM CTE

--task2-Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
WITH CTE(FirstName,IncentiveAmount) AS (
SELECT FirstName,IncentiveAmount FROM Employee E INNER JOIN Incentives I ON E.EmployeeID=I.EmployeeRefID AND IncentiveAmount >3000 )
SELECT * FROM CTE


--task3-Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
WITH CTE(FirstName,IncentiveAmount) AS (
SELECT FirstName, IncentiveAmount
FROM Employee E LEFT JOIN Incentives I 
     ON E.EmployeeID=I.EmployeeRefID)
SELECT * FROM CTE


--task4-Select EmployeeName, ManagerName from the employee table.
WITH CTE(EmployeeName,FirstName) AS (
SELECT E.FirstName AS EmployeeName, E2.FirstName FROM Employee E LEFT JOIN Employee E2 ON E.Manager_ID = E2.EmployeeID)
SELECT * FROM CTE

--task5-Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
WITH CTE(EmployeeName,FirstName) AS (
SELECT FirstName, ISNULL(IncentiveAmount,0) FROM Employee E left join Incentives I ON E.EmployeeID = I.EmployeeRefID)
SELECT * FROM CTE
