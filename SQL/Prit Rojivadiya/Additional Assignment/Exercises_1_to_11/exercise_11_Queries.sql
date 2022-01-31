-- Q1 Write a query to get the job_id and related employee's id.

SELECT JobId, STRING_AGG(CONVERT(nvarchar(max),EmployeeID),',') FROM Employees
GROUP BY JobId


-- Q2 Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.

SELECT REPLACE(PhoneNumber,'124','999') FROM Employees 


-- Q3 Write a query to get the details of the employees where the length of the first name greater than or equal to 8

SELECT * FROM Employees WHERE LEN(FirstName) >= 8


-- Q4 Write a query to display leading zeros before maximum and minimum salary.

SELECT REPLICATE('0',10 - LEN(MIN(Salary)))+CAST(MIN(Salary) AS varchar(10)), REPLICATE('0',10 - LEN(MAX(Salary)))+CAST(MAX(Salary) AS varchar(10)) FROM Employees


-- Q5 Write a query to append '@example.com' to email field.

UPDATE Employees
SET Email = Email + '@example.com'


-- Q6 Write a query to get the employee id, first name and hire month.

SELECT EmployeeID,FirstName,DATENAME(MONTH,HireDate) FROM Employees


-- Q7 Write a query to get the employee id, email id (discard the last three characters).

SELECT EmployeeID,REVERSE( SUBSTRING( REVERSE(Email),4, LEN(Email) ) ) FROM Employees


-- Q8 Write a query to find all employees where first names are in upper case.

SELECT * FROM Employees
WHERE FirstName = UPPER(FirstName) COLLATE Latin1_General_CS_AI


-- Q9 Write a query to extract the last 4 character of phone numbers.

SELECT RIGHT(PhoneNumber,4) FROM Employees


-- Q10 Write a query to get the last word of the street address.

SELECT REVERSE ( LEFT( REVERSE(StreetAddress), CHARINDEX(SPACE(1),REVERSE(StreetAddress),0) ) ) FROM Locations

SELECT RIGHT(StreetAddress,CHARINDEX(' ',REVERSE(StreetAddress),1)-1) FROM Locations


-- Q11 Write a query to get the locations that have minimum street length.

SELECT MIN( LEN(StreetAddress) ) FROM Locations


-- Q12 Write a query to display the first word in job title.

SELECT LEFT(JobId,CHARINDEX('_',JobID,1) - 1) FROM Employees


-- Q13 Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position

SELECT FirstName,LastName FROM Employees WHERE CHARINDEX('c',LastName) = 2


-- Q14 Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. 
-- Give each column an appropriate label. Sort the results by the employees' first names.

SELECT FirstName,LEN(FirstName) FROM Employees WHERE FirstName LIKE '[AJM]%' ORDER BY FirstName ASC


-- Q15 Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FirstName , SALARY = REPLICATE('$', 10-LEN(Salary))+CAST(Salary AS varchar(10)) FROM Employees


-- Q16 Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. 
-- Sort the data in descending order of salary.

SELECT LEFT(FirstName,8), 'Salary' = REPLICATE('$', Salary/1000 ), Salary FROM Employees


-- Q17 Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE MONTH(HireDate) = 7 OR DAY(HireDate) = 7;

    
 
