--Assignment:

--[1] Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

   SELECT EMP.FIRST_NAME,Date_Difference=JOINING_DATE-CAST(INCENTIVE_DATE AS DATETIME) FROM Employee AS EMP INNER JOIN Incentives AS INS 
   ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID

--Another Way
   SELECT EMP.FIRST_NAME,Date_Difference=JOINING_DATE-CAST(INCENTIVE_DATE AS DATETIME) FROM Employee AS EMP RIGHT JOIN Incentives AS INS 
   ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID

--[2] Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

	SELECT EMP.FIRST_NAME,INS.INCENTIVE_AMOUNT FROM Employee AS EMP INNER JOIN Incentives AS INS 
    ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID WHERE INS.INCENTIVE_AMOUNT > 3000

--[3] Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

	SELECT EMP.FIRST_NAME,INS.INCENTIVE_AMOUNT FROM Employee AS EMP LEFT OUTER JOIN Incentives AS INS 
	ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID

--[4] Select EmployeeName, ManagerName from the employee table.

	 SELECT EMP.FIRST_NAME AS EmployeeName,MGR.FIRST_NAME AS ManagerName FROM Employee AS EMP LEFT OUTER JOIN Employee AS MGR
	 ON EMP.MANAGER_ID=MGR.EMPLOYEE_ID

	 --Another Way

	 SELECT EMP.FIRST_NAME AS EmployeeName,MGR.FIRST_NAME AS ManagerName FROM Employee AS EMP JOIN Employee AS MGR
	 ON EMP.MANAGER_ID=MGR.EMPLOYEE_ID

--[5] Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives 
--    and set incentive amount as 0 for those employees who didn’t get incentives.

	  SELECT EMP.FIRST_NAME,ISNULL(INS.INCENTIVE_AMOUNT,0) AS Incentives_Amount FROM Employee AS EMP LEFT OUTER JOIN Incentives AS INS 
	  ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID


