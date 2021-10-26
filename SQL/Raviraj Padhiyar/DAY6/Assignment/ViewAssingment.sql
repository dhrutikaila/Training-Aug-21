--Views
USE SampleTable

SELECT * FROM Incentive


-- Q1
--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

CREATE VIEW DemoView
AS
SELECT e.FirstName
	,e.Lastname
	,e.Salary
	,e.JoiningDate
	,i.IncentiveDate
	,i.IncentiveAmount
FROM Employees e
	INNER JOIN Incentive i ON e.EmployeeID = i.EmployeeID

SELECT * FROM DemoView


-- Q2
--Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW ViewDemo2
AS
SELECT e.FIrstName
	,i.IncentiveAmount
FROM Employees e
	INNER JOIN Incentive i ON e.EmployeeId = i.EmployeeID
WHERE i.IncentiveAmount > 3000

SELECT * FROM ViewDemo2


-- Q3
--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

CREATE VIEW DemoView3
AS
SELECT e.FirstName
	,e.LastName
	,e.JobID
	,e.DepartmentID
	,d.DepartmentName
FROM Employees e
 INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
 INNER JOIN Locations l ON d.LocationID = l.LocationID
WHERE l.City = 'London'


-- Q4
--Create a View to get the department name and number of employees in the department.

CREATE VIEW DemoView4
AS
SELECT COUNT(EmployeeID) AS 'work in'
	,d.DepartmentName
FROM Departments d
	LEFT OUTER JOIN Employees e ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName


SELECt * FROM JobHistory



-- Q5
--Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

CREATE VIEW DemoView5
AS
SELECT EmployeeID,JObID,DATEDIFF(Day,StartDate,EndDate) AS days
FROM JobHistory
WHERE DepartmentID = 90



-- Q6
--Write a View to display the department name, manager name, and city.

CREATE VIEW DemoView6
AS
SELECT DepartmentName 
	,e.FirstName
	,e.LastName
	,l.City
FROM Departments d
	INNER JOIN Employees e ON d.ManagerID = e.EmployeeID
	INNER JOIN Locations l ON d.LocationID = l.LocationID



--Q7
--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

CREATE VIEW DemoView7
AS
SELECT DepartmentName 
	,e.FirstName+' '+e.LastName AS Name
	,e.JoiningDate
	,e.Salary
FROM Departments d
	INNER JOIN Employees e ON d.ManagerID = e.EmployeeID
	INNER JOIN JobHistory j ON e.EmployeeID = j.EmployeeID
WHERE DATEDIFF(YYYY,j.StartDate,j.endDate) > 2

--used 2 year instead of 15 year