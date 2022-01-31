USE Ketan

------ USE OF DAY 4 ASSIGNMENT

-- 1. Write a query to rank employees based ON their salary for a month

WITH CTE_RANK(Drank,Salary)
AS
(
SELECT DENSE_RANK() OVER (ORDER BY Salary ) [Drank],Salary
FROM Employees
)
SELECT * FROM CTE_RANK ORDER BY Drank

--2.SELECT 4th Highest salary FROM employee table using ranking function

 WITH CTE_RANK4(Drank,salary)
 AS
(SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY SALARY  DESC) AS DRANK,Salary
FROM Employees)tmp WHERE DRANK=4)
SELECT * FROM CTE_RANK4

--3.Get department, total salary WITH respect to a department FROM employee table.

  WITH CTE_S(DepartmentID,salary)
 AS
  (SELECT DepartmentID,SUM(Salary) AS salary 
  FROM Employees GROUP BY DepartmentID)
  SELECT * FROM CTE_S 

--4.Get department, total salary WITH respect to a department FROM employee table ORDER BY total salary descending
   
   
 WITH CTE(Departmentid,salary)
AS
 (SELECT DepartmentID,SUM(salary) AS salary 
 FROM Employees GROUP BY DepartmentID )
 SELECT * FROM CTE ORDER BY salary DESC


-- 5.Get department wise maximum salary FROM employee table ORDER BY salary ascending

  WITH CTE_MAX(Departmentod,salary)
 AS
  (SELECT DepartmentID,MAX(Salary) AS salary FROM Employees
  GROUP BY DepartmentID ) 
  SELECT * FROM CTE_MAX ORDER BY salary

-- 6.Get department wise minimum salary FROM employee table ORDER BY salary ascending

   WITH CTE_MIN(Departmentod,salary)
  AS
   (SELECT DepartmentID,MAX(Salary) AS salary FROM Employees
   GROUP BY DepartmentID ) 
   SELECT * FROM CTE_MIN ORDER BY salary

--7.SELECT department, total salary WITH respect to a department FROM employee table WHERE total salary greater than 50000 ORDER BY TotalSalary descending
 
  WITH CTE(Departmentod,salary)
 AS
  (SELECT DepartmentID,SUM(Salary) AS salary FROM Employees
  GROUP BY DepartmentID ) 
  SELECT * FROM CTE WHERE salary>50000 ORDER BY salary DESC


  USE [JOIN ]

------- USE OF DAY 5 ASSIGNMENT 

---1.Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives table
   
   WITH CTE_DATE(Differenceofdate)
   AS
   (SELECT DATEDIFF(mONth,JOINING_DATE,INCENTIVE_DATE) 
   FROM Employee emp JOIN Incentives inc ON Emp.EMPLOYEE_ID=inc.EMPLOYEE_REF_ID)
   SELECT * FROM CTE_DATE

---2.SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000
  
   WITH CTE(firstname,amount)
    AS
   (SELECT emp.FIRST_NAME,inc.INCENTIVE_AMOUNT FROM Employee emp JOIN Incentives inc 
   ON emp.EMPLOYEE_ID=inc.EMPLOYEE_REF_ID )
    SELECT * FROM CTE WHERE amount>3000

---3.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives.

    WITH CTE(firstname,amount)
    AS
    (SELECT emp.FIRST_NAME,inc.INCENTIVE_AMOUNT FROM Employee emp LEFT JOIN Incentives inc 
    ON emp.EMPLOYEE_ID=inc.EMPLOYEE_REF_ID )
    SELECT * FROM CTE

---4.SELECT EmployeeName, ManagerName FROM the employee table.
 
  WITH CTE_NAME(EmployeeName,ManagerName)
  AS
  (SELECT emp.FIRST_NAME AS 'EmployeeName',mgr.FIRST_NAME AS 'ManagerName' 
  FROM Employee emp JOIN Employee mgr 
  ON emp.MANAGER_ID=mgr.EMPLOYEE_ID)
  SELECT * FROM CTE_NAME

---5. SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
 
     WITH CTE(firstname,amount)
     AS
     (SELECT emp.FIRST_NAME,ISNULL(inc.INCENTIVE_AMOUNT,0) 
	 FROM Employee emp LEFT JOIN Incentives inc 
     ON emp.EMPLOYEE_ID=inc.EMPLOYEE_REF_ID )
     SELECT * FROM CTE 
    