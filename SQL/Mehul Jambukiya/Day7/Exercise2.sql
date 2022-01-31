
USE JOINPRACTICE;

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

WITH cte
	AS
	(SELECT * FROM Employee e JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id)
		SELECT Joining_Date,Incentive_Date,DATEDIFF(DD,Joining_Date,Incentive_Date) AS DiffInDays FROM cte;

--Select first_name, incentive amount from employee and incentives table for those employees
--who have incentives and incentive amount greater than 3000

WITH cte
	AS
	(SELECT * FROM Employee e JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id)
		SELECT First_Name,Incentive_Amount FROM cte WHERE Incentive_Amount>3000;

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

WITH cte
	AS
	(SELECT * FROM Employee e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id)
		SELECT First_Name,Incentive_Amount FROM cte;

--Select EmployeeName, ManagerName from the employee table.

WITH cte
	AS
	(SELECT e.First_Name AS Employee, m.First_Name AS Manager FROM Employee e LEFT JOIN Employee m ON e.Manager_Id=m.Employee_Id)
		SELECT Employee,Manager FROM cte;

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

WITH cte
	AS
	(SELECT * FROM Employee e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id)
		SELECT First_Name,ISNULL(Incentive_Amount,0) FROM cte;
