----------ASSIGNMENT----------
--Write a query that displays the FirstName and the length of the FirstName for all employees whose name
--starts with the letters ‘A’, ‘J’ or ‘M’. 
--Give each column an appropriate label. 
--Sort the results by the employees’ FirstName
SELECT FirstName, LEN(FirstName) FROM Employees
WHERE FirstName LIKE 'A%'
OR FirstName LIKE 'J%'
OR FirstName LIKE 'M%'
ORDER BY FirstName

--Write a query to display the FirstName and Salary for all employees.
--Format the salary to be 10 characters long, left-padded with the $ symbol. 
--Label the column SALARY.
SELECT FirstName,FORMAT(CAST(LEFT(CAST(Salary AS VARCHAR(20)),10)AS money),'C') as SALARY FROM Employees;

--Write a query to display the employees with their code, first name, last name and hire date
--who hired either on seventh day of any month or seventh month in any year.
SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees
WHERE DATEPART(DAY,HireDate) = 7 OR DATEPART(MONTH,HireDate)=7;

--Write a query to display the length of first name for employees 
--where last name contains character ‘c’ after 2nd position.
SELECT LEN(FirstName),LastName FROM Employees
WHERE LastName LIKE '_C%'
;
--Write a query to extract the last 4 character of PhoneNumber.
select PhoneNumber from Employees;
SELECT RIGHT(PhoneNumber,4) FROM Employees;

--Write a query to update the portion of the PhoneNumber in the employees table, 
--within the phone number the substring ‘124’ will be replaced by ‘999’.
SELECT REPLACE(PhoneNumber,'124','999'),PhoneNumber FROM Employees
WHERE PhoneNumber LIKE '%124%';

UPDATE Employees
SET PhoneNumber =  REPLACE(PhoneNumber, '124','999') 
WHERE PhoneNumber LIKE '%124%';

--Write a query to calculate the age in year.
SELECT DATEDIFF(YEAR,'1999-12-14',SYSDATETIME());

--Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT DISTINCT HireDate, DATENAME(WEEKDAY,HireDate) FROM Employees
WHERE DATENAME(WEEKDAY,HireDate) = 'monday';

--Write a query to get the FirstName and HireDate from Employees table 
--where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT FirstName,HireDate FROM Employees
WHERE HireDatE BETWEEN '1987-06-01' AND '1987-07-30';

--Write a query to display the current date in the following format.
SELECT FORMAT(SYSDATETIME(), N'hh:mm tt')+' '+DATENAME(MONTH,SYSDATETIME())+' '+DATENAME(DAY,SYSDATETIME())+','+DATENAME(YEAR,SYSDATETIME());

--Write a query to get the FirstName, LastName who joined in the month of June.
SELECT FirstName,LastName FROM Employees
WHERE DATENAME(MONTH,HireDate) = 'June';

--Write a query to get first name, hire date and experience of the employees.
SELECT FirstName,HireDate,DATEDIFF(YEAR,HireDate,SYSDATETIME()) AS Experience  FROM Employees;

--Write a query to get first name of employees who joined in 1987.
SELECT FirstName FROM Employees
WHERE YEAR(HireDate) = '1987';