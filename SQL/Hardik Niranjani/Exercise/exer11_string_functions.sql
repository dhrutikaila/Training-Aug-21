--1. Write a query to get the job_id and related employee's id.
		SELECT JobId, STRING_AGG(EmployeeID,',') AS [Employee Id]
		FROM Employees 
		GROUP BY JobId

	
--3. Write a query to get the details of the employees where the length of the first name greater than or equal to 8.
		SELECT * FROM Employees
		WHERE LEN(FirstName) > 8

--4. Write a query to display leading zeros before maximum and minimum salary.==============================
		SELECT RIGHT(MIN(Salary)+REPLICATE(0, 2) ,7) FROM Employees


--5. Write a query to append '@example.com' to email field.
		UPDATE Employees
		SET Email = CONCAT(Email,'@example.com' )

--6. Write a query to get the employee id, first name and hire month.
		SELECT EmployeeID, FirstName, MONTH(HireDate) as [Month of HireDate] FROM Employees

--7. Write a query to get the employee id, email id (discard the last three characters).
 
 SELECT Email ,REVERSE(SUBSTRING(REVERSE(Email),4,LEN(Email))) AS [email id (discard the last three characters)] FROM Employees


--8. Write a query to find all employees where first names are in upper case.=====================================
SELECT FirstName AS [Name] FROM Employees
			   WHERE FirstName = UPPER(FirstName)
			        

--9. Write a query to extract the last 4 character of phone numbers.
		SELECT SUBSTRING(PhoneNumber,9,12) AS [Last digit phone number] FROM Employees

--10. Write a query to get the last word of the street address.

		SELECT SUBSTRING(REVERSE(StreetAddress),1,1) AS [last word of the street address], StreetAddress FROM Locations

--11. Write a query to get the locations that have minimum street length.
		SELECT * FROM Locations
		 WHERE LEN(StreetAddress) IN (SELECT MIN(LEN(StreetAddress)) FROM Locations)
		 

--12. Write a query to display the first word in job title
		SELECT JobId AS [Job Title], SUBSTRING(JobId,1,1) AS [First Word of Job Title] FROM Employees


--16. Write a query to display the first eight characters of the employees' 
--first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. 
--Sort the data in descending order of salary.

		SELECT CONCAT(FirstName,' ',LastName) AS [Name],REPLICATE('$', (Salary/1000)) AS [Salary] 
					FROM Employees
					ORDER BY [Salary] DESC