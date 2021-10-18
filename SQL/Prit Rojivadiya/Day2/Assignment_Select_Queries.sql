use db2


-- Q1 Get all employee details from the Employee table

SELECT * FROM dbo.Employees;


-- Q2 Get FirstName, LastName from Employees table

SELECT FirstName,LastName FROM dbo.Employees;


-- Q3 Get FirstName from Employees table using alias name “Employee Name”

SELECT FirstName as EmployeeName FROM dbo.Employees;
SELECT FirstName 'EmployeeName' FROM dbo.Employees;
SELECT 'EmplyeeName' = FirstNAme FROM dbo.Employees;


-- Q4 Get employee details from Employees table whose Employee Name is “Steven”

SELECT * FROM dbo.Employees WHERE FirstName = 'Steven';


-- Q5 Get employee details from Employees table whose Employee Name are “Neena” and “Lex”

SELECT * FROM dbo.Employees WHERE FirstName IN ('Neena','Lex');


-- Q6 Get employee details from Employees table whose Employee name are not “Neena” and “Neena”

SELECT * FROM dbo.Employees WHERE FirstName NOT IN ('Neena','Lex');


-- Q7 Get employee details from Employees table whose Salary between 5000 and 8000

SELECT * FROM dbo.Employees WHERE Salary BETWEEN 5000 AND 8000;


-- Q8 Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).

SELECT (FirstName +' '+ LastName) as Names ,Salary,PF = Salary*0.12 FROM dbo.Employees;


-- Q9 Get employee details from Employees table whose FirstName starts with ‘N’

SELECT * FROM dbo.Employees WHERE FirstName LIKE 'N%';


-- Q10 Write a query to get unique department ID from Employees table

SELECT DISTINCT DepartmentID FROM dbo.Employees;


-- Q11 Write a query to get all employee details from the employee table order by FirstName, descending.

SELECT * FROM dbo.Employees	ORDER BY FirstName DESC;


-- Q12 Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.

SELECT EmployeeId,FirstName,LastName,Salary FROM dbo.Employees ORDER BY Salary ASC;


-- Q13 Select TOP 2 salary from employee table

SELECT TOP 2 Salary FROM dbo.Employees;