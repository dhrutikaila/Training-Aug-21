-- Assignment:

-- [1] Select employee details from employee table if data exists in incentive table ?

	   SELECT * FROM Employee WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_REF_ID FROM Incentives)
	   
-- [2] Find Salary of the employee whose salary is more than Roy Salary

	   SELECT * FROM Employee WHERE SALARY > (SELECT SALARY FROM Employee WHERE FIRST_NAME='Roy')	

-- [3] Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

	   CREATE VIEW Employee_Incentive_Details
	   AS
	   SELECT EMP.FIRST_NAME,EMP.LAST_NAME,EMP.SALARY,EMP.JOINING_DATE,INS.INCENTIVE_DATE,INS.INCENTIVE_AMOUNT FROM Employee 
	   AS EMP JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID

	   SELECT * FROM Employee_Incentive_Details

-- [4] Create a view to select Select first_name, incentive amount from employee and incentives table for those employees 
--     who have incentives and incentive amount greater than 3000

	   CREATE VIEW Incentive_Detail
	   AS
	   SELECT EMP.FIRST_NAME,INS.INCENTIVE_AMOUNT FROM Employee AS EMP 
	   JOIN Incentives AS INS ON EMP.EMPLOYEE_ID=INS.EMPLOYEE_REF_ID
	   WHERE INS.INCENTIVE_AMOUNT > 3000

	   SELECT * FROM Incentive_Detail

--(Note refer tables from sql supported files)

--[1] Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

	  CREATE VIEW London_Employee
	  AS
	  SELECT (FirstName+' '+LastName) AS [Name],JobId,DEPT.DepartmentID,DEPT.DepartmentName FROM Employees as EMP 
	  JOIN Departments AS DEPT ON EMP.DepartmentID=DEPT.DepartmentID
	  JOIN Locations AS L ON L.LocationID=DEPT.LocationID
	  WHERE L.City='London'

	  SELECT * FROM London_Employee

--[2] Create a View to get the department name and number of employees in the department.

	  CREATE VIEW Employees_Department_Detail
	  AS
	  SELECT DepartmentName,COUNT(EMP.EmployeeID) AS Number_Of_Employees FROM Departments AS DEPT 
	  JOIN Employees AS EMP ON DEPT.DepartmentID=EMP.DepartmentID
	  GROUP BY DepartmentName

	  SELECT * FROM Employees_Department_Detail

--[3] Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

	  SELECT EmployeeID,JobID,DATEDIFF(DD,StartDate,EndDate) AS Total_Days FROM JobHistory WHERE DepartmentID=90

--[4] Write a View to display the department name, manager name, and city.

	  CREATE VIEW Manager_Details
	  AS
	  SELECT DPT.DepartmentName,Manager_Name=(MGR.FirstName+SPACE(1)+MGR.LastName),LOC.City FROM Departments AS DPT 
	  JOIN Employees AS MGR ON DPT.ManagerID=MGR.EmployeeID
	  JOIN Locations AS LOC ON LOC.LocationID=DPT.LocationID

	  SELECT * FROM Manager_Details

--[5] Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all 
--    managers whose experience is more than 15 years.

	  CREATE VIEW Employee_Experience_Detail
	  AS
	  SELECT DEPT.DepartmentName,Manager_Name=CONCAT(MGR.FirstName,SPACE(1),MGR.LastName),MGR.HireDate,MGR.Salary FROM Employees AS MGR
	  JOIN Departments AS DEPT
	  ON DEPT.ManagerID=MGR.EmployeeID
	  WHERE DATEDIFF(YY,HireDate,GETDATE()) > 15

	  SELECT * FROM Employee_Experience_Detail
