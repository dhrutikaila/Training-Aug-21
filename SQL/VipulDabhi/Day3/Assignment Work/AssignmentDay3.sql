--01  Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName
SELECT 'First Name' = FirstName,'Name Length' = LEN(FirstName) 
FROM Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J' OR FirstName LIKE 'M%'  ORDER BY FirstName;

--02 Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT firstname,'SALARY' = RIGHT(REPLICATE('$',10-LEN(Salary)) + 
CAST(Salary AS VARCHAR),10) 
from Employees

--03 Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(DD,HireDate)=07
OR DATEPART(MM,HireDate)=07 ORDER BY HireDate

--04 Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
SELECT LEN(FirstName) FROM EMPLOYEES WHERE FirstName LIKE '__c%';


--05 Write a query to extract the last 4 character of PhoneNumber.
SELECT RIGHT (PhoneNumber,4) FROM Employees;

--06 Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber,'124','999');


--07 Write a query to calculate the age in year.
SELECT DATEDIFF(yyyy,'2000-12-01',GETDATE());


--08 Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT HireDate FROM Employees WHERE DATENAME(DW,HireDate) = 'MONDAY';


--09 Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT FirstName, HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01 00:00:00' AND '1987-07-30 00:00:00';


--10 Write a query to display the current date in the following format.Sample output : 12:00 AM Sep 5, 2014
SELECT 'Current Date' = FORMAT( GETDATE(),'hh:mm tt MMMM dd,yyyy' );


--11 Write a query to get the FirstName, LastName who joined in the month of June.
SELECT FirstName, LastName FROM Employees WHERE DATENAME(MM,HireDate) = 'june' ;


--12 Write a query to get first name, hire date and experience of the employees.
SELECT FirstName,HireDate,DATEDIFF(YY,HireDate,GETDATE()) AS Expirences FROM Employees;

--13 Write a query to get first name of employees who joined in 1987.
SELECT FirstName, HireDate FROM Employees WHERE YEAR(HireDate)=1987;