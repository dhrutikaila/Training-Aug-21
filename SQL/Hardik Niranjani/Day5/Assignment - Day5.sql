--(1)--
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT (e.JOINING_DATE - i.INCENTIVE_DATE) AS [Date_Difference] FROM Employee AS e
	JOIN  Incentives AS i
	ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID




--(2)--
--Select first_name, incentive amount from employee and incentives table for those employees 
--who have incentives and incentive amount greater than 3000

SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM Employee as e
		Inner Join Incentives as i 
		ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID 
		WHERE I.INCENTIVE_AMOUNT>3000



--(3)--
--Select first_name, incentive amount from employee and 
--incentives table for all employees even if they didn’t get incentives.

SELECT e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM Employee as e
		Left Outer Join Incentives as i
		ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID





--(4)--
--Select EmployeeName, ManagerName from the employee table.

SELECT b.FIRST_NAME as Employee,e.FIRST_NAME as Manager  FROM Employee as e
		 join Employee as b
		 on e.EMPLOYEE_ID = b.MANAGER_ID




--(5)--
--Select first_name, incentive amount from employee and incentives table for all employees even if 
--they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.FIRST_NAME, ISNULL(i.INCENTIVE_AMOUNT, 0) FROM Employee as e
			Left Join Incentives as i
			ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
			
	