-- DAY4 Assignment With CTE & Derived Tables

-- 1. Write a query to rank employees based on their salary for a month. 

SELECT * FROM (SELECT (DENSE_RANK() OVER(ORDER BY Salary DESC))drank,EmployeeID,Salary FROM employees)temp;

WITH cte(drank,EmployeeID,Salary) 
AS (SELECT EmployeeID,Salary, (DENSE_RANK()  OVER(ORDER BY Salary DESC) )drank FROM employees)
SELECT * FROM cte;

-- 2. Select 4th Highest salary from employee table using ranking function. 

SELECT * FROM (SELECT EmployeeID,Salary,(DENSE_RANK() OVER(ORDER BY Salary DESC))drank FROM employees)temp WHERE drank = 4;

WITH cte(EmployeeID,Salary,drank) AS
(SELECT EmployeeID,Salary,(DENSE_RANK() OVER(ORDER BY Salary DESC))drank FROM employees)
SELECT * FROM cte WHERE drank = 4;

-- 3. Get department, total salary with respect to a department from employee table. 
SELECT * FROM (SELECT DepartmentID,SUM(Salary) FROM employees GROUP BY DepartmentID)temp

WITH cte(DepartmentID,TotalSalary) 
AS (SELECT DepartmentID,SUM(Salary) FROM employees GROUP BY DepartmentID)
SELECT * FROM cte;

-- 4. Get department, total salary with respect to a department from employee table order by total salary descending 

SELECT * FROM (SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID)temp ORDER BY TotalSalary DESC;

WITH cte(DepartmentID,TotalSalary) AS (SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID) SELECT * FROM cte ORDER BY TotalSalary DESC;

-- 5. Get department wise maximum salary from employee table order by salary ascending

SELECT * FROM (SELECT DepartmentID,MAX(Salary) AS MaxSalary FROM employees GROUP BY DepartmentID)temp ORDER BY MaxSalary ASC;

WITH cte(DepartmentID,MaxSalary)
AS (SELECT DepartmentID,MAX(Salary) AS MaxSalary FROM employees GROUP BY DepartmentID) 
SELECT * FROM cte ORDER BY MaxSalary ASC;

-- 6. Get department wise minimum salary from employee table order by salary ascending

SELECT * FROM (SELECT DepartmentID,MIN(Salary) AS MinSalary FROM employees GROUP BY DepartmentID)temp ORDER BY MinSalary ASC;

WITH cte(DepartmentID,MinSalary)
AS (SELECT DepartmentID,MIN(Salary) AS MinSalary FROM employees GROUP BY DepartmentID)
SELECT * FROM  cte ORDER BY MinSalary ASC;

-- 7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

SELECT * FROM (SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID HAVING TotalSalary > 50000 )temp ORDER BY TotalSalary DESC;

WITH cte(DepartmentID,TotalSalary)
AS (SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM employees GROUP BY DepartmentID HAVING TotalSalary > 50000 ) 
SELECT * FROM cte ORDER BY TotalSalary DESC;



-- DAY5 Assignment With CTE & Derived Tables

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT * FROM (SELECT e.JOINING_DATE, i.INCENTIVE_DATE,DATEDIFF(i.INCENTIVE_DATE,e.JOINING_DATE) AS DateDiff FROM employee e INNER JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)temp;

WITH cte(JOINING_DATE,INCENTIVE_DATE,DateDiff)
AS (SELECT e.JOINING_DATE, i.INCENTIVE_DATE,DATEDIFF(i.INCENTIVE_DATE,e.JOINING_DATE) AS DateDiff FROM employee e INNER JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)
SELECT  * FROM cte; 

-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT * FROM (SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM employee e INNER JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID WHERE i.INCENTIVE_AMOUNT > 3000)temp;  

WITH cte(FIRST_NAME,INCENTIVE_AMOUNT) AS (SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM employee e INNER JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID ) SELECT * FROM cte WHERE INCENTIVE_AMOUNT > 3000;

-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT * FROM (SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM employee e LEFT JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)temp;

WITH cte(FIRST_NAME,INCENTIVE_AMOUNT)
AS (SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM employee e LEFT JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)
SELECT * FROM cte;

-- 4. Select EmployeeName, ManagerName from the employee table.

SELECT * FROM (SELECT CONCAT(e1.FIRST_NAME," ",e1.LAST_NAME) AS EmployeeName, CONCAT(e2.FIRST_NAME," ",e2.LAST_NAME) AS ManagerName FROM employee e1 JOIN employee e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID)temp;

WITH cte(EmployeeName,ManagerName)
AS(SELECT CONCAT(e1.FIRST_NAME," ",e1.LAST_NAME) AS EmployeeName, CONCAT(e2.FIRST_NAME," ",e2.LAST_NAME) AS ManagerName FROM employee e1 JOIN employee e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID)
SELECT * FROM cte;


-- 5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT * FROM (SELECT e.FIRST_NAME,IFNULL(i.INCENTIVE_AMOUNT,0) FROM employee e LEFT JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)temp;

WITH cte(FIRST_NAME,INCENTIVE_AMOUNT)
AS (SELECT e.FIRST_NAME,IFNULL(i.INCENTIVE_AMOUNT,0) FROM employee e LEFT JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)
SELECT * FROM cte;


