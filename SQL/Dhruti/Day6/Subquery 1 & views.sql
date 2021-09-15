--Q1 Select employee details from employee table if data exists in incentive table ?

Select * from EMPOLYEES where exists (select * from incentive)

--Q2 Find Salary of the employee whose salary is more than Roy Salary
SELECT first_name, salary FROM EMPOLYEES 
WHERE salary > (SELECT AVG(salary) FROM EMPOLYEES);

--Q3 Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount


CREATE VIEW View_Emp_Incentive 
AS(
SELECT CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) AS 'Full Name'
	,	Emp.Salary
	,	FORMAT(Inc.Incentive_Date,'dd-MM-yyyy') AS 'IncentiveDate'
	,	Inc.Incentive_Amount
FROM Employee AS Emp
JOIN Incentive AS Inc
ON Emp.EmployeeID = Inc.Employee_Ref_Id)

SELECT * FROM View_Emp_Incentive

-- 4. Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

CREATE VIEW View_Emp_Incentive_2
AS
SELECT CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) AS 'Full Name'
	,	Emp.Salary
	,	FORMAT(Inc.Incentive_Date,'dd-MM-yyyy') AS 'IncentiveDate'
	,	Inc.Incentive_Amount
FROM Employee AS Emp
JOIN Incentive AS Inc
ON Emp.EmployeeID = Inc.Employee_Ref_Id
WHERE Inc.Incentive_Amount > 3000

SELECT * 
FROM View_Emp_Incentive_2


-- EXTRA

-- 1. Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

SELECT * FROM Locations

SELECT * FROM Departments

SELECT * FROM Employees

CREATE VIEW vw_emp_dept_location
AS
SELECT CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) AS 'Full Name'
	,	Emp.JobId AS 'Job'
	,	Dept.DepartmentID AS 'Department Number'
	,	Dept.DepartmentName
	,	Loca.LocationID
	,	Loca.City
FROM Employee AS Emp
JOIN  Department AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
JOIN Location AS Loca
ON Dept.LocationID = Loca.LocationID
WHERE Loca.City = 'London'

DROP VIEW vw_emp_dept_location

SELECT * FROM vw_emp_dept_location

-- 2. Create a View to get the department name and number of employees in the department.

CREATE VIEW vw_dept_emp
AS
SELECT Dept.DepartmentName
	,	COUNT(Emp.EmployeeID) AS 'Total Employees'
FROM Department AS Dept
JOIN Employee AS Emp
ON Dept.DepartmentID = Emp.DepartmentID
GROUP BY Dept.DepartmentName

SELECT * FROM vw_dept_emp

-- 3. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

SELECT * FROM JobHistorys


SELECT EmployeeID
	,	JobID AS 'Job Title'
	, DATEDIFF(dd,Startdate,EndDate) AS 'Days'
FROM JobHistorys
WHERE DepartmentID = 90

-- 4. Write a View to display the department name, manager name, and city.

CREATE VIEW vw_dept_emp_loca
AS
SELECT Dept.DepartmentName 
	,	CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) AS 'Manager Name'
	,	Loca.City
FROM Department AS Dept
JOIN Employee AS Emp
ON Dept.DepartmentID = Emp.DepartmentID
JOIN Location AS Loca
ON Dept.LocationID = Loca.LocationID
WHERE Emp.EmployeeID IN (
	SELECT ManagerID 
	FROM Employee
)

SELECT * FROM vw_dept_emp_loca

-- 5. Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

CREATE VIEW vw_emp_dpt_mgr
AS
SELECT  Dept.DepartmentName
	,	CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) AS 'Manager Name'
	,	Emp.HireDate
	,	Emp.Salary
FROM Employee AS Emp
JOIN Department AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
WHERE Emp.EmployeeID IN ( 
	SELECT ManagerID 
	FROM Employee 
	WHERE
	DATEDIFF(yyyy,Emp.HireDate,GETDATE()) > 15
)

SELECT * FROM vw_emp_dpt_mgr

