USE [Day7 (Function)]
SELECT * FROM Employees



/*

Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName
Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
Write a query to extract the last 4 character of PhoneNumber.
Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
Write a query to calculate the age in year.
Write a query to get the distinct Mondays from HireDate in employees tables.
Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
Write a query to display the current date in the following format.(Sample output : 12:00 AM Sep 5, 2014)
Write a query to get the FirstName, LastName who joined in the month of June.
Write a query to get first name, hire date and experience of the employees.
Write a query to get first name of employees who joined in 1987.

*/


-- 1. Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT FirstName , LEN(FirstName) AS 'Length of FirstName' FROM Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%' ORDER BY FirstName ASC




-- 2. Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FirstName , FORMAT(Salary,'$0000000000.00')  AS 'SALARY' FROM Employees 




-- 3. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT  EmployeeID  ,FirstName , LastName , HireDate AS 'Length of FirstName' FROM Employees WHERE DATEPART(MONTH,HireDate) = 7 AND DATEPART(DAY,HireDate) = 7




-- 4. Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT FirstName , LastName , LEN(FirstName) AS 'Len of FirstName' FROM Employees WHERE SUBSTRING(LastName,3,LEN(LastName)-2) LIKE 'c%' 





-- 5. Write a query to extract the last 4 character of PhoneNumber.

SELECT PhoneNumber , RIGHT(PhoneNumber,4) AS 'last 4 character of PhoneNumber' FROM Employees





-- 6. Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.


UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber,124,999)
SELECT PhoneNumber FROM Employees

-----------------------------------------------------------------------
-- For reset change of query 6
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber,999,124)
SELECT PhoneNumber FROM Employees
-----------------------------------------------------------------------

-- 7. Write a query to calculate the age in year.

-- Issue in query




-- 8. Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT HireDate , DATENAME(DAY,HireDate) FROM Employees WHERE DATENAME(WEEKDAY,HireDate) = 'Monday' 



-- 9. Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT FirstName , HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'




-- 10. Write a query to display the current date in the following format.
	--(Sample output : 12:00 AM Sep 5, 2014)
SELECT FORMAT(GETDATE(),'hh:mm tt MMMM dd , yyyy')



-- 11. Write a query to get the FirstName, LastName who joined in the month of June.


SELECT FirstName , LastName , DATENAME(MM,HireDate) FROM Employees WHERE DATENAME(MM,HireDate) = 'June'




-- 12. Write a query to get first name, hire date and experience of the employees.
SELECT FirstName ,HireDate , DATEDIFF(MM,HireDate,GetDate()) as 'Month of Experience' FROM Employees



-- 13. Write a query to get first name of employees who joined in 1987.
SELECT FirstName  , DATEPART(YEAR,HireDate) FROM Employees WHERE DATEPART(YEAR,HireDate) = 1987
