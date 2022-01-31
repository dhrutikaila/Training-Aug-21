-- Day 5 Exercise with CTE --

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH DATE_DIFF_CTE (EMPLOYEE_ID , Date_Diff)
AS
	(
		SELECT  E.EMPLOYEE_ID , DATEDIFF(DAY , E.JOINING_DATE , I.INCENTIVE_DATE ) 'Date_Diff' FROM Employee AS E
		JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID
	)
SELECT  EMPLOYEE_ID , Date_Diff FROM DATE_DIFF_CTE;



-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
WITH INS_AMOUNT_3K (FIRST_NAME , INCENTIVE_AMOUNT)
AS
	(
	SELECT E.FIRST_NAME , I.INCENTIVE_AMOUNT FROM Employee AS E
	JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID WHERE I.INCENTIVE_AMOUNT > 3000
	)
SELECT FIRST_NAME , INCENTIVE_AMOUNT FROM INS_AMOUNT_3K;



-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
WITH EMPLOYEE_ALL (FIRST_NAME , INCENTIVE_AMOUNT)
AS
	(
	SELECT E.FIRST_NAME , I.INCENTIVE_AMOUNT FROM Employee AS E
	LEFT JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID 
	)
SELECT FIRST_NAME, INCENTIVE_AMOUNT FROM EMPLOYEE_ALL;



-- 4. Select EmployeeName, ManagerName from the employee table.
WITH EMP_MANAGER (EMP_NAME , MAN_NAME)
AS
	(
	SELECT EMP.FIRST_NAME ,E.FIRST_NAME FROM Employee AS E
	JOIN  Employee AS EMP ON E.EMPLOYEE_ID = EMP.MANAGER_ID 
	)
SELECT EMP_NAME , MAN_NAME FROM EMP_MANAGER;



-- 5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
WITH EMP_ALL_INC (FIRST_NAME , INCENTIVE_AMOUNT)
AS
	(
	SELECT E.FIRST_NAME , ISNULL(I.INCENTIVE_AMOUNT , 0) INCENTIVE_AMOUNT FROM Employee AS E
	LEFT JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID 
	)
SELECT FIRST_NAME , INCENTIVE_AMOUNT FROM EMP_ALL_INC;

