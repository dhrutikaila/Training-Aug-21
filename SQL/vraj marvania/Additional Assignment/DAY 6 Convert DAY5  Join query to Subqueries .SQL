USE AUG26 

--1.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

	  SELECT DATEDIFF(DAY,JOINING_DATE,(SELECT INCENTIVE_DATE 
		FROM Incentives 
		WHERE EMPLOYEE_REF_ID=e.EMPLOYEE_ID)) as DATEDIFFERENCE
	  FROM Employee e



-- 2.SELECT first_name, incentive amount from employee and incentives 
--  table for those employees who have incentives and incentive amount
--  greater than 3000



		SELECT * FROM( SELECT e.FIRST_NAME ,(SELECT INCENTIVE_AMOUNT 
			 from Incentives 
			 where EMPLOYEE_REF_ID=e.EMPLOYEE_ID ) AS [INCENTIVE_AMOUNT ]
			 FROM Employee e  )TEMP
		WHERE INCENTIVE_AMOUNT>3000



-- 3. SELECT first_name, incentive amount from employee
--  and incentives table for all employees even if they didn’t get incentives.
     

	SELECT e.FIRST_NAME ,(SELECT INCENTIVE_AMOUNT 
										 from Incentives 
										 where EMPLOYEE_REF_ID=e.EMPLOYEE_ID ) AS [INCENTIVE_AMOUNT ]
				  FROM Employee e  

-- 4. SELECT EmployeeName, ManagerName from the employee table.


		SELECT E.FIRST_NAME,(SELECT FIRST_NAME 
							 FROM Employee M 
							 where E.MANAGER_ID =M.EMPLOYEE_ID
							 ) AS[MANAGER NAME]
		from Employee E 


-- 5. SELECT first_name, incentive amount from employee and incentives
--  table for all employees even if they didn’t get incentives and set
--  incentive amount as 0 for those employees who didn’t get incentives.
 
 
	 SELECT FIRST_NAME,ISnull((SELECT INCENTIVE_AMOUNT 
							   FROM Incentives  
							   where EMPLOYEE_ID=EMPLOYEE_REF_ID ),0) AS [INCENTIVE_AMOUNT] 
	FROM Employee


