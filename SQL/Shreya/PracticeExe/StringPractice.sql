
--STRING QUERY----
/*Write a query to get the job_id and related employee's id. 
Partial output of the query */

SELECT EmployeeID,JobId FROM Employees

/*Write a query to update the portion of the phone_number in the employees table, within 
the phone number the substring '124' will be replaced by '999'.*/

SELECT REPLACE(PhoneNumber,124,999) FROM Employees


/*Write a query to get the details of the employees where the length of the first name greater than or equal to 8.*/
 
SELECT FirstName , LEN(FirstName) FROM Employees WHERE LEN(FirstName) >= 8


/*Write a query to display leading zeros before maximum and minimum salary.*/



/*Write a query to append '@example.com' to email field.

Sample Output :

  EMAIL
  --------------------
  SKING@example.com
  NKOCHHAR@example.com
  */
  SELECT * FROM Employees
  SELECT CONCAT(Email , '@example.com') 'Email' FROM Employees


 /* Write a query to get the employee id, first name and hire month. */

 SELECT EmployeeID,FirstName,DATEPART(MONTH,HireDate) 'Hire month'  FROM Employees

 /*7. Write a query to get the employee id, email id (discard the last three characters). */




/*8. Write a query to find all employees where first names are in upper case. */

SELECT UPPER(FirstName) 'NAME' FROM Employees

--9. Write a query to extract the last 4 character of phone numbers. 
SELECT RIGHT(PhoneNumber,4)  FROM Employees

--10. Write a query to get the last word of the street address.
SELECT * FROM Locations

--SELECT REVERSE(SUBSTRING(REVERSE(StreetAddress), 1, 
 --CHARINDEX(' ', REVERSE(StreetAddress)) -1))  'Last Word' from Locations


--11. Write a query to get the locations that have minimum street length. 
SELECT StreetAddress  FROM Locations
WHERE LEN(StreetAddress)=(SELECT MIN(LEN(TRIM(StreetAddress))) FROM Locations)

--12. Write a query to display the first word in job title.



--13. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 
SELECT FirstName +' '+LastName 'NAME', LEN(FirstName) 'LENGHTH OF FN'
FROM Employees
WHERE LastName LIKE ('__c%')


/*14. Write a query that displays the first name and the length of the first name for all employees whose name starts with the
letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.*/ 

SELECT FirstName,LEN(FirstName) 'LENGTH OF FIRSTNAME'  FROM Employees 
WHERE FirstName LIKE 'A%' 
OR FirstName LIKE 'J%'  
OR FirstName LIKE 'M%' 
ORDER BY FirstName


/*15. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded 
with the $ symbol. Label the column SALARY.*/ 

SELECT FirstName,
SALARY = REPLICATE('$',10-Len(Salary))+ CAST(LEFT(Salary,10) AS varchar(10))
FROM Employees


/*16. Write a query to display the first eight characters of the employees first names and indicates the amounts of their salaries with
'$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.*/ 
--DOUBT
SELECT LEFT(FirstName ,8) 'FIRSTNAME'  FROM Employees 
ORDER BY Salary DESC 



/*17. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh 
day of any month or seventh month in any year.*/ 
SELECT EmployeeID,FirstName +' '+LastName 'NAME',HireDate
FROM Employees
WHERE DATEPART(MONTH,HireDate)=7
OR DATEPART(MONTH,HireDate)=8


