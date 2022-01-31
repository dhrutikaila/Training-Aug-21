/*Get all employee details from the Employee table*/

SELECT * FROM employees;

/*Get FirstName, LastName from Employees table*/

SELECT FirstName,LastName FROM employees;

/*Get FirstName from Employees table using alias name “Employee Name”*/

SELECT FirstName AS 'Employee Name' FROM employees;

/*Get employee details from Employees table whose Employee Name is “Steven”*/

SELECT * FROM employees WHERE FirstName = 'Steven';

/*Get employee details from Employees table whose Employee Name are “Neena” and “Lex”*/ 

SELECT * FROM employees WHERE FirstName = 'Neena' OR FirstName='Lex';

/*Get employee details from Employees table whose Employee name are not “Neena” and “Neena” */

SELECT * FROM employees WHERE FirstName <> "Neena" AND FirstName <> "Neena"; 

/* Get employee details from Employees table whose Salary between 5000 and 8000*/

SELECT * FROM employees WHERE Salary BETWEEN 5000 AND 8000;

/*Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).*/

SELECT CONCAT(FirstName," ",LastName) AS Names, Salary,(Salary * 0.12 ) AS PF FROM employees;

/*Get employee details from Employees table whose FirstName starts with ‘N’ */

SELECT * FROM employees WHERE FirstName LIKE 'N%';

/*Write a query to get unique department ID from Employees table*/

SELECT DISTINCT DepartmentID FROM employees;

/*Write a query to get all employee details from the employee table order by FirstName, descending.*/

SELECT * FROM employees ORDER BY FirstName DESC;

/*Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.*/

SELECT EmployeeID, CONCAT(FirstName," ",LastName) AS Names,Salary FROM employees ORDER BY Salary ASC;

/*Select TOP 2 salary from employee table */

SELECT Salary FROM employees ORDER BY Salary DESC LIMIT 2;



