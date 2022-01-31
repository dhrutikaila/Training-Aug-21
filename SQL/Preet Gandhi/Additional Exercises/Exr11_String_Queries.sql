USE Additional_Practice
--Main Database--

--1)Write a query to get the job_id and related employee's id. 
--Partial output of the query : 
/*job_id	Employees ID 
AC_ACCOUNT	206 
AC_MGR	205 
AD_ASST	200 
AD_PRES	100 
AD_VP	101 ,102 
FI_ACCOUNT	  10 ,113 ,111 ,109 ,112 
Sample table: employees*/

SELECT JobId, EmployeeID FROM Employees

--2)Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber,'124','999') WHERE PhoneNumber LIKE '%124%'

--3)Write a query to get the details of the employees where the length of the first name greater than or equal to 8. 
SELECT * FROM Employees WHERE LEN(FirstName)>=8

--4)Write a query to display leading zeros before maximum and minimum salary. 
SELECT CONCAT(REPLICATE(0,4),MAX(Salary)) AS 'Max_Sal',CONCAT(REPLICATE(0,4),MIN(Salary)) AS 'Min_Sal' FROM Employees

--5)Write a query to append '@example.com' to email field.
--Sample Output :   
/*EMAIL
 --------------  
  SKING@example.com   NKOCHHAR@example.com
  */
UPDATE Employees SET Email = CONCAT(Email, '@example.com')

--6)Write a query to get the employee id, first name and hire month. 
SELECT EmployeeId,FirstName,MONTH(HireDate) AS 'HireMonth' FROM Employees

--7)Write a query to get the employee id, email id (discard the last three characters). 
SELECT EmployeeID,REVERSE(SUBSTRING(REVERSE(Email),4,20)) FROM Employees

--8)Write a query to find all employees where first names are in upper case.
SELECT * FROM Employees WHERE CAST(FirstName AS VARBINARY(20)) = CAST(UPPER(FirstName) AS VARBINARY(20))

--9)Write a query to extract the last 4 character of phone numbers. 
SELECT RIGHT(PhoneNumber,4) FROM Employees

--10)Write a query to get the last word of the street address. 
SELECT REVERSE(SUBSTRING(REVERSE(StreetAddress), 0, PATINDEX('% %', REVERSE(StreetAddress)))) FROM Locations

--11)Write a query to get the locations that have minimum street length. 
SELECT * FROM Locations WHERE LEN(StreetAddress) <= (SELECT  MIN(LEN(StreetAddress)) FROM Locations)

--12)Write a query to display the first word in job title. 
SELECT DISTINCT(SUBSTRING((JobId), 0, CHARINDEX('_', JobId))) FROM Employees 

--13)Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 
SELECT LEN(FirstName) FROM Employees WHERE CHARINDEX('c',LastName)>2

--14)Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names. 
SELECT FirstName, LEN(FirstName) AS FName_Length FROM Employees WHERE FirstName LIKE '[AJM]%' ORDER BY FirstName ASC

--15)Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY. 
SELECT FirstName,CONCAT('$',CAST(salary AS varchar(20)),REPLICATE(0,(10-LEN(Salary)))) AS 'SALARY'  FROM Employees

--17)Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year. 
SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(dd,HireDate) = 07 OR DATEPART(MM,HireDate) = 07