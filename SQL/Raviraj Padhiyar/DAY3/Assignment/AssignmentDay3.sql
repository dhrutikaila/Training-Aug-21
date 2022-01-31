--query 1
--Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName
SELECT FirstName
	,LEN(FirstName) AS NameLength
	,ROW_NUMBER() OVER (ORDER BY FirstName) AS ID
FROM Employees
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%'

--query2
--Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT FirstName,
	CONCAT(FORMAT(Salary,'C'),REPLICATE('0',10-LEN(Salary))) AS Salary
FROM Employees

--query3
--Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
SELECT EmployeeID,FirstName,LastName,HireDate
FROM Employees
WHERE DATEPART(dd,HireDate) LIKE 07 OR DATEPART(mm,HireDate) LIKE 07

--query4
--Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT LEN(FirstName) AS FirstNameLength, FirstName,LastName
FROM Employees
WHERE CHARINDEX('c',LastName,2) > 2

--query5
--Write a query to extract the last 4 character of PhoneNumber.

SELECT RIGHT(PhoneNumber,4) AS PhoneNumber FROM Employees

--query6
--Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
SELECT REPLACE(PhoneNumber,'123','999') AS PhoneNumber FROM Employees

--query7
--Write a query to calculate the age in year.
SELECT DATEPART(YYYY,GETDATE())-DATEPART(YYYY,HireDate) AS AGE
FROM Employees

--query8
--Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT HireDate
FROM Employees
WHERE DATENAME(WEEKDAY,HireDate) LIKE 'Monday'

--query9
--Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT HireDate
FROM Employees
WHERE CAST(HireDate AS varchar) between '1987-06-01' and '1987-07-30'

--query10
--Write a query to display the current date in the following format.
SELECT RIGHT(GETDATE(),7)+' '+
	DATENAME(MONTH,GETDATE())+' '+
	DATENAME(DAY,GETDATE())+', '+
	DATENAME(YYYY,GETDATE())

--query11
--Sample output : 12:00 AM Sep 5, 2014
SELECT FirstName,LastName FROM Employees
WHERE DATENAME(MONTH,HireDate) LIKE 'June'

--query12
--Write a query to get the FirstName, LastName who joined in the month of June.
SELECT FirstName,HireDate,DATEPART(YY,GETDATE())-DATEPART(YY,HireDate)AS Experience
FROM Employees

--query13
--Write a query to get first name, hire date and experience of the employees.
SELECT FirstName
FROM Employees
WHERE DATENAME(YYYY,HireDate) LIKE '1987'
