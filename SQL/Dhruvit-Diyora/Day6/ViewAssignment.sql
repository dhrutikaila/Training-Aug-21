--task-1-Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employee WHERE EXISTS (SELECT * FROM Incentives)

--task-2-Find Salary of the employee whose salary is more than Roy Salary
SELECT * FROM Employee WHERE Salary > (SELECT Salary FROM Employee WHERE FirstName='Roy')

--task-3-Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW SalaryView  
AS  
SELECT E.FirstName,E.LastName,E.Salary,E.JoiningDate,I.IncentiveDate,I.IncentiveAmount 
FROM Employee E FULL OUTER JOIN Incentives I 
ON  I.EmployeeRefID=EmployeeID
GO
SELECT * FROM SalaryView

--task-4-Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW SalaryViewGreat  
AS  
SELECT E.FirstName,E.LastName,E.Salary,E.JoiningDate,I.IncentiveDate,I.IncentiveAmount 
FROM Employee E JOIN Incentives I 
ON  I.EmployeeRefID=EmployeeID
WHERE I.IncentiveAmount>3000
GO
SELECT * FROM SalaryViewGreat

--task-5-Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW EmployeesView
AS
SELECT CONCAT(E.FirstName,' ',E.LastName) AS Name,E.JobId,E.DepartmentID,D.DepartmentName 
FROM Employees E FULL JOIN Departments D ON D.DepartmentID=E.DepartmentID
JOIN Locations L ON L.LocationID=D.LocationID
WHERE L.City='London'
GO
SELECT * FROM EmployeesView


--task-6-Create a View to get the department name and number of employees in the department.
CREATE VIEW DepartmentView
AS
SELECT DepartmentName,COUNT(EmployeeID) AS TotalEmployees FROM Employees E JOIN Departments D ON D.DepartmentID=E.DepartmentID GROUP BY DepartmentName
SELECT * FROM DepartmentView

--task-7-Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
CREATE VIEW JobHistoryView
AS
SELECT E.EmployeeID,E.JobId,DATEDIFF(DAY,J.StartDate,J.EndDate) AS DAYS FROM Employees E JOIN JobHistory J ON J.EmployeeID=E.EmployeeID 
SELECT * FROM JobHistoryView

--task-8-Write a View to display the department name, manager name, and city.
CREATE VIEW DepartmentsView
AS
SELECT D.DepartmentName,CONCAT(E.FirstName,' ',E.LastName) AS Name,City FROM Departments D JOIN Employees E ON D.ManagerID=E.EmployeeID JOIN Locations L ON L.LocationID=D.LocationID
SELECT * FROM DepartmentsView

--task-9-Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW ManagerView
AS
SELECT D.DepartmentName,CONCAT(E.FirstName,' ',E.LastName) AS Name FROM Departments D JOIN Employees E ON D.ManagerID=E.EmployeeID
WHERE DATEDIFF(YEAR, E.HireDate, GetDate()) >15
SELECT * FROM ManagerView