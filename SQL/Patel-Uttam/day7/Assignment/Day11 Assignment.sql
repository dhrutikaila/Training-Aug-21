USE [Day11 (views and CTE)]

-- Assignment (Day 6 sql)


-- View


/*

-Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
-Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater
than 3000

-Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
-Create a View to get the department name and number of employees in the department.
-Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
-Write a View to display the department name, manager name, and city.
-Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

*/


-- Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

CREATE VIEW  emp_Inc AS
SELECT e.FirstName , e.LastName , e.Salary , e.HireDate , i.IncentiveDate , i.IncentiveAmount FROM Employees as e
JOIN Incentive i
ON e.EmployeeID = i.EmployeeID





--Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

CREATE VIEW  emp_Inc_3000 AS
SELECT e.FirstName , i.IncentiveAmount FROM Employees as e
JOIN Incentive i
ON e.EmployeeID = i.EmployeeID
WHERE i.IncentiveAmount > 3000





--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW department_london AS
SELECT (e.FirstName+' '+e.LastName) 'Name' ,e.JobId,d.DepartmentID 'department number', d.DepartmentName , l.City FROM Departments as d
JOIN Locations as l
ON d.LocationID = l.LocationID
JOIN Employees AS e
ON e.DepartmentID = d.DepartmentID -- first

SELECT * FROM department_london WHERE City = 'London' -- second

DROP VIEW department_london --DROP






--Create a View to get the department name and number of employees in the department.
CREATE VIEW deptname_noemp(department_name , number_of_employees) AS
SELECT d.DepartmentName , COUNT(e.EmployeeID)  FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName --First

SELECT * FROM deptname_noemp -- Second

DROP VIEW deptname_noemp --DROP







--Write a View to display the department name, manager name, and city.

CREATE VIEW dept_manager_city AS
SELECT d.DepartmentName , ISNULL(e.FirstName+' '+e.LastName,'Manager ID is 0') 'Name',l.City FROM Departments AS d
LEFT JOIN Employees AS e
ON d.ManagerID = e.EmployeeID
JOIN Locations AS l
ON d.LocationID = l.LocationID --First

SELECT * FROM dept_manager_city --Second

DROP VIEW dept_manager_city --DROP







--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

CREATE VIEW dep_managersalary AS 
SELECT d.DepartmentName , (e.FirstName+' '+e.LastName) 'Name' ,e.HireDate,e.Salary FROM Departments AS d
JOIN Employees AS e
ON d.ManagerID = e.EmployeeID
WHERE DATEDIFF(YY,e.HireDate,GetDate()) > 15 -- First

SELECT * FROM dep_managersalary -- Second

DROP VIEW dep_managersalary -- DROP