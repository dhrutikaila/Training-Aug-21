use test1
--1 Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName
SELECT FirstName "Name",
LEN(FirstName) "Length"
FROM employee
WHERE FirstName LIKE 'J%'
OR FirstName LIKE 'M%'
OR FirstName LIKE 'A%'
ORDER BY FirstName ;

--2 Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT FirstName ,
SALARY = REPLICATE('$', 10-LEN(Salary))+CAST(LEFT(SALARY,10) AS varchar(10)) 
FROM dbo.employee

--3 Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
 SELECT EmployeeID, FirstName,LastName,HireDate FROM Employee
WHERE HireDate LIKE '____-07-' OR HireDate LIKE '____--07'

--4 Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
SELECT FirstName ,LEN(FirstName) 'First Name Length', LastName FROM Employee
WHERE LastName LIKE '__%c%'

--5	Write a query to extract the last 4 character of PhoneNumber.
SELECT RIGHT(PhoneNumber,4) as 'ph.no.' FROM Employee;

--6 Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
UPDATE Employee
SET PhoneNumber= REPLACE(PhoneNumber,'124','999')
WHERE PhoneNumber LIKE '%124%';

--7 Write a query to calculate the age in year.
SELECT Hiredate, DATEPART(year,GETDATE())-DATEPART(year, HireDate) AS 'Years in company' FROM Employee

--8 Write a query to get the distinct Mondays from HireDate in employees tables.
set datefirst 1
SELECT  HireDate FROM Employee 
WHERE  DATEPART(WEEKDAY,HireDate) LIKE 1

--9 Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT FirstName,HireDate
FROM Employee
WHERE HireDate
BETWEEN '1987-06-01'
AND '1987-07-30';

--10  Write a query to display the current date in the following format.Sample output : 12:00 AM Sep 5, 2014
SELECT LTRIM(RIGHT(CONVERT(VARCHAR(20), GETDATE(),100),7)) +' '+
SUBSTRING(DATENAME(MONTH, GETDATE()), 1, 3)+' '+ DATENAME(DAY, GETDATE()) + ', '+ DATENAME(YEAR, GETDATE())

--11 Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName, LastName, HireDate FROM Employee
WHERE DATENAME(MONTH, Hiredate) LIKE 'JUNE'
--or
SELECT FirstName,LastName
  FROM Employee WHERE MONTH(HireDate)=6;

 --12 write a query to get first name, hire date and experience of the employees.
 SELECT FirstName, LastName, HireDate,  Experience=DATEDIFF(YEAR, HireDAte, GETDATE()) FROM Employee

 --13 Write a query to get first name of employees who joined in 1987.
SELECT FirstName,HireDate
 FROM Employee
 WHERE YEAR(HireDate)=1987;

