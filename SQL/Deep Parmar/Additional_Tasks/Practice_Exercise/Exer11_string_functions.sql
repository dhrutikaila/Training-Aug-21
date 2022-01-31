--1. Write a query to get the job_id and related employee's id.
--Partial output of the query :
--job_id Employees ID
--AC_ACCOUNT 206
--AC_MGR 205
--AD_ASST 200
--AD_PRES 100
--AD_VP 101 ,102
--FI_ACCOUNT 110 ,113 ,111 ,109 ,112
--Sample table: employees

	 SELECT  JobId,STRING_AGG(EmployeeID,',') FROM Employees GROUP BY JobId                                                                                            

--2. Write a query to update the portion of the phone_number in the employees table, 
--   within the phone number the substring '124' will be replaced by '999'.

	 UPDATE Employees SET PhoneNumber=REPLACE(PhoneNumber,'124','999') WHERE PhoneNumber LIKE '%124%'

--3. Write a query to get the details of the employees where the length of the first name greater than or equal to 8.

	 SELECT * FROM Employees WHERE LEN(FirstName) >= 8

--4. Write a query to display leading zeros before maximum and minimum salary.

	 SELECT Maximum_Salary=(REPLICATE(0,DATALENGTH(MAX_SALARY)-LEN(MAX_SALARY))+CAST(MAX_SALARY AS VARCHAR))
	 ,Minimum_Salary=(REPLICATE(0,DATALENGTH(MIN_SALARY)-LEN(MIN_SALARY))+CAST(MIN_SALARY AS VARCHAR)) FROM jobs

--5. Write a query to append '@example.com' to email field.
--Sample Output :
--EMAIL
----------------------
--SKING@example.com
--NKOCHHAR@example.com

   UPDATE Employees SET Email=CONCAT(Email,'@example.com') 
 
--6. Write a query to get the employee id, first name and hire month.

	 SELECT EmployeeID,FirstName,SUBSTRING(CAST(HireDate AS VARCHAR),6,2) AS Hire_Month FROM Employees           

--7. Write a query to get the employee id, email id (discard the last three characters).
	 
	 SELECT EmployeeID,SUBSTRING(Email,1,LEN(EMAIL)-3) AS Email_Id FROM Employees

--8. Write a query to find all employees where first names are in upper case.

	  SELECT * FROM Employees WHERE ASCII(RIGHT(FirstName,1)) IN (SELECT ASCII(RIGHT(UPPER(FirstName),1)) FROM Employees)

--9. Write a query to extract the last 4 character of phone numbers.

	 SELECT PhoneNumber,RIGHT(PhoneNumber,4) AS Last_4char_Of_PhoneNumbers FROM Employees

--10. Write a query to get the last word of the street address.

	  SELECT StreetAddress,RIGHT(StreetAddress,1) AS Last_Word_Of_StreetAddress FROM Locations

--11. Write a query to get the locations that have minimum street length.

	  SELECT * FROM Locations WHERE LEN(StreetAddress) <= (SELECT MIN(LEN(StreetAddress)) FROM Locations)

--12. Write a query to display the first word in job title.

	  SELECT JobId,LEFT(JobId,1) AS First_Word_Of_JobTitle FROM Employees

--13. Write a query to display the length of first name for employees where last name contain
--character 'c' after 2nd position.

	 SELECT  FirstName,LEN(FirstName) AS Length_Of_FirstName FROM Employees WHERE LastName LIKE '__c%'

--14. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. 
--    Give each column an appropriate label. Sort the results by the employees' first names.

	  SELECT FirstName AS [NAME],LEN(FirstName) AS Length_Of_FirstName FROM Employees 
	  WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%' ORDER BY FirstName

--15. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol.
--    Label the column SALARY.

	  SELECT FirstName,Salary=(REPLICATE('$',10-LEN(Salary))+cast(Salary AS varchar)) FROM Employees 

--16. Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. 
--    Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.

	  SELECT LEFT(FirstName,8) AS First_Names,REPLACE(Salary,Salary,REPLICATE('$',Salary/1000)) AS Salary FROM Employees 

--17. Write a query to display the employees with their code, first name, last name 
--    and hire date who hired either on seventh day of any month or seventh month in any year.

	  SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(MM,HireDate)=7 OR DATEPART(DD,HireDate)=7

	  