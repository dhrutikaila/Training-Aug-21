USE [Day12 (Batch)]

-- Assignment


---------------------------------------------------------------------------------------------------------

-- Batch
/*
Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from
employee table
*/

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY , 'Department' = CASE DEPARTMENT 
															WHEN 'Banking' THEN 'Bank Dept'
															WHEN 'Insurance' THEN 'Insurance Dept'
															WHEN 'Services' THEN 'Services Dept'
															ELSE DEPARTMENT
															END 
													

---------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------

-- Day4 

/*
Write a query to rank employees based on their salary for a month
Select 4th Highest salary from employee table using ranking function
Get department, total salary with respect to a department from employee table.
Get department, total salary with respect to a department from employee table order by total salary descending
Get department wise maximum salary from employee table order by salary ascending
Get department wise minimum salary from employee table order by salary ascending
Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
*/




-- Day5

/*
Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
Select EmployeeName, ManagerName from the employee table.
*/

---------------------------------------------------------------------------------------------------------




-- Day4
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Day4  (1) [Write a query to rank employees based on their salary for a month] 

--with CTE
WITH cte1(Rank,Salary,Name) AS
(SELECT RANK() OVER(ORDER BY Salary DESC) , Salary , CONCAT(FirstName, ' ',LastName) as 'Name' FROM Employees )
SELECT Rank,Salary, Name FROM cte1

--with derived

SELECT * 
FROM 
( SELECT RANK() OVER(ORDER BY Salary DESC) as 'Rank' , Salary , CONCAT(FirstName, ' ',LastName) as 'Name' FROM Employees ) as tbl1


--Day4  (2) [Select 4th Highest salary from employee table using ranking function]

--with CTE
WITH cte2(Rank,Salary) AS
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) as 'Salary rank' , Salary FROM Employee)
SELECT TOP 1 Rank,Salary FROM cte2 WHERE cte2.Rank = 4

--with derived

SELECT * 
FROM 
( SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) as 'Salary rank' , Salary FROM Employee) as tbl1
WHERE [Salary rank] = 4


--Day4  (3) [Get department, total salary with respect to a department from employee table.]

--with CTE
WITH cte3 AS
(SELECT Department  , SUM(Salary) as 'Total salary' FROM Employee GROUP BY Department 
 )
SELECT * FROM cte3

--with derived

SELECT * 
FROM 
( SELECT Department  , SUM(Salary) as 'Total salary' FROM Employee GROUP BY Department) as tbl1


--Day4  (4) [Get department, total salary with respect to a department from employee table order by total salary descending]

--with CTE
WITH cte4 AS
(SELECT Department , SUM(Salary) [TotalSalary] FROM Employee GROUP BY Department)
SELECT * FROM cte4 ORDER BY cte4.TotalSalary DESC

-- with derived
SELECT * 
FROM 
( SELECT Department , SUM(Salary) [TotalSalary] FROM Employee GROUP BY Department) as tbl1
ORDER BY TotalSalary DESC



--Day4  (5)  [Get department wise maximum salary from employee table order by salary ascending]

--with CTE
WITH cte5 AS
(SELECT MAX(Salary) 'MaxSalary' , Department FROM Employee  GROUP BY Department 
 )
SELECT * FROM cte5 ORDER BY cte5.MaxSalary ASC

-- with derived
SELECT * 
FROM 
( SELECT MAX(Salary) 'MaxSalary' , Department FROM Employee  GROUP BY Department) as tbl1
ORDER BY MaxSalary ASC



--Day4  (6) [Get department wise minimum salary from employee table order by salary ascending]

--with CTE
WITH cte6 AS
(SELECT MIN(Salary) 'MinSalary' , Department FROM Employee  GROUP BY Department)
SELECT * FROM cte6 ORDER bY cte6.MinSalary ASC

-- with derived
SELECT * 
FROM 
( SELECT MIN(Salary) 'MinSalary' , Department FROM Employee  GROUP BY Department) as tbl1
ORDER BY MinSalary ASC



--Day4  (7)  [Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending]


--with CTE
WITH cte7 AS
(SELECT Department , SUM(Salary) as 'TotalSalary' FROM Employee GROUP BY Department HAVING SUM(Salary) >50000)
SELECT * FROM cte7 ORDER bY cte7.TotalSalary DESC


-- with derived
SELECT * 
FROM 
( SELECT Department , SUM(Salary) as 'TotalSalary' FROM Employee GROUP BY Department HAVING SUM(Salary) >50000) as tbl1
ORDER BY TotalSalary DESC

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






-- Day5 
	
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

USE [Day9 (JOIN)]

-- Day 5 (1)  [Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table]

-- WITH CTE


WITH cte1 AS
(SELECT DATEDIFF(MM,JOINING_DATE,INCENTIVE_DATE) AS 'Difference in Month' FROM Employee AS e
JOIN Incentives AS i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)
SELECT * FROM cte1


-- WITH derived

SELECT *
FROM 
(SELECT DATEDIFF(MM,JOINING_DATE,INCENTIVE_DATE) AS 'Difference in Month' FROM Employee AS e
JOIN Incentives AS i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID) AS tbl1







-- Day 5 (2)  [Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000]

-- WITH CTE

WITH cte2 AS
(SELECT e.FIRST_NAME , i.INCENTIVE_AMOUNT FROM Employee AS e
JOIN Incentives AS i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
WHERE i.INCENTIVE_AMOUNT > 3000)
SELECT * FROM cte2


-- WITH derived

SELECT *
FROM 
(SELECT e.FIRST_NAME , i.INCENTIVE_AMOUNT FROM Employee AS e
JOIN Incentives AS i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
WHERE i.INCENTIVE_AMOUNT > 3000) AS tbl1





-- Day 5 (3)  [Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.]

-- WITH CTE
WITH cte3 AS
(SELECT e.FIRST_NAME , i.INCENTIVE_AMOUNT FROM Employee AS e
LEFT JOIN Incentives AS i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)
SELECT * FROM cte3


-- WITH derived

SELECT *
FROM 
(SELECT e.FIRST_NAME , i.INCENTIVE_AMOUNT FROM Employee AS e
LEFT JOIN Incentives AS i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID) AS tbl1






-- Day 5 (4)  [Select EmployeeName, ManagerName from the employee table.]

-- WITH CTE
WITH cte4 As
(SELECT c.FIRST_NAME AS 'EmployeeName'  ,o.FIRST_NAME AS 'ManagerName' FROM Employee AS o
JOIN Employee AS c
ON o.EMPLOYEE_ID = c.MANAGER_ID)
SELECT * FROM cte4

-- WITH derived

SELECT *
FROM 
(SELECT c.FIRST_NAME AS 'EmployeeName'  ,o.FIRST_NAME AS 'ManagerName' FROM Employee AS o
JOIN Employee AS c
ON o.EMPLOYEE_ID = c.MANAGER_ID) AS tbl1


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
