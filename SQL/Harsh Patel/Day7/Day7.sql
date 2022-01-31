--CTE 
--(1)Write a query to rank employees based on their salary for a month

	with myCTE(Rank1,EmployeeID,Salary)
	as
	(select ROW_NUMBER() OVER(ORDER BY SALARY) AS Rank1,EmployeeID,Salary FROM Employees)
	SELECT * FROM myCTE 	

--(2)Select 4th Highest salary from employee table using ranking function

	with myCTE(Rank1,EmployeeID,Salary)
	as
	(SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS Rank1,EmployeeID,Salary FROM Employees)
	select * from myCTE where rank1 =4


--(3)Get department, total salary with respect to a department from employee table.

	with myCTE(DepartmentID,Salary)
	as
	(SELECT DepartmentID,Salary FROM Employees)
	select DepartmentID,Sum(Salary) AS Total_Salary from myCTE group by DepartmentID


--(4)Get department, total salary with respect to a department from employee table order by total salary descending

   with myCTE(DepartmentID,Salary)
	as
	(SELECT DepartmentID,Salary FROM Employees)
	select DepartmentID,Sum(Salary) AS Total_Salary from myCTE group by DepartmentID order by Total_Salary DESC

 

--(5)Get department wise maximum salary from employee table order by salary ascending
	
	with myCTE(DepartmentID,Salary)
	as
	(SELECT DepartmentID,Salary FROM Employees)
	select DepartmentID,max(Salary) AS Max_Salary from myCTE group by DepartmentID order by Max_Salary 
	
--(6)Get department wise minimum salary from employee table order by salary ascending
	
	with myCTE(DepartmentID,Salary)
	as
	(SELECT DepartmentID,Salary FROM Employees)
	select DepartmentID,min(Salary) AS Min_Salary from myCTE group by DepartmentID order by Min_Salary 

 
	
--(7)Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
	
	with myCTE(DepartmentID,Total_Salary)
	as
	(SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM Employees group by DepartmentID)
	select * from myCTE WHERE Total_Salary > 50000 ORDER BY Total_Salary DESC

 --(8)Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

		WITH myCTE(Date_Differnce)
		AS
		(SELECT DATEDIFF(YYYY,CONCAT('20',SUBSTRING(Joinning_date,8,2)),CONCAT('20',SUBSTRING(Incentive_Date,8,2))) AS Date_Difference
		FROM Employees e JOIN Incentives i ON e.Employee_ID=i.Employee_Id)
		SELECT * FROM myCTE

--(9)Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

	WITH myCTE(FirstName,IncentiveAmount)
		AS
		(SELECT e.First_Name AS FirstName,i.Incentive_Amount AS IncentiveAmount FROM Employees e JOIN Incentives i 
		ON e.Employee_Id=i.Employee_Id)
		SELECT * FROM myCTE WHERE IncentiveAmount > 3000

--(10)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

		WITH myCTE(FirstName,IncentiveAmount)
		AS
		(SELECT e.First_Name AS FirstName,i.Incentive_Amount AS IncentiveAmount FROM Employees e LEFT JOIN Incentives i 
		ON e.Employee_Id=i.Employee_Id	)
		SELECT * FROM myCTE 

--(11)Select EmployeeName, ManagerName from the employee table.

		WITH myCTE(Employee_Name,Manager_Name)
		AS
		(SELECT e.First_Name AS Employee_Name,m.First_Name AS Manager_Name FROM Employees e JOIN 
		Employees m ON e.manager_Id=m.Employee_Id)
		SELECT * FROM myCTE

--(12)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
		WITH myCTE(FirstName,IncentiveAmount)
		AS
		(SELECT e.First_Name AS FirstName,ISNULL(i.Incentive_Amount,0) AS IncentiveAmount FROM Employees e LEFT JOIN Incentives i
		ON e.Employee_Id=i.Employee_Id)
		SELECT * FROM myCTE 