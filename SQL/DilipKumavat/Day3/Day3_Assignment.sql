CREATE DATABASE rxweb_day3

USE rxweb_day3

---ALL DATA OF EMPLOYEES TABLE---
SELECT * FROM Employees

--- Query 1. Write a query that displays the FirstName and the length of the FirstName for all employees 
---  whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. 
---  Sort the results by the employees’ FirstName ---
SELECT FirstName, LEN(FirstName) AS FName_Length FROM Employees WHERE FirstName LIKE '[AJM]%' ORDER BY FirstName ASC

--- Query 2. Write a query to display the FirstName and Salary for all employees. ---
--  Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT FirstName,CONCAT('$',CAST(salary AS varchar(20)),REPLICATE(0,(10-LEN(Salary)))) AS 'SALARY'  FROM Employees

--- Query 3. Write a query to display the employees with their code, first name, last name and hire date 
---  who hired either on seventh day of any month or seventh month in any year.
SELECT FirstName,LastName,HireDate FROM Employees WHERE DATEPART(dd,HireDate) = 07 OR DATEPART(MM,HireDate) = 07

--- Query 4. Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position. ---
SELECT LEN(FirstName) FROM Employees WHERE CHARINDEX('c',LastName)>2

SELECT LEN(FirstName) FROM Employees WHERE PATINDEX('%c%',LastName)>2

--- Query 5. Write a query to extract the last 4 character of PhoneNumber.---
SELECT RIGHT(PhoneNumber,4) FROM Employees

--- Query 6. Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.---
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber,124,999)

--- Query 7. Write a query to calculate the age in year.---
SELECT DATEDIFF(year, HireDate, GETDATE()) AS AGE FROM Employees

--- Query 8. Write a query to get the distinct Mondays from HireDate in employees tables. ---
SELECT HireDate FROM Employees WHERE DATENAME(weekday,HireDate) = 'Monday'

--- Query 9. Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’ ---
SELECT FirstName, HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

--- Query 10. Write a query to display the current date in the following format. ---
--- Query 11.Sample output : 12:00 AM Sep 5, 2014 ---
DECLARE @TIME VARCHAR(2)
IF(DATENAME(hh,SYSDATETIME()) <12)
                SET @TIME = 'AM'
            ELSE 
                SET @TIME = 'PM'
PRINT CONCAT(DATENAME(hh,SYSDATETIME()),':',DATENAME(n,SYSDATETIME()),' ',@TIME,' ',
	  LEFT(DATENAME(MM,SYSDATETIME()),3),' ',DATENAME(dd,SYSDATETIME()),', ',DATENAME(YYYY,SYSDATETIME()))

--- Query 12.Write a query to get the FirstName, LastName who joined in the month of June. ---
SELECT FirstName, LastName FROM Employees WHERE DATEPART(mm,HireDate) = 07

--- Query 13. Write a query to get first name, hire date and experience of the employees. ---
SELECT FirstName,HireDate, DATEDIFF(year, HireDate, GETDATE()) AS Field_EXP FROM Employees

--- Query 14. Write a query to get first name of employees who joined in 1987. ---
SELECT FirstName FROM Employees WHERE DATEPART(year,HireDate) = 1987
