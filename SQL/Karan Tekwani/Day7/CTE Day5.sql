use day5
-- Day 5 Exercise with CTE --

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH DateDiff (EMPLOYEE_ID , Date_Diff)
AS
	(
		SELECT  E.EMPLOYEE_ID , DATEDIFF(DAY , E.JOINING_DATE , I.INCENTIVE_DATE ) 'Date_Diff' FROM Employee AS E
		JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID
	)
SELECT  EMPLOYEE_ID , Date_Diff FROM DateDiff;



-- 2. Select first_name, incentive amount from employee and incentives table for those 
--employees who have incentives and incentive amount greater than 3000
WITH FilterEmply (FIRST_NAME , INCENTIVE_AMOUNT)
AS
	(
	SELECT E.FIRST_NAME , I.INCENTIVE_AMOUNT FROM Employee AS E
	JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID WHERE I.INCENTIVE_AMOUNT > 3000
	)
SELECT FIRST_NAME , INCENTIVE_AMOUNT FROM FilterEmply;



-- 3. Select first_name, incentive amount from employee and incentives table for 
--all employees even if they didn’t get incentives.
WITH GetEmply (FIRST_NAME , INCENTIVE_AMOUNT)
AS
	(
	SELECT E.FIRST_NAME , I.INCENTIVE_AMOUNT FROM Employee AS E
	LEFT JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID 
	)
SELECT FIRST_NAME, INCENTIVE_AMOUNT FROM GetEmply;



-- 4. Select EmployeeName, ManagerName from the employee table.
WITH Manager_Employee (EMP_NAME , MAN_NAME)
AS
	(
	SELECT EMP.FIRST_NAME ,E.FIRST_NAME FROM Employee AS E
	JOIN  Employee AS EMP ON E.EMPLOYEE_ID = EMP.MANAGER_ID 
	)
SELECT EMP_NAME , MAN_NAME FROM Manager_Employee;



/* 5. Select first_name, incentive amount from employee and incentives table for 
all employees even if they didn’t get incentives and set incentive amount as 0 for those
employees who didn’t get incentives.  */

WITH EmployeeIncentive (FIRST_NAME , INCENTIVE_AMOUNT)
AS
	(
	SELECT E.FIRST_NAME , ISNULL(I.INCENTIVE_AMOUNT , 0) INCENTIVE_AMOUNT FROM Employee AS E
	LEFT JOIN Incentives AS I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID 
	)
SELECT FIRST_NAME , INCENTIVE_AMOUNT FROM EmployeeIncentive;

