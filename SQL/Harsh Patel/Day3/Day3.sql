/*1)Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts
with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName*/

	SELECT FirstName AS 'NAME',LEN(FirstName) AS 'LENGTH' FROM Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%' ORDER BY FirstName ASC

/*2)Write a query to display the FirstName and Salary for all employees.
Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.*/

	SELECT Firstname, CONCAT('$',SPACE(1),CAST(CAST(Salary AS DECIMAL(10,5)) AS varchar)) AS 'SALARY' FROM Employees

3)
/*Write a query to display the employees with their code, first name, last name and 
hire date who hired either on seventh day of any month or seventh month in any year.*/

SELECT EmployeeID 'Code',FirstName,LastName,HireDate FROM Employees WHERE CAST(DATEPART(DD,HireDate) AS INT)=7 OR CAST(DATEPART(MM,HireDate) AS INT)=7

--4)Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT LEN(FirstName) FROM Employees WHERE LastName LIKE ('--C%')


--5) Write a query to extract the last 4 character of PhoneNumber.

SELECT RIGHT(CAST(PhoneNumber AS VARCHAR),4) AS 'Number' FROM Employees

/*6)Write a query to update the portion of the PhoneNumber in the employees table, 
within the phone number the substring ‘124’ will be replaced by ‘999’.*/

SELECT REPLACE(CAST(PhoneNumber AS VARCHAR),'124','999') AS 'Number' FROM Employees

--7) Write a query to calculate the age in year.

SELECT FirstName, DATEDIFF(YY,HireDate,GETDATE()) AS 'AGE' FROM Employees

--8) Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT  HireDate FROM Employees WHERE DATEPART(WEEKDAY,HireDate) = 2

--9)Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

--10)Write a query to display the current date in the following format.Sample output : 12:00 AM Sep 5, 2014

SELECT FORMAT(HireDate,'hh:mm tt MMM d, yyyy') FROM Employees

--11)Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName,LastName FROM Employees WHERE DATEPART(MM,HireDate)=6

--12)Write a query to get first name, hire date and experience of the employees.

SELECT FirstName,LastName, DATEDIFF(YY,HireDate,GETDATE()) AS EXPERIENCE FROM EMPLOYEES

--13)Write a query to get first name of employees who joined in 1987. 
SELECT FirstName FROM Employees WHERE DATEPART(YY,HireDate)=1987
 