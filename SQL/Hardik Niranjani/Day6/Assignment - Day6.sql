
--SubQuery Assignment

--(1)--
--Select employee details from employee table if data exists in incentive table

Select * from Employee 
		where EMPLOYEE_ID IN (Select EMPLOYEE_REF_ID from Incentives)


---------------------------------------------------------------------------------------------------------------


--(2)--
--Find Salary of the employee whose salary is more than Roy Salary

Select * from Employee 
		 where SALARY>(Select SALARY from Employee Where FIRST_NAME = 'Roy')


---------------------------------------------------------------------------------------------------------------

/*
--(3)--
--Find the employee ID, job title, number of days between ending date and 
--starting date for all jobs in department 90 from job history
*/

SELECT EmployeeID, JobID as [Job Title], DATEDIFF(DAY, StartDate , EndDate) as [Days] 
		FROM  JobHistory
		WHERE DepartmentID = 90 




---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

--View Assignment

--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

CREATE VIEW EmployeeDetails
AS
	SELECT e.FIRST_NAME, e.LAST_NAME, e.SALARY,e.JOINING_DATE,i.INCENTIVE_DATE, i.INCENTIVE_AMOUNT 
			 FROM Employee AS e
			 LEFT JOIN Incentives AS i
			 ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID

SELECT * FROM EmployeeDetails


                                                    
--Create a view to select Select first_name, incentive amount from employee and incentives table for those employees 
--who have incentives and incentive amount greater than 3000

CREATE VIEW EmployeeDetails2
AS
	SELECT e.FIRST_NAME,e.LAST_NAME,i.INCENTIVE_AMOUNT FROM Employee AS e
			 JOIN Incentives AS i 
			 ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
			 WHERE I.INCENTIVE_AMOUNT >3000


SELECT * FROM EmployeeDetails2
                                       


--Create a View to Find the names (first_name, last_name), job, department number, and department 
--name of the employees who work in London

CREATE VIEW EmployeeInLondon
AS
	 SELECT CONCAT(e.FirstName,' ',e.LastName) AS [Name],e.JobId,d.DepartmentID,d.DepartmentName  
		 FROM Employees as e
		 JOIN Departments as d
		 ON e.DepartmentID=d.DepartmentID
		 JOIN Locations as l
		 ON d.LocationID = l.LocationID
		 WHERE l.City = 'London'

SELECT * FROM EmployeeInLondon



--Create a View to get the department name and number of employees in the department.

CREATE VIEW TotalEmployeeInDep
AS
	 SELECT d.DepartmentName, COUNT(e.EmployeeID) AS [Number of Employee] FROM Employees as e
		 JOIN Departments as d
		 ON e.DepartmentID = d.DepartmentID
		 GROUP BY d.DepartmentName 

SELECT * FROM TotalEmployeeInDep 
		 ORDER BY DepartmentName DESC



--Write a View to display the department name, manager name, and city.

CREATE VIEW ManagerDetails 
AS
		SELECT CONCAT(e.FirstName,' ',e.LastName) AS [Manager Name], d.DepartmentName , l.City 
				 FROM Employees AS e
				 JOIN Departments AS d
				 ON e.DepartmentID = d.DepartmentID
				 JOIN Locations AS l
				 ON l.LocationID = d.LocationID
				 WHERE e.EmployeeID = d.ManagerID

SELECT * FROM ManagerDetails



--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all 
--managers whose experience is more than 15 years.

CREATE VIEW ManagerDetails2
AS
		SELECT CONCAT(e.FirstName,' ',e.LastName) AS [Manager Name], d.DepartmentName, e.HireDate, e.Salary,
				 (DATEDIFF(YY, HireDate, GETDATE())) AS [Total Experience]
				 FROM Employees AS e
				 JOIN Departments AS d
				 ON e.DepartmentID = d.DepartmentID
				 JOIN Locations AS l
				 ON l.LocationID = d.LocationID
				 WHERE (e.EmployeeID = d.ManagerID) AND (DATEDIFF(YY, HireDate, GETDATE()))>15

SELECT * FROM ManagerDetails2



--