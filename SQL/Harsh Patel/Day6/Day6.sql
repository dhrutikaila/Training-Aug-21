SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations

--(1)Select employee details from employee table if data exists in incentive table ?

	SELECT * FROM Employee e,Incentives i WHERE e.Employee_ID IN (SELECT I.Employee_ID FROM Incentives)	

--(2)Find Salary of the employee whose salary is more than Roy Salary

	SELECT First_Name,Last_Name,Salary FROM Employee WHERE Salary >(SELECT Salary FROM Employee WHERE First_Name='ROY')	

--(3)Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

		GO
		CREATE VIEW EmployeeData1
		AS
		SELECT E.First_Name,E.Last_Name,E.Salary,E.Joinning_Date,I.Incentive_Date,I.Incentive_Amount 
		FROM Employee E JOIN Incentives I ON E.Employee_ID=I.Employee_ID
		GO
		SELECT * FROM EmployeeData1
	

--(4)Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
		GO
		CREATE VIEW EmployeeData2
		AS
		SELECT E.First_Name,I.Incentive_Amount FROM Employee E JOIN Incentives I
		ON E.Employee_ID=I.Employee_ID WHERE Incentive_Amount > 3000
		GO
		SELECT * FROM EmployeeData2 

--(5)Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

		GO
		CREATE VIEW EmployeeData3
		AS
		SELECT E.FirstName,E.LastName,E.JobId,E.DepartmentID,D.DepartmentName,L.City FROM Employees E JOIN Departments D
		ON E.DepartmentID=D.DepartmentID JOIN Locations L ON D.LocationID=L.LocationID WHERE City='LONDON'
		GO
		SELECT * FROM EmployeeData3
--(6)Create a View to get the department name and number of employees in the department.

		GO
		CREATE VIEW EmployeeData4
		AS
		SELECT E.DepartmentID,D.DepartmentName FROM Employees E JOIN Departments D
		ON E.DepartmentID=D.DepartmentID	
		GO
		SELECT * FROM EmployeeData4

--(7)Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

	SELECT EmployeeID,JobID,DATEDIFF(DD,StartDate,EndDate) AS numberofdays FROM JobHistory 
	WHERE DepartmentID IN(SELECT DepartmentID FROM JobHistory WHERE DepartmentID=90)

--(8)Write a View to display the department name, manager name, and city.
		GO	
		CREATE VIEW EmployeeData8
		AS
		SELECT e.FirstName,d.DepartmentName,l.city 
		FROM Departments d 
		JOIN Employees e
		ON d.ManagerID=e.EmployeeID
		JOIN Locations l
		ON d.LocationID=l.LocationID
		SELECT * FROM EmployeeData8
		GO
--(9)Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
		GO	
		CREATE VIEW EmployeeData9
		AS
		SELECT d.DepartmentName,CONCAT(e.FirstName,SPACE(2),e.LastName) AS FullName,e.HireDate,e.Salary
		FROM Departments d 
		JOIN Employees e
		ON d.ManagerID=e.EmployeeID
		WHERE DATEDIFF(YY,HireDate,GETDATE()) > 15
		SELECT * FROM EmployeeData9
		GO
		