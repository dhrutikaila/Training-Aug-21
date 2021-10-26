USE Day5_SQL

--1)Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT DATEDIFF(dd,emp.Joining_Date , inc.Incentive_Date) 
	FROM Employee AS emp 
	INNER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID 
	
--2)Select first_name, incentive amount from employee and incentives table for those employees 
--  who have incentives and incentive amount greater than 3000
SELECT emp.First_Name,inc.Incentive_Amount 
	FROM Employee AS emp 
	INNER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID 
	WHERE inc.Incentive_Amount > 3000

--3)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT emp.First_Name,ISNULL(inc.Incentive_Amount ,0) AS 'Incentive'
	FROM Employee AS emp 
	LEFT OUTER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID 

--4)Select EmployeeName, ManagerName from the employee table.
SELECT emp.First_Name AS 'emp-FirstName',
	   mgr.First_Name AS 'mgr-FirstName'
	   FROM Employee AS emp INNER JOIN
	   Employee AS mgr
	   ON mgr.Employee_ID=emp.Manager_ID

--5)Select first_name, incentive amount from employee and incentives table for all employees 
--  even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
SELECT emp.First_Name,ISNULL(inc.Incentive_Amount,0) AS 'Incentive'
	FROM Employee AS emp 
	LEFT OUTER JOIN Incentives AS inc 
	ON emp.Employee_ID=inc.Employee_Ref_ID