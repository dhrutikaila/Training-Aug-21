--Write a query to rank employees based on their salary for a month
	
SELECT * FROM (
          SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS [RANK],* 
		  FROM Employees)T

--Select 4th Highest salary from employee table using ranking function

SELECT * FROM (
        SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS [RANK],* 
		FROM Employees)T 
WHERE T.[RANK]=4 

--Get department, total salary with respect to a department from employee table.
  
 SELECT * FROM (
          SELECT DepartmentID
		       , SUM(Salary) 'Total_Salary' 
		  FROM Employees 
		  GROUP BY DepartmentID)T

--Get department, total salary with respect to a department from employee table order by total salary descending

SELECT * FROM (
        SELECT DepartmentID
		     , SUM(Salary) 'Total_Salary' 
		FROM Employees 
		GROUP BY DepartmentID)T 
ORDER BY T.Total_Salary DESC

--Get department wise maximum salary from employee table order by salary ascending

SELECT T.DepartmentID
     , MAX(T.Salary) 'Salary' 
FROM (
      SELECT DepartmentID
	       , Salary 
	  FROM Employees)T 
GROUP BY DepartmentID 
ORDER BY Salary ASC
   

--Get department wise minimum salary from employee table order by salary ascending

SELECT T.DepartmentID
     , MIN(T.Salary) 'Salary' 
FROM (
      SELECT DepartmentID
	       , Salary
	  FROM Employees)T
GROUP BY DepartmentID 
ORDER BY Salary ASC
   

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
	
SELECT * FROM (
             SELECT DepartmentID
			      , SUM(Salary) 'TotalSalary' 
			 FROM Employees 
			 GROUP BY DepartmentID)T
WHERE T.TotalSalary > 50000 
ORDER BY T.TotalSalary DESC
   

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT Employee_Name=(T.FIRST_NAME+' '+T.LAST_NAME)
     , Date_Difference=(T.JOINING_DATE-CAST(T.INCENTIVE_DATE AS DATETIME)) 
FROM(
     SELECT * FROM Employee E 
	 JOIN Incentives I
	 ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID)T 


--Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
   
SELECT T.FIRST_NAME
     , T.INCENTIVE_AMOUNT 
FROM (
      SELECT * FROM Employee E 
	  JOIN Incentives I
	  ON E.EMPLOYEE_ID= I.EMPLOYEE_REF_ID)T
WHERE T.INCENTIVE_AMOUNT > 3000
   

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT FIRST_NAME
     , INCENTIVE_AMOUNT 
FROM (
       SELECT * FROM Employee E
	   JOIN Incentives I
	   ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID)T 
                             

--Select EmployeeName, ManagerName from the employee table.
SELECT * FROM (
        SELECT Employee_Name=(E.FIRST_NAME+' '+E.LAST_NAME)
		     , Manager_Name=(M.FIRST_NAME+' '+M.LAST_NAME) 
FROM Employee E 
   JOIN Employee M
   ON E.MANAGER_ID=M.EMPLOYEE_ID) T

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives 
-- and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT T.FIRST_NAME
     , ISNULL(T.INCENTIVE_AMOUNT,0) 'INCENTIVE_AMOUNT'
FROM (
      SELECT * FROM Employees E 
	  JOIN Incentives I
	  ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID)T
   
