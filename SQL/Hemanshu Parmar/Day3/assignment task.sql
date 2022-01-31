
----------------------------------------------------------------------Day3 Assignment Statements----------------------------------------------------------

Task1 :
Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

Soln:
SELECT FirstName As "Name",LEN(FirstName) As "Length"
FROM Employees
WHERE FirstName LIKE 'J%'
OR FirstName LIKE 'M%'
OR FirstName LIKE 'A%'
ORDER BY FirstName 

Task2 :
Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

Soln:
Select FirstName AS 'First Name',CONCAT(CAST(Salary AS CHAR(10)),'$') AS 'Salary' FROM Employees 
Select FirstName AS 'First Name',CONCAT(REPLICATE('$', 10-Len(Salary)),Cast(Salary AS varchar)) FROM Employees 

Task3 :
Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

Soln:
select EmployeeID,FirstName,LastName,HireDate from Employees where DATEPART(Day,HireDate)='07' OR DATEPART(Month,HireDate)='07'

Task4 :
Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

Soln:
select Len(FirstName) AS 'Length' from Employees where CHARINDEX('c', LastName, 2)>0
OR
select Len(FirstName) AS 'Length' from Employees where LastName like ('_%c%')

Task 5:
Write a query to extract the last 4 character of PhoneNumber.

Soln:
select RIGHT(PhoneNumber,4) AS 'Phone Number' from Employees

Task 6:
Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

Soln:
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber, '124', '999') WHERE PhoneNumber LIKE '%124%'

Task 7:
Write a query to calculate the age in year.

Soln:
select DATEDIFF(yyyy,'1999-09-07',GetDate())

Task 8:
Write a query to get the distinct Mondays from HireDate in employees tables.

Soln:
select EmployeeID,FirstName,LastName,HireDate from Employees where DATEPART(WEEKDAY,HireDate)='02'
OR
select EmployeeID,FirstName,LastName,HireDate from Employees where DATENAME(WEEKDAY,HireDate)='Monday'

Task 9:
Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
 
Soln:
select FirstName,HireDate from Employees where HireDate between '1987-06-01' and '1987-07-30'

Task 10:
Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014

Soln:
SELECT FORMAT (getdate(), 'hh:mm tt MMM dd, yyyy') as time

Task 11:
Write a query to get the FirstName, LastName who joined in the month of June.

Soln:
select FirstName,LastName from Employees where DATEPART(MONTH,HireDate)='06'
OR
select FirstName,LastName from Employees where DATENAME(MONTH,HireDate)='June'

Task 12:
Write a query to get first name, hire date and experience of the employees.

Soln:
select FirstName AS 'Name',HireDate,CONCAT(DATEDIFF(dd,HireDate,GetDate())/365,' ', 'Year',' ',DATEDIFF(MM,HireDate,GetDate())%12,' ','Month') AS 'Experience' from Employees

Task 13:
Write a query to get first name of employees who joined in 1987.

Soln:
select FirstName from Employees where DATENAME(YEAR,HireDate)='1987'
OR
select FirstName from Employees where DATEPART(YEAR,HireDate)='1987'

