--------DAY-5--------
--INNER-JOIN
SELECT Employees.EmployeeID, Departments.DepartmentName  FROM Employees INNER JOIN
Departments on Employees.DepartmentID = Departments.DepartmentID

--LEFT OUTER JOIN
SELECT Employees.EmployeeID, Departments.DepartmentName  FROM Employees LEFT OUTER JOIN
Departments on Employees.DepartmentID = Departments.DepartmentID

--RIGHT OUTER JOIN
SELECT Employees.EmployeeID, Departments.DepartmentName  FROM Employees RIGHT OUTER JOIN
Departments on Employees.DepartmentID = Departments.DepartmentID

--FULL OUTER JOIN
SELECT Employees.EmployeeID, Departments.DepartmentName  FROM Employees FULL OUTER JOIN
Departments on Employees.DepartmentID = Departments.DepartmentID

--CROSS JOIN
SELECT Employees.EmployeeID, Departments.DepartmentName  FROM Employees CROSS JOIN
Departments

--SELF JOIN
SELECT mgr.EmployeeID, emp.ManagerID ,mgr.FirstName FROM Employees emp, Employees mgr CROSS JOIN
Departments
WHERE EMP.ManagerID= MGR.EmployeeID


SELECT * FROM Departments