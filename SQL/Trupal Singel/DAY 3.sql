

/* 1. Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. 
Give each column an appropriate label. Sort the results by the employees’ FirstName */ 

SELECT FirstName "Name", LEN(FirstName) "Length" FROM employees
WHERE FirstName LIKE 'J%' OR FirstName LIKE 'M%' OR FirstName LIKE 'A%' ORDER BY FirstName 

/* 2. Write a query to display the FirstName and Salary for all employees. 
Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY. */ 

SELECT FirstName,Salary, CONCAT(REPLICATE('$', 10 - LEN(Salary)), cast(Salary as varchar)) FROM employees

/* 3. Write a query to display the employees with their code, first name, last name and hire date 
who hired either on seventh day of any month or seventh month in any year. */

SELECT EmployeeID,FirstName+'  '+LastName AS NAME,HireDate FROM Employees 
WHERE DATEPART(Day,HireDate)='07' OR DATEPART(Month,HireDate)='07'

/* 4. Write a query to display the length of first name for employees where 
last name contains character ‘c’ after 2nd position. */

SELECT FirstName,LastName, LEN(FirstName) FROM Employees WHERE LastName LIKE ('__%c%')

/* 5. Write a query to extract the last 4 character of PhoneNumber.  */ 

SELECT '******' + RIGHT(PhoneNumber,4) AS Mobile_Number FROM Employees

/* 6. Write a query to update the portion of the PhoneNumber in the employees table,
within the phone number the substring ‘124’ will be replaced by ‘999’. */

UPDATE employees SET PhoneNumber = REPLACE(PhoneNumber, '124', '999') WHERE PhoneNumber LIKE '%124%';

/* 7. Write a query to calculate the age in year.  */

SELECT DATEDIFF(YYYY,'1998-04-12',GETDATE())

/* 8. Write a query to get the distinct Mondays from HireDate in employees tables. */ 

SELECT  EmployeeID, FirstName+' '+LastName AS NAME, HireDate FROM Employees
WHERE DATENAME(WEEKDAY,HireDate)='MONDAY'

/* 9. Write a query to get the FirstName and HireDate from Employees table 
where HireDate between ‘1987-06-01’ and ‘1987-07-30’ */ 

SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

/* 10. Write a query to display the current date in the following format. */

SELECT SYSDATETIME()

SELECT CURRENT_TIMESTAMP

/* 11. Sample output : 12:00 AM Sep 5, 2014 */ 

SELECT FORMAT(GETDATE(),'HH:MM tt - MMM dd, yyyy')

/* 12. Write a query to get the FirstName, LastName who joined in the month of June. */ 

SELECT FirstName+'  '+LastName AS NAME, HireDate FROM Employees WHERE DATENAME(MONTH, HireDate) = 'June'

/* 13. Write a query to get first name, hire date and experience of the employees.  */

SELECT FirstName, HireDate, Exp= DATEDIFF(YEAR, HireDate ,GETDATE()) FROM employees;

/* 14. Write a query to get first name of employees who joined in 1987. */ 

SELECT FirstName,HireDate FROM Employees WHERE DATENAME (yyyy,HireDate) LIKE 1987
