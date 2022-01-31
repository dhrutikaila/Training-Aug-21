-- select firstname and EmployeeID from Employee whose Department name is administration

SELECT FirstName,EmployeeID FROM Employees e JOIN Departments d
ON E.DepartmentID=D.DepartmentID WHERE DepartmentName='Administration'

---select  EmployeeID from Employee whose from Tokyo


SELECT EmployeeID FROM Employees e JOIN Departments d
ON e.DepartmentID=d.DepartmentID
JOIN Locations l ON d.LocationID=l.LocationID
WHERE City='Tokyo'

--select FirstName from Employee whose jobid is AC_ACCOUNT


SELECT FirstName FROM Employees e JOIN JobHistory j
On  e.EmployeeID=j.EmployeeID
WHERE j.JobID='AC_ACCOUNT'