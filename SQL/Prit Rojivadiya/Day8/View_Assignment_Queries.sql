-- Q1 Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

use Demo

CREATE VIEW EmpIncentive
AS
SELECT e.First_Name,e.Last_Name,e.Salary,e.Joining_Date,i.Incentive_Date,i.Incentive_Amount FROM Employee e
	JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id
GO

SELECT * FROM EmpIncentive



-- Q2 Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

use Demo

CREATE VIEW EmpIncentive1
AS
SELECT e.First_Name,i.Incentive_Amount FROM Employee e
	JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id
WHERE i.Incentive_Amount > 3000
GO

SELECT * FROM EmpIncentive1



-- Q3 Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

use db2

CREATE VIEW EmpDeptLocation
AS
SELECT e.FirstName,e.LastName,e.JobId,d.DepartmentID,d.DepartmentName FROM Employees e
	JOIN Departments d ON d.DepartmentID = e.DepartmentID
	JOIN Locations l ON l.LocationID = d.LocationID
WHERE l.City = 'London'
GO

SELECT * FROM EmpDeptLocation



-- Q4 Create a View to get the department name and number of employees in the department.

CREATE VIEW EmpDept
AS
SELECT d.DepartmentName,COUNT(e.EmployeeID) as 'No of Emp' FROM Employees e
	JOIN Departments d ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName

SELECT * FROM EmpDept



-- Q5 Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

CREATE VIEW EmpJobHistory
AS
SELECT e.EmployeeID,e.JobId,DATEDIFF(DAY,j.StartDate,j.EndDate) as 'Diff' FROM Employees e
	JOIN JobHistory j ON j.EmployeeID = e.EmployeeID

SELECT * FROM EmpJobHistory



-- Q6 Write a View to display the department name, manager name, and city.

CREATE VIEW mgrDeptLocation
AS
SELECT d.DepartmentName,e.FirstName,l.City FROM Employees e
	JOIN Departments d ON d.ManagerID = e.EmployeeID
	JOIN Locations l ON l.LocationID = d.LocationID

SELECT * FROM mgrDeptLocation



-- Q7 Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

CREATE VIEW deptEmpExp
AS
SELECT d.DepartmentName,e.FirstName,e.LastName,e.HireDate,e.Salary FROM Employees e
	JOIN Departments d ON d.DepartmentID = e.DepartmentID
WHERE DATEDIFF(YEAR,e.HireDate,GETDATE()) > 15

SELECT * FROM deptEmpExp