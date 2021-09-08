--Assignment

--Basic Select Queries:

--[1] Get all employee details from the Employee table

SELECT * FROM Employees

--[2] Get FirstName from Employees table using alias name “Employee Name”

SELECT FirstName,LastName FROM Employees

--[3] Get FirstName from Employees table using alias name “Employee Name”

SELECT FirstName AS 'Employee Name' FROM Employees

--[4] Get employee details from Employees table whose Employee Name is “Steven”

SELECT * FROM Employees WHERE FirstName='Steven'

--[5] Get employee details from Employees table whose Employee Name are “Neena” and “Lex”

SELECT * FROM Employees WHERE FirstName='Neena' OR FirstName='Lex'

--[6] Get employee details from Employees table whose Employee name are not “Neena” and “Neena”

SELECT * FROM Employees WHERE NOT FirstName='Neena' 

--[7] Get employee details from Employees table whose Salary between 5000 and 8000

SELECT * FROM Employees WHERE Salary BETWEEN 5000 AND 8000

--[8] Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).

SELECT FirstName, LastName, Salary, (Salary * 0.12) AS PF FROM employees

--[9] Get employee details from Employees table whose FirstName starts with ‘N’

SELECT * FROM Employees WHERE FirstName LIKE 'N%' 

--[10] Write a query to get unique department ID from Employees table

SELECT DISTINCT DepartmentID FROM Employees

--[11] Write a query to get all employee details from the employee table order by FirstName, descending.

SELECT * FROM Employees ORDER BY FirstName DESC

--[12] Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.

SELECT EmployeeID,(FirstName +' ' + LastName) AS Names,Salary AS names FROM Employees ORDER BY Salary ASC

--[13] Select TOP 2 salary from employee table

SELECT TOP(2) Salary FROM Employees