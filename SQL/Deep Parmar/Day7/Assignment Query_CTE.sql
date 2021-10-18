-- Day4 and Day5 Exercises with CTE(Common Table Expression)

-- Day4: 
--Assignment:

--[1] Write a query to rank employees based on their salary for a month
		
	  WITH EMP_CTE
	  AS
	  (SELECT * FROM Employees)
	  SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS [RANK],Salary FROM EMP_CTE

	  --ANOTHER WAY:
	  WITH EMP_CTE([RANK],Employee_Name,Salary)
	  AS
	  (SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS [RANK],[NAME]=(FirstName+SPACE(1)+LastName),Salary FROM Employees)
	  SELECT * FROM EMP_CTE

--[2] Select 4th Highest salary from employee table using ranking function

	  WITH EMP_CTE([RANK],Employee_Name,Salary)
	  AS
	  (SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS [RANK],[NAME]=(FirstName+SPACE(1)+LastName),Salary FROM Employees)
	  SELECT * FROM EMP_CTE WHERE [RANK]=4

--[3] Get department, total salary with respect to a department from employee table.

	  WITH EMP_CTE(DepartmentID,Salary)
	  AS
	  (SELECT DepartmentID,Salary FROM Employees)
	  SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM EMP_CTE GROUP BY DepartmentID

--[4] Get department, total salary with respect to a department from employee table order by total salary descending

	  WITH EMP_CTE(DepartmentID,Total_Salary)
	  AS
	  (SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM Employees GROUP BY DepartmentID)
	  SELECT DepartmentID,Total_Salary FROM EMP_CTE ORDER BY Total_Salary DESC



--[5] Get department wise maximum salary from employee table order by salary ascending

	  WITH EMP_CTE(DepartmentID,Salary)
	  AS
	  (SELECT DepartmentID,Salary FROM Employees)
	  SELECT DepartmentID,MAX(Salary) AS Maximum_Salary FROM EMP_CTE GROUP BY DepartmentID ORDER BY Maximum_Salary ASC

--[6] Get department wise minimum salary from employee table order by salary ascending

	  WITH EMP_CTE(DepartmentID,Minimum_Salary)
	  AS
	  (SELECT DepartmentID,MIN(Salary) FROM Employees GROUP BY DepartmentID)
	  SELECT DepartmentID,Minimum_Salary FROM EMP_CTE ORDER BY Minimum_Salary ASC

--[7] Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

	  WITH EMP_CTE(DepartmentID,TotalSalary)
	  AS
	  (SELECT DepartmentID,SUM(Salary) FROM Employees GROUP BY DepartmentID)
	  SELECT DepartmentID,TotalSalary FROM EMP_CTE WHERE TotalSalary > 50000 ORDER BY TotalSalary DESC
--------------------------------------------------------------------------------------------------------------
--Day5:
--Assignment:


--[1] Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

	  WITH EMP_CTE(Employee_Name,JOINING_DATE,INCENTIVE_DATE)
	  AS
	  (
	  SELECT (EMP.FIRST_NAME+SPACE(1)+EMP.LAST_NAME) AS [NAME],EMP.JOINING_DATE,CAST(INS.INCENTIVE_DATE AS DATETIME) FROM Employee AS EMP
	  JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID
	  )
	  SELECT Employee_Name,Date_Difference=(JOINING_DATE-INCENTIVE_DATE) FROM EMP_CTE

	  

--[2] Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

	  WITH EMP_CTC
	  AS
	  (SELECT FIRST_NAME,INS.INCENTIVE_AMOUNT FROM Employee AS EMP 
	  JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID)
	  SELECT * FROM EMP_CTC WHERE INCENTIVE_AMOUNT > 3000

--[3] Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

	  WITH EMP_CTC(FIRST_NAME,INCENTIVE_AMOUNT)
	  AS
	  (
	  SELECT EMP.FIRST_NAME,INS.INCENTIVE_AMOUNT FROM Employee AS EMP 
	  LEFT OUTER JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID
	  )
	  SELECT * FROM EMP_CTC

--[4] Select EmployeeName, ManagerName from the employee table.

	  WITH EMP_CTC(EmployeeName,ManagerName)
	  AS
	  (
	  SELECT [EmployeeName]=(E1.FIRST_NAME+' '+E1.LAST_NAME),[ManagerName]=(E2.FIRST_NAME+' '+E2.LAST_NAME) FROM Employee AS E1 
	  JOIN Employee AS E2 ON E1.MANAGER_ID=E2.EMPLOYEE_ID
	  )
	  SELECT * FROM EMP_CTC

	  --ANOTHER WAY:

	  WITH EMP_CTC(EmployeeName,ManagerName)
	  AS
	  (
	  SELECT [EmployeeName]=(E1.FIRST_NAME+' '+E1.LAST_NAME),[ManagerName]=(E2.FIRST_NAME+' '+E2.LAST_NAME) FROM Employee AS E1 
	  LEFT OUTER JOIN Employee AS E2 ON E1.MANAGER_ID=E2.EMPLOYEE_ID
	  )
	  SELECT * FROM EMP_CTC

--[5] Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives 
--    and set incentive amount as 0 for those employees who didn’t get incentives.

	  WITH EMP_CTC(FIRST_NAME,INCENTIVE_AMOUNT)
	  AS
	  (
	  SELECT EMP.FIRST_NAME,INS.INCENTIVE_AMOUNT FROM Employee AS EMP
	  LEFT OUTER JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID
	  )
	  SELECT FIRST_NAME,ISNULL(INCENTIVE_AMOUNT,0) AS INCENTIVE_AMOUNT FROM EMP_CTC
