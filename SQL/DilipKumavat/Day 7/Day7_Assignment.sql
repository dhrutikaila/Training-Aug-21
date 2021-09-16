Use rxweb_day2

--- day 4 query 1  Write a query to rank employees based on their salary for a month ---
SELECT *  FROM (SELECT  (DENSE_RANK() OVER(ORDER BY SALARY DESC))[tbl],* FROM Employees) Temp_Table

WITH CTE (EmpId,Sal,ranked) 
AS (SELECT EmployeeID,Salary,(DENSE_RANK() OVER(ORDER BY SALARY DESC))[tbl] FROM Employees)
SELECT * FROM CTE

--- day 4 query 2 Select 4th Highest salary from employee table using ranking function ---
SELECT FirstName,LastName,tbl FROM (SELECT (DENSE_RANK() OVER(ORDER BY SALARY DESC))[tbl],FirstName,LastName FROM Employees) Temp_Table WHERE tbl = 4

WITH CTE(tbl,FirstName,LastName)
AS (SELECT (DENSE_RANK() OVER(ORDER BY SALARY DESC))[tbl],FirstName,LastName FROM Employees)
SELECT * FROM CTE WHERE tbl = 4

---day 4 query 3 Get department, total salary with respect to a department from employee table. ---
SELECT * FROM (SELECT SUM(Salary) AS Total_Salary,DepartmentID FROM Employees GROUP BY DepartmentID) Temp_Table

WITH CTE 
AS (SELECT SUM(Salary) AS Total_Salary,DepartmentID FROM Employees GROUP BY DepartmentID)
SELECT * FROM CTE

---day 4 query 4 Get department, total salary with respect to a department from employee table order by total salary descending ---
SELECT * FROM(SELECT SUM(Salary) AS Total_Salary,DepartmentID FROM Employees GROUP BY DepartmentID) Temp_Table ORDER BY Total_Salary DESC

WITH CTE
AS (SELECT SUM(Salary) AS Total_Salary,DepartmentID FROM Employees GROUP BY DepartmentID)
SELECT * FROM CTE ORDER BY Total_Salary

---day 4 query 5 Get department wise maximum salary from employee table order by salary ascending. ---
SELECT * FROM (SELECT MAX(Salary) AS Max_Salary,DepartmentID FROM Employees GROUP BY DepartmentID) Temp_Table ORDER BY Max_Salary ASC

WITH CTE 
AS (SELECT MAX(Salary) AS Max_Salary,DepartmentID FROM Employees GROUP BY DepartmentID)
SELECT * FROM CTE ORDER BY Max_Salary

---day4 query 6 Get department wise minimum salary from employee table order by salary ascending---
SELECT * FROM (SELECT MIN(Salary) AS Min_Salary,DepartmentID FROM Employees GROUP BY DepartmentID) Temp_Table ORDER BY Min_Salary ASC

WITH CTE 
AS (SELECT MIN(Salary) AS Min_Salary,DepartmentID FROM Employees GROUP BY DepartmentID)
SELECT * FROM CTE ORDER BY Min_Salary ASC 

---day4 query 7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending.---
SELECT * FROM (SELECT SUM(Salary) AS Total_Salary,DepartmentID FROM Employees GROUP BY DepartmentID) Temp_Table WHERE Total_Salary > 50000 ORDER BY Total_Salary DESC

WITH CTE 
AS (SELECT SUM(Salary) AS Total_Salary,DepartmentID From Employees GROUP BY DepartmentID)
SELECT * FROM CTE WHERE Total_Salary > 50000 ORDER BY Total_Salary DESC


---day 5---
USE rxweb_day5

---query 1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table ---
SELECT * FROM (SELECT emp.Joining_Date AS J_DATE,inc.Incentive_Date AS I_DATE,DATEDIFF(DD,emp.Joining_Date,inc.Incentive_Date) AS DateDifference FROM Employee emp JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID) Temp_Table

WITH CTE
AS (SELECT emp.Joining_Date AS J_DATE,inc.Incentive_Date AS I_DATE,DATEDIFF(DD,emp.Joining_Date,inc.Incentive_Date) AS DateDifference FROM Employee emp JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID) 
SELECT * FROM CTE

---query 2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000---
SELECT * FROM (SELECT emp.First_Name,inc.Incentive_Amount FROM Employee emp JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID WHERE inc.Incentive_Amount >3000 ) Temp_Table

WITH CTE 
AS (SELECT emp.First_Name,inc.Incentive_Amount FROM Employee emp JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID WHERE inc.Incentive_Amount > 3000)
SELECT * FROM CTE

---query 3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.---
SELECT * FROM (SELECT emp.First_Name,inc.Incentive_Amount FROM Employee emp LEFT OUTER JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID) Temp_Table

WITH CTE
AS (SELECT emp.First_Name,inc.Incentive_Amount FROM Employee emp LEFT OUTER JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID)
SELECT * FROM CTE

---query 4 Select EmployeeName, ManagerName from the employee table.---
SELECT * FROM (SELECT emp.First_Name AS Employee_Name,emp2.First_Name AS Manager_Name FROM Employee emp JOIN Employee emp2 ON emp.Manager_ID = emp2.Employee_ID) Temp_Table

WITH CTE 
AS (SELECT emp.First_Name AS Employee_Name,emp2.First_Name AS Manager_Name FROM Employee emp JOIN Employee emp2 ON emp.Manager_ID = emp2.Employee_ID)
SELECT * FROM CTE 


----query extra Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.---

SELECT * FROM 
(SELECT emp.First_Name,ISNULL(inc.Incentive_Amount,0) AS amt FROM Employee emp LEFT OUTER JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID) Temp_Table

WITH CTE 
AS (SELECT emp.First_Name,ISNULL(inc.Incentive_Amount,0) AS amt FROM Employee emp LEFT OUTER JOIN Incentives inc ON emp.Employee_ID = inc.Employee_Ref_ID)
SELECT * FROM CTE