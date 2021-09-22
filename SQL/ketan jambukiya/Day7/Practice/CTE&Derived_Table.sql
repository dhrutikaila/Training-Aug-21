s

---Write a query using CTE

WITH CTE_DEP(FirstName,EmployeeID)
AS
(SELECT FirstName,EmployeeID FROM Employees WHERE 
DepartmentID =100)

SELECT * FROM CTE_DEP



WITH CTE_ID(EmployeeID)
AS
(SELECT EmployeeID FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName='Marketing')

SELECT * FROM CTE_ID ORDER BY EmployeeID


---DERIVED TABLE


SELECT * FROM(SELECT EmployeeID,FirstName,LastName,Salary  FROM Employees 
)TEMPORDER ORDER BY Salary ASC