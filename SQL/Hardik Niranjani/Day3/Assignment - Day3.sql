--(1)--
--Write a query that displays the FirstName and the length of the FirstName 
--for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. 
--Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT FirstName, LEN(FirstName) "Length" FROM Employees 
	WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%' ORDER BY FirstName



--(2)--
--Write a query to display the FirstName and Salary for all employees. 
--Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FirstName, CONCAT(REPLICATE('$', 1),' ',Salary) "SALARY"  FROM Employees
	



--(3)--
--Write a query to display the employees with their code, first name, last name and 
--hire date who hired either on seventh day of any month or seventh month in any year.

SELECT FirstName, EmployeeID, LastName, HireDate FROM Employees 
		WHERE HireDate LIKE '_____07___' OR HireDate LIKE '_%07'



--(4)--
--Write a query to display the length of first name for employees 
--where last name contains character ‘c’ after 2nd position.

SELECT FirstName, LastName FROM Employees WHERE CHARINDEX('c', LastName)>2
--OR
SELECT LEN(FirstName) "FirstName", LastName FROM Employees WHERE CHARINDEX('c', LastName)>2




--(5)--
--Write a query to extract the last 4 character of PhoneNumber.
SELECT RIGHT(PhoneNumber, 4) as 'Ph.No.' FROM Employees



--(6)--
--Write a query to update the portion of the PhoneNumber in the employees table, 
--within the phone number the substring ‘124’ will be replaced by ‘999’.

UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber, '124','999') WHERE PhoneNumber LIKE '%124%'
SELECT * FROM Employees


--(7)--
--Write a query to calculate the age in year.
SELECT HireDate, DATEDIFF(YEAR, HireDate, GetDate()) "Age" FROM Employees


--(8)--
--Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT DISTINCT(DATEADD(DD, 1- DATEPART(DW,HireDate), HireDate)) "Distint Monday" FROM Employees



--(9)--
--Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName, HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30' 


--(10-11)--
--Write a query to display the current date in the following format.
--Sample output : 12:00 AM Sep 5, 2014

SELECT FORMAT (GETDATE(), 'hh:mm tt MMM dd, yyyy') as date


--(12)--
--Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName, LastName FROM Employees WHERE MONTH(HireDate) = 6


--(13)--
--Write a query to get first name, hire date and experience of the employees.

 SELECT FirstName, HireDate, 
	CONVERT(varchar(3),DATEDIFF(MONTH, HireDate, GETDATE())/12) +' years '+
    CONVERT(varchar(2),DATEDIFF(MONTH, HireDate, GETDATE()) % 12)+ ' months' 
    AS EXPERIENCE FROM Employees



--(14)--
--Write a query to get first name of employees who joined in 1987.

SELECT FirstName, HireDate FROM Employees WHERE YEAR(HireDate)=1987