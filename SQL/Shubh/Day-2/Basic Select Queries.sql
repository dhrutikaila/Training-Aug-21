--basic select queries

--Num1-Get all employee details from the Employee table
SELECT * FROM Employees

--Num2-Get FirstName, LastName from Employees table
SELECT FirstName,LastName FROM Employees

--Num3-Get FirstName from Employees table using alias name “Employee Name”
SELECT 'EmployeeName'= FirstName FROM Employees

--Num4-Get employee details from Employees table whose Employee Name is “Steven”
SELECT * FROM Employees WHERE FirstName= 'Steven'

--Num5-Get employee details from Employees table whose Employee Name are “Neena” and “Lex”
SELECT * FROM Employees WHERE FirstName= 'Neena' OR FirstName='Lex'

--Num6-Get employee details from Employees table whose Employee name are not “Neena” and “NIna”
SELECT * FROM Employees WHERE FirstName !=  'Neena' AND FirstName != 'Nina'

--Num7-Get employee details from Employees table whose Salary between 5000 and 8000
SELECT * FROM Employees WHERE Salary BETWEEN 5000 AND 8000

--Num8-Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).
SELECT CONCAT(FirstName, '-', LastName) AS names, Salary, (Salary*0.12) AS 'ProviFund' FROM Employees

--Num9-Get employee details from Employees table whose FirstName starts with ‘N’
SELECT * FROM Employees WHERE FirstName LIKE 'N%'

--Num10-Write a query to get unique department ID from Employees table
SELECT DISTINCT DepartmentID FROM employees;

--Num11-Write a query to get all employee details from the employee table order by FirstName, descending.
SELECT * FROM Employees ORDER BY FirstName DESC

--Num12-Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.
SELECT EmployeeID, CONCAT(FirstName, '-', LastName) AS names , Salary FROM Employees ORDER BY Salary ASC

--Num13-Select TOP 2 salary from employee table

SELECT TOP 2 Salary FROM Employees
SELECT TOP 2 Salary FROM Employees ORDER BY SALARY DESC