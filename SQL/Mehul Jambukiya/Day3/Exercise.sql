USE Sqlday2;

SELECT * FROM Employees;

--Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’.
--Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT FirstName AS EmployeeName , LEN(FirstName) AS Length_of_Name FROM Employees WHERE LEFT(FirstName,1) IN('A','J','M') ORDER BY FirstName;

--Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol.
--Label the column SALARY.

SELECT FirstName, REPLICATE('$',10-LEN(Salary)) + CONVERT(VARCHAR,Salary) AS SALARY FROM Employees;

--Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or 
--seventh month in any year.

SELECT EmployeeID AS Code,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(dd,HireDate)=7 OR DATEPART(MM,HireDate)=7;

--Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT LEN(FirstName) AS Length_of_FirstName FROM Employees WHERE CHARINDEX('c',LastName,3) <> 0;

--Write a query to extract the last 4 character of PhoneNumber.

SELECT RIGHT(PhoneNumber,4) FROM Employees;

--Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber , '124', '999');

--Write a query to calculate the age in year.
CREATE TABLE Demo
(
 ID int CONSTRAINT PkID PRIMARY KEY identity(1,1),
 Name varchar(50) CONSTRAINT NameNotNull NOT NULL,
 BirthDate date CONSTRAINT BDateNotNull NOT NULL 
)
INSERT INTO Demo VALUES ('Vipul','11/09/1999'),('Brijesh','10/27/1999'),('Gautam','01/24/2000'),('Hemant','04/07/1997'),('Nilesh','06/14/2002');
SELECT * FROM Demo;
SELECT Name,BirthDate,DATEDIFF(yy,BirthDate,GETDATE()) AS Age FROM Demo;

--Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT DISTINCT FORMAT(HireDate,'D') FROM Employees WHERE DATENAME(dw,HireDate) = 'Monday';

--Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN CONVERT(DATE,'1987-06-01') AND CONVERT(DATE,'1987-07-30');

--Write a query to display the current date in the following format.
--Sample output : 12:00 AM Sep 5, 2014

SELECT CONVERT(VARCHAR,FORMAT(GETDATE(),'hh:mm tt')) + ' ' + CONVERT(VARCHAR,GETDATE(),107);

--Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName,LastName FROM Employees WHERE DATENAME(mm,HireDate) = 'June';

--Write a query to get first name, hire date and experience of the employees.

SELECT FirstName,Hiredate, CONVERT(VARCHAR,DATEDIFF(yy,HireDate, GETDATE()))+' Years' AS Experience FROM Employees;

--Write a query to get first name of employees who joined in 1987.

SELECT FirstName FROM Employees WHERE DATEPART(yy,HireDate) = 1987;