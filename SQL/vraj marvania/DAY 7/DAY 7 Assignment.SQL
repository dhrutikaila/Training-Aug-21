-->Convert Day4 and Day5 Exercises with CTE and Derived Table.

--DAY-4

--1-Write a query to rank employees based on their salary for a month

    --CTE 

		WITH Emp
		AS(
		   SELECT Dense_rank() OVER(ORDER BY Salary )[Rank],* from Employees 
		   )
		SELECT * FROM Emp
		 
	--Derived Table

	    SELECT * FROM (SELECT Dense_rank() OVER(ORDER BY Salary )[Rank],* from Employees )TEMP

--2-SELECT 4th Highest salary from employee table using ranking function
 	
	--CTE

		WITH  employee
		AS(
			(SELECT  *,Dense_rank() OVER(ORDER BY Salary desc)[IDSalary] 
			from Employees) 	
		)
		SELECT * FROM employee where IDSalary=4

	--Derived Table

		SELECT * from(SELECT  *,Dense_rank() 
					OVER(ORDER BY Salary desc)[IDSalary] from Employees
					)temp
		where IDSalary=4

	
--3-Get department, total salary with respect to a department from employee table.
	
	--CTE

		WITH  Department
		AS(
			SELECT DepartmentID,SUM(Salary) AS Salary
			FROM Employees
			GROUP BY DepartmentID
		)
			SELECT * FROM Department

	--Derived Table

		SELECT * FROM ( SELECT DepartmentID,SUM(Salary) AS Salary
						FROM Employees
						GROUP BY DepartmentID) TEMP


--4-Get department, total salary with respect to a department from employee table order by total salary descending

	--CTE

		WITH  employee
		AS(
			SELECT DepartmentID,SUM(Salary)  AS Salary
			FROM Employees 
			GROUP BY DepartmentID
		)
		SELECT * FROM employee 	ORDER BY Salary DESC

	--Derived Table

		SELECT * FROM (SELECT DepartmentID,SUM(Salary)  AS Salary
		FROM Employees 
		GROUP BY DepartmentID)TEMP
		ORDER BY Salary DESC

--5-Get department wise maximum salary from employee table order by salary ascending

	--CTE

		WITH  Details
		AS(SELECT DepartmentID,MAX(Salary) AS Salary  
				FROM Employees 
				GROUP BY DepartmentID)
		SELECT * FROM Details ORDER BY Salary ASC

	--Derived Table

		SELECT * FROM (SELECT DepartmentID,MAX(Salary) AS Salary  
		FROM Employees 
		GROUP BY DepartmentID)TEMP
		ORDER BY Salary ASC



--6-Get department wise minimum salary from employee table order by salary ascending

	--CTE

		WITH  employee
		AS(
				SELECT DepartmentID,MIN(Salary) AS Salary  
				FROM Employees 
				GROUP BY DepartmentID)
		SELECT * FROM employee ORDER BY Salary ASC

	--Derived Table

		SELECT * FROM (SELECT DepartmentID,MIN(Salary) AS Salary  
		FROM Employees 
		GROUP BY DepartmentID)TEMP
		ORDER BY Salary ASC
	

--7-SELECT department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

	--CTE

		 WITH  employee
		 AS(
				SELECT DepartmentID,SUM(Salary) AS Salary  
				FROM Employees 
				GROUP BY  DepartmentID 
				HAVING SUM(Salary)>50000)
		SELECT * FROM employee ORDER BY Salary DESC    
		
    --Derived Table

		SELECT * FROM (SELECT DepartmentID,SUM(Salary) AS Salary  
		FROM Employees 
		GROUP BY  DepartmentID 
		HAVING SUM(Salary)>50000)TEMP 
		ORDER BY Salary DESC   


____________________________________________________________________________________
--DAY 5
____________________________________________________________________________________
--1.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
		
	--CTE

		WITH  DIFFDATE
		AS(
					SELECT DATEDIFF(DAY,E.JOINING_DATE,I.INCENTIVE_DATE) AS DATEDIFF_IN_DAY 
					FROM Employee E  INNER JOIN  Incentives I ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
		)
		SELECT * FROM DIFFDATE

	--Derived Table

        SELECT * FROM (SELECT DATEDIFF(DAY,E.JOINING_DATE,I.INCENTIVE_DATE) AS DATEDIFF_IN_DAY 
			         FROM Employee E  INNER JOIN  Incentives I ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID)TEMP

-- 2.SELECT first_name, incentive amount from employee and incentives 
--  table for those employees who have incentives and incentive amount
--  greater than 3000

    --CTE

		WITH  Greaterinc
		AS(
				SELECT E.FIRST_NAME ,I.INCENTIVE_AMOUNT FROM Employee E INNER JOIN Incentives I 
	   			ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
				WHERE I.INCENTIVE_AMOUNT>3000
			)
		SELECT * FROM Greaterinc

	--Derived Table

		SELECT * FROM (SELECT E.FIRST_NAME ,I.INCENTIVE_AMOUNT FROM Employee E INNER JOIN Incentives I 
	   			ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
				WHERE I.INCENTIVE_AMOUNT>3000)TEMP

-- 3. SELECT first_name, incentive amount from employee
--  and incentives table for all employees even if they didn’t get incentives.
		
	--CTE
		
		WITH  Details
		AS(
				SELECT  E.FIRST_NAME ,I.INCENTIVE_AMOUNT FROM Employee E LEFT OUTER JOIN Incentives I 
				ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
		 )
		SELECT * FROM Details

	--Derived Table

		SELECT * FROM (SELECT  E.FIRST_NAME ,I.INCENTIVE_AMOUNT FROM Employee E LEFT OUTER JOIN Incentives I 
				ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID)TEMP

-- 4. SELECT EmployeeName, ManagerName from the employee table.
        
	--CTE

		WITH EMP_MNG
		AS(
			SELECT I.FIRST_NAME AS EmployeeName ,E.FIRST_NAME AS ManagerName 
			FROM Employee E ,Employee i  WHERE E.EMPLOYEE_ID=I.MANAGER_ID
		   )
		SELECT * FROM EMP_MNG

    --Derived Table

		SELECT * FROM (SELECT I.FIRST_NAME AS EmployeeName ,E.FIRST_NAME AS ManagerName 
	                 	FROM Employee E ,Employee i  
						WHERE E.EMPLOYEE_ID=I.MANAGER_ID)TEMP

-- 5. SELECT first_name, incentive amount from employee and incentives
--  table for all employees even if they didn’t get incentives and set
--  incentive amount as 0 for those employees who didn’t get incentives.
 
    --CTE

		WITH  incentive(NAME,AMOUNT)
		AS(
			   SELECT  E.FIRST_NAME , ISNULL(I.INCENTIVE_AMOUNT,0) 
			   FROM Employee E LEFT OUTER JOIN Incentives I 
  			   ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID
			   )
		SELECT * FROM incentive

	--Derived Table
 
		SELECT * FROM(SELECT  E.FIRST_NAME , ISNULL(I.INCENTIVE_AMOUNT,0) AS[incentive amount]
			   FROM Employee E LEFT OUTER JOIN Incentives I 
  			   ON I.EMPLOYEE_REF_ID = E.EMPLOYEE_ID)TEMP
