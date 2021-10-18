SELECT * FROM Employees

--1-Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName
SELECT FirstName, LEN(FirstName) AS 'Lenght of FirstName' 
FROM Employees
WHERE LEFT(Firstname,1) IN('A','J','M')
ORDER BY FirstName

--2-Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT FirstName, CONCAT('$', STR(Salary, 10, 2)) AS 'Modified Salary'
FROM Employees

SELECT FirstName, CONCAT('$', REPLICATE(0, (11 - LEN(Salary))), Salary) AS 'Modified Salary'
FROM Employees

--3-Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employees
WHERE DATEPART(dd, HireDate) = 7 OR DATEPART(MM, HireDate) = 7

--4-Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
SELECT LEN(FirstName) AS 'Length of FirstName'
FROM Employees
WHERE LastName LIKE '__c%'

--5-Write a query to extract the last 4 character of PhoneNumber.
SELECT RIGHT(PhoneNumber, 4) AS 'PhoneNumber'
FROM Employees

--6-Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
SELECT REPLACE(CAST(PhoneNumber AS VARCHAR), '124', '999') AS 'PhoneNumber'
FROM Employees

--7-Write a query to calculate the age in year.
SELECT Firstname, DATEDIFF(yyyy, HireDate, GETDATE()) AS 'Age'
FROM Employees

--8-Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT FirstName, HireDate
FROM Employees
WHERE DATEPART(WEEKDAY, HireDate) = 2

--9-Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT FirstName, HireDate
FROM Employees
WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

--10-Write a query to display the current date in the following format.
SELECT FirstName, FORMAT(HireDate, 'hh:mm tt MMM dd, yyyy') AS 'HireDate'
FROM Employees

--11-Write a query to get the FirstName, LastName who joined in the month of June.
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE DATEPART(MONTH, HireDate) = 6

--12-Write a query to get first name, hire date and experience of the employees.
SELECT FirstName, HireDate, DATEDIFF(yyyy, HireDate, GETDATE()) AS 'Experience'
FROM Employees

--13-Write a query to get first name of employees who joined in 1987.
SELECT FirstName, HireDate
FROM Employees
WHERE DATEPART(yyyy, HireDate) = 1987


