USE Day2
SELECT * FROM sys.tables

SELECT * 
FROM Employees
SELECT *
FROM Departments
SELECT *
FROM Incentives
SELECT *
FROM Locations
SELECT *
FROM JobHistory

--1-Select employee details from employee table if data exists in incentive table ?
SELECT *
FROM Employees Emp
WHERE EXISTS
(
SELECT Employee_REf_Id
FROM Incentives
WHERE Employee_Ref_Id = Emp.EmployeeID
)

--2-Find Salary of the employee whose salary is more than Roy Salary
SELECT FirstName, Salary
FROM Employees
WHERE Salary > 
(
SELECT Salary
FROM Employees
WHERE FirstName = 'Lex'
)

--3-Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW vw_EmpIncentive1
AS
SELECT Emp.FirstName
	, Emp.LastName
	, Emp.Salary
	, CONVERT(VARCHAR, Inc.Incentive_Date, 105) 'Incentive Date'
	, Inc.Incentive_Amount
FROM Employees Emp
JOIN Incentives Inc
ON EMp.EmployeeID = Inc.Employee_Ref_Id

SELECT *
FROM vw_EmpIncentive1
DROP VIEW vw_EmpIncentive1

--4-Create a view to select Select first_name, incentive amount from employee and incentives table for those employees 
--who have incentives and incentive amount greater than 3000
CREATE VIEW vw_EmpIncentive2
AS
SELECT Emp.FirstName
	, Inc.Incentive_Amount
FROM Employees Emp
JOIN Incentives Inc
ON EMp.EmployeeID = Inc.Employee_Ref_Id
WHERE Inc.Incentive_Amount > 3000

SELECT *
FROM vw_EmpIncentive2
DROP VIEW vw_EmpIncentive2

-------------------------------------------------------------------------------------------------

--1-Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW vw_Emp_Dep_Loc1
AS
SELECT Emp.FirstName + ' ' + Emp.LastName 'Full Name'
	, Emp.JobId 'Job'
	, Dpt.DepartmentID 'Department Number'
	, Dpt.DepartmentName
FROM Employees Emp
JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID 
JOIN Locations AS Loc
ON Loc.LocationID = Dpt.LocationID
WHERE Loc.City = 'London'

SELECT *
FROM vw_Emp_Dep_Loc1

--2-Create a View to get the department name and number of employees in the department.
CREATE VIEW vw_EMp_Dpt1
AS
SELECT DepartmentName, COUNT(*) 'Number of Employees'
FROM Employees Emp
JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
GROUP BY DepartmentName

SELECT *
FROM vw_EMp_Dpt1

--3-Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID
	, JobID 'Job Title'
	, DATEDIFF(dd, StartDate, EndDate) 'Number of Days'
FROM JobHistory
WHERE DepartmentID = 90

--4-Write a View to display the department name, manager name, and city.
CREATE VIEW vw_Emp_Dpt_Loc2
AS
SELECT Dpt.DepartmentName
	, Emp.FirstName + ' ' + Emp.LastName 'Manager Name'
	, Loc.City
FROM Employees Emp
JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
JOIN Locations Loc
ON Loc.LocationID = Dpt.LocationID
WHERE Emp.EmployeeID IN
(
SELECT ManagerID
FROM Employees
)

SELECT *
FROM vw_Emp_Dpt_Loc2

--5-Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW vw_Emp_Dpt2
AS
SELECT Dpt.DepartmentName
	, Emp.FirstName + ' ' + Emp.LastName 'Full Name'
	, Emp.HireDate
	, Salary
FROM Employees Emp
JOIN Departments Dpt
ON Dpt.DepartmentID = Emp.DepartmentID
WHERE Emp.EmployeeID IN
(
SELECT ManagerID
FROM Employees
WHERE DATEDIFF(yyyy, HireDate, GETDATE()) > 15
)

SELECT *
FROM vw_Emp_Dpt2
