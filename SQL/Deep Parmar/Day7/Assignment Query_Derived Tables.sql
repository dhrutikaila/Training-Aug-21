-- Day4 and Day5 Exercises with Derived Tables

-- Day4: 
--Assignment:

--[1] Write a query to rank employees based on their salary for a month
	
	  SELECT * FROM (SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS [RANK],* FROM Employees) AS EMP

--[2] Select 4th Highest salary from employee table using ranking function

	  SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS [RANK],* FROM Employees) EMP WHERE EMP.[RANK]=4 

--[3] Get department, total salary with respect to a department from employee table.
		
      SELECT * FROM (SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM Employees GROUP BY DepartmentID)EMP

--[4] Get department, total salary with respect to a department from employee table order by total salary descending

	  SELECT * FROM (SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM Employees GROUP BY DepartmentID)EMP ORDER BY EMP.Total_Salary DESC

--[5] Get department wise maximum salary from employee table order by salary ascending

	  SELECT EMP.DepartmentID,MAX(EMP.Salary) AS Maximum_Salary FROM (SELECT DepartmentID,Salary FROM Employees)EMP GROUP BY DepartmentID ORDER BY Maximum_Salary ASC
	  

--[6] Get department wise minimum salary from employee table order by salary ascending

	  SELECT EMP.DepartmentID,MIN(EMP.Salary) AS Maximum_Salary FROM (SELECT DepartmentID,Salary FROM Employees)EMP GROUP BY DepartmentID ORDER BY Maximum_Salary ASC
	  

--[7] Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
	
	  SELECT * FROM (SELECT DepartmentID,SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentID) EMP WHERE EMP.TotalSalary > 50000 ORDER BY EMP.TotalSalary DESC
	  

--------------------------------------------------------------------------------------------------------------
--Day5:
--Assignment:


--[1] Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

	 SELECT Employee_Name=(TEMP.FIRST_NAME+SPACE(0)+TEMP.LAST_NAME),Date_Difference=(TEMP.JOINING_DATE-CAST(TEMP.INCENTIVE_DATE AS DATETIME)) FROM 
	 (SELECT * FROM Employee AS EMP JOIN Incentives AS INC ON EMP.EMPLOYEE_ID=INC.EMPLOYEE_REF_ID)TEMP  	


--[2] Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
	  
	  SELECT TEMP.FIRST_NAME,TEMP.INCENTIVE_AMOUNT FROM (SELECT * FROM Employee AS EMP JOIN Incentives AS INS ON EMP.EMPLOYEE_ID= INS.EMPLOYEE_REF_ID)TEMP WHERE TEMP.INCENTIVE_AMOUNT > 3000
	  

--[3] Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

	  SELECT FIRST_NAME,INCENTIVE_AMOUNT FROM (SELECT * FROM Employee AS EMP LEFT OUTER JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID)TEMP 
	                            

--[4] Select EmployeeName, ManagerName from the employee table.

	  SELECT * FROM (SELECT Employee_Name=(EMP.FIRST_NAME+SPACE(1)+EMP.LAST_NAME),Manager_Name=(MGR.FIRST_NAME+SPACE(1)+MGR.LAST_NAME) FROM Employee AS EMP JOIN Employee AS MGR ON EMP.MANAGER_ID=MGR.EMPLOYEE_ID) TEMP

	  --ANOTHER WAY:-

	  --SELECT * FROM (SELECT Employee_Name=(EMP.FIRST_NAME+SPACE(1)+EMP.LAST_NAME),Manager_Name=(MGR.FIRST_NAME+SPACE(1)+MGR.LAST_NAME) FROM Employee AS EMP LEFT OUTER JOIN Employee AS MGR ON EMP.MANAGER_ID=MGR.EMPLOYEE_ID) TEMP

--[5] Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives 
--    and set incentive amount as 0 for those employees who didn’t get incentives.

	  SELECT TEMP.FIRST_NAME,ISNULL(TEMP.INCENTIVE_AMOUNT,0) AS INCENTIVE_AMOUNT FROM (SELECT * FROM Employee AS EMP LEFT OUTER JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID)TEMP
	  
