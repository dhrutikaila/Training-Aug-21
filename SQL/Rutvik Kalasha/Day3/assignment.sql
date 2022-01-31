/*Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName*/

SELECT 'First Name' = FirstName,'Name Length' = LEN(FirstName) 
FROM Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%'  ORDER BY FirstName;

/*Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.*/

SELECT FirstName,'SALARY' = RIGHT(REPLICATE('$',10-LEN(Salary)) + CAST(Salary AS VARCHAR),10) FROM Employees;

/*Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.*/

SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(dd,HireDate)=07 OR DATEPART(MM,HireDate)=07 ORDER BY HireDate;

/*Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.*/
SELECT LEN(FirstName) FROM EMPLOYEES WHERE CHARINDEX('c',LastName)>2;

/*Write a query to extract the last 4 character of PhoneNumber.*/

SELECT RIGHT (PhoneNumber,4) FROM Employees;

/*Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.*/

UPDATE Employees SET PhoneNumber=REPLACE(PhoneNumber,124,999);

/*Write a query to calculate the age in year.*/

SELECT DATEDIFF(yyyy,'2000-04-05',GETDATE());

/*Write a query to get the distinct Mondays from HireDate in employees tables.*/

SELECT HireDate FROM Employees WHERE DATENAME(WEEKDAY,HireDate)='MONDAY';

/*Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’*/

SELECT FirstName, HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01 00:00:00' AND '1987-07-30 23:59:59';

/*Write a query to display the current date in the following format.*/

SELECT 'Current date' =FORMAT( GETDATE(),'hh:mm tt MMMM dd,yyyy' );

/*Write a query to get the FirstName, LastName who joined in the month of June.*/

SELECT FirstName, LastName FROM Employees WHERE MONTH(HireDate) = 6;

/*Write a query to get first name, hire date and experience of the employees.*/

SELECT FirstName,HireDate,'Experience'= DATEDIFF(yy,HireDate,GETDATE()) 
FROM Employees;

/*Write a query to get first name of employees who joined in 1987.*/
SELECT FirstName, HireDate FROM Employees WHERE YEAR(HireDate)=1987;