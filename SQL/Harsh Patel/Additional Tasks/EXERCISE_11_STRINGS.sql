
--1. Write a query to get the job_id and related employee's id. 

SELECT JobId, STRING_AGG(CONVERT(VARCHAR,EmployeeID),', ')
FROM Employees
GROUP BY JobId

--2. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.

SELECT FirstName
	, PhoneNumber
	, REPLACE(PhoneNumber,'124','999') AS 'Replaced'
FROM Employees

--3. Write a query to get the details of the employees where the length of the first name greater than or equal to 8. 

SELECT *
FROM Employees
WHERE LEN(FirstName) >= 8

--4. Write a query to display leading zeros before maximum and minimum salary. 

SELECT	CONCAT('0', CONVERT(VARCHAR,MAX(Salary))) AS 'Max'
	, CONCAT('0', CONVERT(VARCHAR,MIN(Salary))) AS 'Min'
FROM Employees

--5. Write a query to append '@example.com' to email field.

SELECT CONCAT(Email,'@example.com')
FROM Employees

--6. Write a query to get the employee id, first name and hire month. 

SELECT EmployeeID
	, FirstName
	, FORMAT(HireDate,'MMMMM') AS MONTH
FROM Employees

--7. Write a query to get the employee id, email id (discard the last three characters). 

 SELECT	EmployeeID
	, Email
	, RIGHT(Email,3)
	, REVERSE(SUBSTRING(REVERSE(Email),4,LEN(Email)))
 FROM  Employees

--8. Write a query to find all employees where first names are in upper case. 

SELECT *
FROM Employees
WHERE FirstName = UPPER(FirstName) COLLATE Latin1_General_CS_AI

--9. Write a query to extract the last 4 character of phone numbers. 

SELECT PhoneNumber
	, RIGHT(PhoneNumber,4)
FROM Employees

--10. Write a query to get the last word of the street address. 

SELECT StreetAddress
	, REVERSE(SUBSTRING(REVERSE(StreetAddress),1,CHARINDEX(' ',REVERSE(StreetAddress)))) AS 'Last Word'
FROM Locations

--11. Write a query to get the locations that have minimum street length. 

SELECT StreetAddress
FROM Locations
WHERE LEN(StreetAddress) = (
			SELECT MIN(LEN(StreetAddress))
			FROM Locations
			)

--12. Write a query to display the first word in job title. 

SELECT JobId
	, SUBSTRING(JobId,1,CHARINDEX('_',JobID)-1) AS 'First Word'
FROM Employees

--13. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 

SELECT FirstName
	, LastName
	, LEN(FirstName) AS 'Length'
FROM Employees
WHERE LastName LIKE '__c%'

--14. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names. 

SELECT FirstName
	, LastName
	, LEN(FirstName) AS 'Length'
FROM Employees
WHERE LastName LIKE '[ajm]%'
ORDER BY FirstName, LastName

--15. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY. 

SELECT FirstName
	, CONCAT('$',SPACE(1),REPLICATE(0,10-LEN(Salary)),Salary) AS Salary
FROM Employees


--16. Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign.
--Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary. 

SELECT SUBSTRING(FirstName,1,8) AS 'First Name'
	, CONCAT('$',SPACE(1),Salary) AS Salary
FROM Employees AS E
ORDER BY E.Salary DESC

--17. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year. 

SELECT EmployeeID
	, FirstName
	, LastName
	, HireDate
FROM Employees
WHERE DATEPART(MM,HireDate) = 7 
OR DATEPART(DD,HireDate) = 7
