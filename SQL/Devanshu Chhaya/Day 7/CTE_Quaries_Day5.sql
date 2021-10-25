
SELECT * FROM Employee1

SELECT * FROM Incentives

-----1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table


WITH Employee_CTE 
AS
(
	SELECT First_Name+' '+Last_Name AS EmployeeName, Joining_Date,Insentive_Date
	FROM Employee1 e 
	JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id
)

SELECT *,DATEDIFF(DAY,Joining_date,Insentive_Date) AS DateDifference
FROM Employee_CTE


---2.Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

WITH Employee_CTE (First_Name,Last_Name,Insentive_Amount)
AS
(
	SELECT First_name,Last_name,Insentive_Amount FROM Employee1 e 
	JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id
)

SELECT * 
FROM Employee_CTE 
	WHERE Insentive_Amount>3000

----3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.


WITH Employee_CTE (First_Name,Last_Name,Insentive_Amount)
AS
(
	SELECT First_name,Last_name,Insentive_Amount FROM Employee1 e 
	LEFT JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id
)

SELECT * FROM Employee_CTE

----4.Select EmployeeName, ManagerName from the employee table.


WITH Employee_CTE (FirstName,LastName,Manager_Name) AS
(
	SELECT m.First_name AS FirstName,m.Last_name AS LastName, e.First_Name as 'Manager_Name' 
	FROM Employee1 m 
	JOIN Employee1 e ON m.Manager_Id=e.Employee_Id
) 

SELECT * FROM Employee_CTE


----5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

WITH Employee_CTE (First_Name,Last_Name,Insentive_Amount)
AS
(
	SELECT First_name,Last_name,Insentive_Amount FROM Employee1 e 
	LEFT JOIN Incentives i ON e.Employee_id = i.Employee_ref_Id
)

SELECT First_name,Last_Name,ISNULL(Insentive_Amount,0) FROM Employee_CTE
