--CORRELATED Subqueries
    --means subqueries dependent to outer query

SELECT FirstName,(SELECT DepartmentName FROM Departments WHERE Departments.DepartmentID=Employees.DepartmentID)
FROM Employees 
