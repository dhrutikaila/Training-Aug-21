USE rxweb_day5

--- All details of Employee table ---
SELECT * FROM Employee

--- All details of Incentives table ---
SELECT * FROM Incentives

--- Query 1. Select employee details from employee table if data exists in incentive table ? ---
SELECT * FROM Employee WHERE Employee_ID IN (SELECT Employee_Ref_ID FROM Incentives)

--- Query 2. Find Salary of the employee whose salary is more than Roy Salary
SELECT First_Name,Salary FROM Employee WHERE Salary >
(SELECT Salary FROM Employee WHERE First_Name='Roy')


---day 6 query 3 Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount---
CREATE VIEW Employee_Details 
AS 
SELECT Emp.First_Name,Emp.Last_Name,Emp.Salary,Emp.Joining_Date,Inc.Incentive_Date,Inc.Incentive_Amount
FROM Employee AS Emp JOIN Incentives AS Inc 
ON Emp.Employee_ID = Inc.Employee_Ref_ID
SELECT * FROM Employee_Details

---day 6 query 4 Create a view to select Select first_name, incentive amount from employee and 
--  incentives table for those employees who have incentives and incentive amount greater than 3000 ---
CREATE VIEW query_4 
AS 
SELECT Emp.First_Name,Inc.Incentive_Amount
FROM Employee AS Emp JOIN Incentives AS Inc 
ON Emp.Employee_ID = Inc.Employee_Ref_ID
WHERE Inc.Incentive_Amount > 3000
SELECT * FROM query_4 




USE rxweb_day2

---day 6 query additional ----

---day 6 additional 1 Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London ---
CREATE VIEW day6_add_1
AS 
SELECT 'Full_Name' = Emp.FirstName + Emp.LastName,Emp.JobId AS 'Job Title',Emp.DepartmentID,Dept.DepartmentName 
FROM Departments AS Dept 
JOIN Employees Emp ON Dept.DepartmentID = Emp.DepartmentID JOIN 
	 Locations AS Loc ON Dept.LocationID =  Loc.LocationID 
WHERE Loc.City = 'London'
SELECT * FROM day6_add_1

SELECT * FROM day_6_additional_1



---day 6 additional 2 Create a View to get the department name and number of employees in the department.---
CREATE VIEW day6_add_2
AS 
SELECT COUNT(Emp.EmployeeID) AS 'Number Of Employees',Dept.DepartmentName 
FROM Employees AS Emp JOIN Departments AS Dept ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName
SELECT * FROM day6_add_2

SELECT * FROM day_6_additional_2
SELECT * FROM view_1





---day 6 additional 3 Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.---
CREATE VIEW day6_add_3 
AS 
SELECT Emp.EmployeeID,Emp.JobId,DATEDIFF(DD,Job.StartDate,Job.EndDate) AS JobDays 
FROM Employees AS Emp JOIN JobHistory AS Job
ON Emp.EmployeeID = Job.EmployeeID
SELECT * FROM day6_add_3

SELECT * FROM day_6_additional_6




---day 6 additional 4 Write a View to display the department name, manager name, and city. ---
CREATE VIEW day6_add_4
AS 
SELECT Emp.FirstName,Dept.DepartmentName,Loc.City FROM Departments AS Dept JOIN Employees AS Emp 
ON Dept.ManagerID = Emp.EmployeeID JOIN 
Locations Loc ON Dept.LocationID = Loc.LocationID
SELECT * FROM day6_add_4


SELECT * FROM day_6_additional_5


--- day 6 additional 5 Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. ---
SELECT 'FullName' = Emp.FirstName+' '+Emp.LastName,dep.DepartmentName,Emp.HireDate,Emp.Salary 
FROM Employees AS Emp JOIN Departments dep 
ON Emp.ManagerID = dep.ManagerID WHERE DATEDIFF(YYYY,Emp.HireDate,GETDATE()) > 15
