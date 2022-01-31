USE db2

/* Q1
Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters 
‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName
*/
SELECT 'fname' = FirstName, 'len' = LEN(FirstName) from dbo.Employees WHERE FirstName LIKE '[AJM]%'


-- Q2 Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FirstName , SALARY = REPLICATE('$', 10-LEN(Salary))+CAST(Salary AS varchar(10)) FROM dbo.Employees


-- Q3 Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT EmployeeID,FirstName,LastName,HireDate FROM dbo.Employees WHERE MONTH(HireDate) = 7 OR DAY(HireDate) = 7


-- Q4 Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT 'fnameLen' = LEN(FirstName),FirstName,LastName FROM dbo.Employees WHERE (SELECT CHARINDEX('c',LastName))>2


-- Q5 Write a query to extract the last 4 character of PhoneNumber.

SELECT 'Last4' = RIGHT(PhoneNumber,4) FROM dbo.Employees


-- Q6 Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

SELECT 'ReplacedPhoneNo' = (REPLACE(PhoneNumber,124,999)) FROM dbo.Employees


-- Q7 Write a query to calculate the age in year.

SELECT DATEDIFF(YEAR,'2000-12-19',GETDATE())

SELECT DATEDIFF(MM,'2000-12-19',GETDATE())

SELECT DATEDIFF(DAY,'2000-12-19',GETDATE())


-- Q8 Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT DISTINCT DATENAME(DAYOFYEAR,HireDate),HireDate FROM dbo.Employees WHERE DATENAME(WEEKDAY,HireDate) = 'Monday'

SELECT DISTINCT HireDate FROM dbo.Employees WHERE DATENAME(WEEKDAY,HireDate) = 'Monday'


-- Q9 Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName,HireDate FROM dbo.Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'


-- Q10 Write a query to display the current date in the following format.
-- Sample output : 12:00 AM Sep 5, 2014
SELECT FORMAT(getDate(),'hh:mm tt MMM dd, yyyy')


-- Q11 Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName,LastName FROM dbo.Employees WHERE DATENAME(MONTH,HireDate) = 'June'


-- Q12 Write a query to get first name, hire date and experience of the employees

SELECT FirstName,LastName, 'YOE' = DATEDIFF(YEAR,HireDate,GETDATE()) FROM dbo.Employees

SELECT FirstName,LastName, 'YOE' = DATEDIFF(MONTH,HireDate,GETDATE()) FROM dbo.Employees


-- Q13 Write a query to get first name of employees who joined in 1987.

SELECT FirstName FROM dbo.Employees WHERE YEAR(HireDate) = 1987

