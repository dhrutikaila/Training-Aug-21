SELECT * FROM Employees
SELECT * FROM Incentive
SELECT FirstName, Salary FROM Employees
WHERE Salary < (SELECT AVG(Salary) FROM Employees)

SELECT FirstName, Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE FirstName = 'john')	

--Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employees WHERE EXISTS (SELECT * FROM Incentive WHERE EmployeeID = Employees.EmployeeID)

--Find Salary of the employee whose salary is more than Roy Salary
UPDATE Employees SET Salary = 10000 WHERE EmployeeID = 101
SELECT * FROM Employees WHERE Salary > (SELECT Salary FROM Employees WHERE FirstName = 'Roy') 


--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW Asin3
AS
(
SELECT Employees.FirstName, Employees.LastName, Employees.Salary, Employees.JoiningDate, Incentive.IncentiveDate, Incentive.IncentiveAmount 
FROM Employees JOIN Incentive ON Employees.EmployeeID = Incentive.EmployeeID 
)
SELECT * FROM Asin3

/*Create a view to select first_name, incentive amount from employee and 
incentives table for those employees who have incentives and incentive amount greater than 3000
*/

CREATE VIEW Asin4
AS
(
SELECT Employees.FirstName, Incentive.IncentiveAmount 
FROM Employees JOIN Incentive ON Employees.EmployeeID = Incentive.EmployeeID 
WHERE Incentive.IncentiveAmount > 3000
)
SELECT * FROM Asin4

--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

CREATE VIEW Asin5
AS
(
SELECT CONCAT(Employees.FirstName,' ', Employees.LastName) AS Names, Employees.JobId, 
Employees.DepartmentID, Departments.DepartmentName FROM Employees 
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID 
JOIn Locations ON Locations.LocationID = Departments.LocationID 
WHERE Locations.City = 'London'
)

SELECT * FROM Asin5

--Create a View to get the department name and number of employees in the department.
CREATE VIEW Asin6
AS
(
SELECT DepartmentName AS 'Department Name', 
COUNT(*) AS 'No of Employees' FROM Departments 
INNER JOIN Employees ON Employees.DepartmentID = Departments.DepartmentID 
GROUP BY Departments.DepartmentID, DepartmentName
)
SELECT * FROM Asin6
--We don't use ORDER BY Function When We Createing view But we can use when we displaying View
SELECT * FROM Asin6 ORDER BY [Department Name]

--Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
CREATE VIEW Asin7
AS
(
SELECT JobHistory.EmployeeID, Jobs.JobTitle, DATEDIFF(DAY, JobHistory.EndDate, JobHistory.StartDate) AS Days 
FROM JobHistory 
JOIN Jobs ON JobHistory.JobID = Jobs.JobId 
WHERE DepartmentID = 90
)
SELECT * FROM Asin7

--Write a View to display the department name, manager name, and city.

CREATE VIEW Asin8
AS
(
SELECT Departments.DepartmentName, Departments.ManagerID, Locations.City FROM Departments 
JOIN Locations ON Departments.LocationID = Locations.LocationID
)
SELECT * FROM Asin8


--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

SELECT d.DepartmentName, CONCAT(e.FirstName,' ', e.LastName), e.JoiningDate, e.Salary, DATEDIFF(YEAR, GETDATE(), e.JoiningDate)
FROM Employees e JOIN Departments d 
ON e.ManagerID = d.ManagerID 
WHERE DATEDIFF(YEAR, GETDATE(), e.JoiningDate) > 15



