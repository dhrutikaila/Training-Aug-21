--task-1. Write a query to get the job_id and related employee's id. 
--Partial output of the query :

--job_id	Employees ID
--AC_ACCOUNT	206
--AC_MGR	205
--AD_ASST	200
--AD_PRES	100
--AD_VP	101 ,102
--FI_ACCOUNT	110 ,113 ,111 ,109 ,112
--Sample table: employees
SELECT JobId, EmployeeID FROM Employees

--task-2. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
UPDATE Employees
SET PhoneNumber= REPLACE(PhoneNumber,'124','999') 
WHERE PhoneNumber LIKE '%124%'


--task-3. Write a query to get the details of the employees where the length of the first name greater than or equal to 8. 
SELECT FirstName FROM Employees WHERE LEN(FirstName)>=8

--task-4. Write a query to display leading zeros before maximum and minimum salary. 
SELECT CONCAT(REPLICATE(0, 3),MAX(Salary)) AS 'MAXIMUM SALARY',CONCAT(REPLICATE(0, 3),MIN(Salary)) AS 'MINIMUM SALARY' FROM Employees
--task-5. Write a query to append '@example.com' to email field.
--Sample Output :

--  EMAIL
--  --------------------
--  SKING@example.com
--  NKOCHHAR@example.com
UPDATE Employees 
SET Email = CONCAT(Email, '@example.com')

--task-6. Write a query to get the employee id, first name and hire month. 
SELECT EmployeeId,FirstName,MONTH(HireDate) AS 'Hire Month' FROM Employees

--task-7. Write a query to get the employee id, email id (discard the last three characters). 
SELECT EmployeeID,REVERSE(SUBSTRING(REVERSE(Email),4,100)) FROM Employees

--task-8. Write a query to find all employees where first names are in upper case.
SELECT * FROM Employees WHERE CAST(FirstName AS VARBINARY(20)) = CAST(UPPER(FirstName) AS VARBINARY(20))


--task-9. Write a query to extract the last 4 character of phone numbers. 
SELECT REVERSE(SUBSTRING(REVERSE(PhoneNumber),0,5)) FROM Employees

--task-10. Write a query to get the last word of the street address. 
SELECT LASTWORD = RIGHT(RTRIM([StreetAddress]),CHARINDEX(' ',REVERSE(RTRIM([StreetAddress]))+' '))
 From LOCATIONS
 SELECT REVERSE(SUBSTRING(REVERSE(StreetAddress), 0, PATINDEX('% %', REVERSE(StreetAddress)))) FROM Locations


--task-11. Write a query to get the locations that have minimum street length. 
SELECT * FROM Locations
WHERE LEN(StreetAddress) <= (SELECT  MIN(LEN(StreetAddress)) FROM Locations);

--task-12. Write a query to display the first word in job title. 
SELECT DISTINCT(SUBSTRING((JobId), 0, CHARINDEX('_', JobId))) FROM Employees 

--task-13. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 
SELECT LEN(FirstName),FirstName,LastName FROM Employees WHERE LastName IN (SELECT LastName FROM Employees WHERE LastName LIKE '__C%')

--task-14. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names. 
SELECT FirstName AS "Name",LEN(FirstName) "Length"
FROM Employees WHERE FirstName LIKE 'J%' OR FirstName LIKE 'M%' OR FirstName LIKE 'A%' ORDER BY FirstName ;

--task-15. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY. 
SELECT FirstName AS 'First Name',CONCAT(REPLICATE('$', 10-LEN(Salary)),CAST(Salary AS VARCHAR)) FROM Employees

--task-16. Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary. 
SELECT LEFT(FirstName, 8),REPLICATE('$', FLOOR(salary/1000)) 'SALARY($)', salary FROM employees ORDER BY salary DESC;

--task-17. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year. 
SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(Day,HireDate)='07' OR DATEPART(MONTH,HireDate)='07'