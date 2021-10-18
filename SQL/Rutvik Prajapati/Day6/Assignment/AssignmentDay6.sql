-- Assignment:

-- Note: Refer existing employee Table

-- Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employees WHERE EXISTS (SELECT * FROM Incentives)

-- Find Salary of the employee whose salary is more than Roy Salary
SELECT FirstName,Salary FROM Employees 
WHERE Salary>(SELECT Salary FROM Employees WHERE FirstName = 'Roy')


-- Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW V1 AS
SELECT E.FirstName,E.LastName,E.Salary,E.HireDate AS JoiningDate,I.IncentiveDate,I.IncentiveAmount
FROM Employees AS E
INNER JOIN Incentives AS I ON E.EmployeeID = I.EmployeeId

-- Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW V2 AS
SELECT E.FirstName,I.IncentiveAmount
FROM Employees AS E
INNER JOIN Incentives AS I ON E.EmployeeID = I.EmployeeId
WHERE I.IncentiveAmount>3000

--(Note refer tables from sql supported files)

--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW V3 AS
SELECT E.FirstName+' '+LastName AS Names,E.JobId,D.DepartmentID,D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D ON E.DepartmentID =  D.DepartmentID
WHERE D.LocationID = (SELECT LocationID FROM Locations WHERE City='London')

--Create a View to get the department name and number of employees in the department.
CREATE VIEW V4 AS
SELECT D.DepartmentName,COUNT(E.EmployeeID) AS NumOfEmp
FROM Employees AS E
INNER JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName

--Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID,JobID AS JobTitle,DATEDIFF(DD,StartDate,EndDate) AS NumOfDays
FROM JobHistory
WHERE DepartmentID = 90

--Write a View to display the department name, manager name, and city.
CREATE VIEW V5 AS
SELECT D.DepartmentName,E.FirstName AS ManagerName,L.City
FROM Departments AS D
INNER JOIN Employees AS E ON E.EmployeeID = D.ManagerID
INNER JOIN Locations AS L ON D.LocationID=L.LocationID;

--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW V6 AS
SELECT D.DepartmentName,E.FirstName+' '+E.LastName AS ManagerName,E.HireDate,E.Salary
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID=D.DepartmentID
WHERE DATEDIFF(YY,E.HireDate,GETDATE()) > 15