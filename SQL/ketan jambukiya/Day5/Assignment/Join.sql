USE JOIN

--1.Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives table

SELECT DATEDIFF(MONTH,emp.JOINING_DATE,inc.INCENTIVE_DATE ) AS DIFFINMONTH 
FROM Employee emp INNER JOIN Incentives inc ON inc.EMPLOYEE_REF_ID=emp.EMPLOYEE_ID

--2.SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT e.FIRST_NAME AS firstname,i.INCENTIVE_AMOUNT AS incentiveamount
FROM Employee e INNER JOIN Incentives i ON i.EMPLOYEE_REF_ID=e.EMPLOYEE_ID  
where i.INCENTIVE_AMOUNT>3000

--3.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives.

SELECT e.FIRST_NAME AS firstname,i.INCENTIVE_AMOUNT AS incentiveamount 
FROM Employee e LEFT JOIN Incentives i ON i.EMPLOYEE_REF_ID=e.EMPLOYEE_ID 

--4.SELECT EmployeeName, ManagerName FROM the employee table

SELECT emp.FIRST_NAME AS 'name',mgr.FIRST_NAME AS 'managername' 
FROM Employee mgr JOIN Employee emp ON mgr.EMPLOYEE_ID=emp.MANAGER_ID

--5.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.FIRST_NAME AS firstname,ISNULL(i.INCENTIVE_AMOUNT,0) AS incentiveamount 
FROM Employee e LEFT JOIN Incentives i ON i.EMPLOYEE_REF_ID=e.EMPLOYEE_ID 
	