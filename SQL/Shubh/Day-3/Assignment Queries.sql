
--Query1
--Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT FirstName , LEN(FirstName) AS LeNgTh FROM Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%' ORDER BY FirstName

--Query2 
--Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FirstName,CONCAT(CAST(Salary AS VARCHAR(10)),'$') Salary FROM Employees 


--Query3
--Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
 SELECT EmployeeID 'Code', FirstName, LastName, HireDate FROM Employees WHERE DATEPART(Day,HireDate)='07' OR DATEPART(Month,HireDate)='07'

--Query4
--Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
SELECT LEN(FirstName) AS 'FirstNameLength' FROM Employees WHERE LastName like ('__%c%')

--Query5
--Write a query to extract the last 4 character of PhoneNumber.
SELECT RIGHT(PhoneNumber,4) AS 'PhoneNum.' FROM Employees

--Query6
--Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber, '124', '999') WHERE PhoneNumber LIKE '%124%';

--Query7
--Write a query to calculate the age in year.
SELECT DATEDIFF(yyyy,'1969-01-12',GETDATE())

--Query8
--Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(WEEKDAY,HireDate)='02'

--Query9
--Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

--Query10
--Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014
SELECT FORMAT (GETDATE(), 'hh:mm tt MMM dd, yyyy') AS TodayDate

--Query11
--Write a query to get the FirstName, LastName who joined in the month of June.
SELECT FirstName,LastName FROM Employees WHERE DATEPART(MONTH,HireDate)='06'

--Query12
--Write a query to get first name, hire date and experience of the employees.
SELECT FirstName, HireDate, CONCAT(DATEDIFF(dd,HireDate,GETDATE())/365,' ', 'Years',' & ',DATEDIFF(MM,HireDate,GETDATE())%12,' ','Months') AS 'Experience' FROM Employees

--Query13
--Write a query to get first name of employees who joined in 1987.
SELECT FirstName FROM Employees WHERE DATEPART(YEAR,HireDate)='1987'
