SELECT * FROM Employees
SELECT * FROM Jobs
SELECT * FROM Departments

SELECT Employees.EmployeeID, Jobs.JobTitle FROM Employees INNER JOIN Jobs ON Employees.JobId = Jobs.JobId

SELECT Employees.EmployeeID, Jobs.JobTitle, Employees.FirstName, Departments.DepartmentName FROM ((Employees 
INNER JOIN Jobs ON Employees.JobId = Jobs.JobId)
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID)

SELECT Employees.FirstName, Jobs.JobTitle FROM Employees LEFT JOIN Jobs ON Employees.JobId = Jobs.JobId

SELECT Employees.EmployeeID, Jobs.JobTitle FROM Employees RIGHT JOIN Jobs ON Employees.JobId = Jobs.JobId
ORDER BY Employees.EmployeeID

SELECT Employees.EmployeeID, Jobs.JobTitle FROM Employees FULL JOIN Jobs ON Employees.JobId = Jobs.JobId
ORDER BY Employees.EmployeeID





