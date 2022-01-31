
----------------------------------------------------------------Select Statements---------------------------------------------------------------

Task1:
Get all employee details from the Employee table

Soln:
select * from Employees

Task2:
Get FirstName, LastName from Employees table

Soln:
select FirstName,LastName from Employees

Task3:
Get FirstName from Employees table using alias name “Employee Name”

Soln:
select FirstName 'Employee Name' from Employees

Task4:
Get employee details from Employees table whose Employee Name is “Steven”

Soln:
select * from Employees where FirstName='Steven'

Task5:
Get employee details from Employees table whose Employee Name are “Neena” and “Lex”

Soln:
select * from Employees where FirstName='Neena' OR FirstName='Lex'

Task6:
Get employee details from Employees table whose Employee name are not “Neena” and “Nina”

Soln:
select * from Employees where FirstName!='Neena' OR FirstName!='Nina'

Task7:
Get employee details from Employees table whose Salary between 5000 and 8000

select * from Employees where Salary BETWEEN 5000 AND 8000

Task8:
Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary)

Soln:
select CONCAT(FirstName,' ', LastName) as names,Salary,(Salary*0.12) as 'PF' from Employees

Task9:
Get employee details from Employees table whose FirstName starts with ‘N’

Soln:
select * from Employees where FirstName LIKE 'N%'

Task10:
Write a query to get unique department ID from Employees table

Soln:
SELECT DISTINCT DepartmentID FROM employees;

Task11:
Write a query to get all employee details from the employee table order by FirstName, descending.

Soln:
SELECT* from Employees Order By FirstName DESC

Task12:
Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.

Soln:
SELECT EmployeeID,  CONCAT(FirstName,' ', LastName) as names, Salary from Employees Order By Salary ASC

Task13:
Select TOP 2 salary from employee table

Soln:
SELECT TOP 2 Salary from Employees 