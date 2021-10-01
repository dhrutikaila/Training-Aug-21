/*
1. Write a query that displays the FirstName and the length of the FirstName for all

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

*/

SELECT LEN(FirstName) FROM EMPLOYEES WHERE CHARINDEX('c',LastName)>2


/*
5.Write a query to extract the last 4 character of PhoneNumber.
*/

SELECT 'LAST 4 DIGITS' = RIGHT(PhoneNumber,4) FROM Employees



/*

*/

UPDATE Employees
SET PhoneNumber=REPLACE(PhoneNumber,124,999)



/*
7.Write a query to calculate the age in year.
*/

SELECT DATEDIFF(yyyy,'2000-04-05',GETDATE())



/*

*/

SELECT HireDate FROM Employees 
WHERE DATENAME(WEEKDAY,HireDate)='MONDAY'



/*

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