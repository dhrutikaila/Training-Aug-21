/*
1. Write a query that displays the FirstName and the length of the FirstName for all
employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an 
appropriate label. Sort the results by the employees’ FirstName
*/

SELECT 'First Name' = FirstName,'Name Length' = LEN(FirstName) 
FROM Employees WHERE (FirstName LIKE '[A,J,M]%')  ORDER BY FirstName


/*
2.Write a query to display the FirstName and Salary for all employees. 
Format the salary to be 10 characters long, left-padded with the $ symbol. 
Label the column SALARY.
*/

SELECT firstname,'SALARY' = RIGHT(REPLICATE('$',10-LEN(Salary)) + 
CAST(Salary as varchar),10) 
from Employees


/*
3.Write a query to display the employees with their code, first name, last name 
and hire date who hired either on seventh day of any month or seventh month in
any year.
*/

SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees 
WHERE
DATEPART(dd,HireDate)=07
OR
DATEPART(MM,HireDate)=07 
ORDER BY HireDate


/*
4.Write a query to display the length of first name for employees where 
last name contains character ‘c’ after 2nd position.
*/

SELECT LEN(FirstName) FROM EMPLOYEES WHERE CHARINDEX('c',LastName)>2


/*
5.Write a query to extract the last 4 character of PhoneNumber.
*/

SELECT 'LAST 4 DIGITS' = RIGHT(PhoneNumber,4) FROM Employees



/*
6.Write a query to update the portion of the PhoneNumber in the employees table, 
within the phone number the substring ‘124’ will be replaced by ‘999’.
*/

UPDATE Employees
SET PhoneNumber=REPLACE(PhoneNumber,124,999)



/*
7.Write a query to calculate the age in year.
*/

SELECT DATEDIFF(yyyy,'2000-04-05',GETDATE())



/*
8.Write a query to get the distinct Mondays from HireDate in employees tables.
*/

SELECT HireDate FROM Employees 
WHERE DATENAME(WEEKDAY,HireDate)='MONDAY'



/*
9.Write a query to get the FirstName and HireDate from Employees table 
where HireDate between ‘1987-06-01’ and ‘1987-07-30’
*/

SELECT FirstName,HireDate FROM EMPLOYEES 
WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'




/*
10.
*/

SELECT 'Current date' =FORMAT( getdate(),'hh:mm tt MMMM dd,yyyy' )



/*
12.Write a query to get the FirstName, LastName who joined in the month of June.
*/

SELECT FirstName,LastName FROM Employees WHERE DATENAME(MM,HireDate)='June'


/*
13.Write a query to get first name, hire date and experience of the employees.
*/

SELECT FirstName,HireDate,'Experience'= DATEDIFF(yy,HireDate,GETDATE()) 
FROM Employees



/*
14.Write a query to get first name of employees who joined in 1987.
*/

SELECT FirstName FROM Employees WHERE DATEPART(yyyy,HireDate)=1987