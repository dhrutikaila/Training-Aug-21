/*
1. Write a query to get the job_id and related employee's id. 
*/
SELECT JobID,EmployeeID from Employees


/*
2.Write a query to update the portion of the phone_number in the employees table, within the 
phone number the substring '124' will be replaced by '999'.
*/
CREATE VIEW EmpNo
as
select * from EmpNo

UPDATE Empno
SET PhoneNumber = Replace(PhoneNumber,124,999)
select * from EmpNo

/*
3.Write a query to get the details of the employees where the length of the first name greater than or equal to 8. 
*/
SELECT * from Employees 
WHERE LEN(FirstName) >= 8


/*
4.Write a query to display leading zeros before maximum and minimum salary. 
*/
SELECT LEFT(CONCAT(REPLICATE(0,10-LEN(Max(salary))),MAX(SALARY)),10),
LEFT(CONCAT(REPLICATE(0,10-LEN(MIN(salary))),MIN(SALARY)),10) from Employees

/*
5. Write a query to append '@example.com' to email field.
*/
UPDATE Employees
SET EMAIL = CONCAT(EMAIL,'@example.com')
select * from Employees

/*
6.Write a query to get the employee id, first name and hire month. 
*/
SELECT EmployeeID,FirstName,DATENAME(month,HireDate) [HireMonth] from Employees

/*
7. Write a query to get the employee id, email id (discard the last three characters). 
*/
SELECT EMPLOYEEID,LEFT(EMAIL,LEN(EMAIL)-3) FROM Employees

/*
8.Write a query to find all employees where first names are in upper case. 
*/
SELECT * FROM Employees
WHERE FirstName = CAST(UPPER(FirstName) AS BINARY)

/*
9.Write a query to extract the last 4 character of phone numbers.
*/
SELECT RIGHT(PhoneNumber,4)  FROM Employees

/*
10.Write a query to get the last word of the street address.
*/
SELECT REVERSE(SUBSTRING(REVERSE(StreetAddress), 1, 
 CHARINDEX(' ', REVERSE(StreetAddress)) -1)) AS [Last Word] from Locations

 /*
 11.Write a query to get the locations that have minimum street length.
 */
select StreetAddress from Locations
where len(streetaddress)= (select MIN(len(TRIM(streetaddress))) from locations)

/*
12.Write a query to display the first word in job title.
*/
SELECT SUBSTRING(REPLACE(JOBID,'_',' '),1,CHARINDEX(' ',REPLACE(JOBID,'_',' '))-1) FROM Employees

/*
13.Write a query to display the length of first name for employees where last name contain character 'c' 
after 2nd position.
*/
SELECT LEN(FirstName) FROM Employees
WHERE CHARINDEX('c',LastName,3) > 0


/*
14.Write a query that displays the first name and the length of the first name for all employees whose 
name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by 
the employees' first names. 
*/
SELECT FirstName,LEN(FirstName) AS 'Length' FROM Employees
WHERE FirstName LIKE ('A%') OR
FirstName LIKE ('J%') OR
FirstName LIKE ('M%')
ORDER BY FirstName


/*
15.Write a query to display the first name and salary for all employees. Format the salary to be 10 
characters long, left-padded with the $ symbol. Label the column SALARY. 
*/
SELECT FirstName,Salary = LEFT(REPLICATE('$',10-LEN(SALARY))+CAST(Salary AS varchar),10) FROM Employees

/*
16.Write a query to display the first eight characters of the employees' first names and indicates the 
amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
descending order of salary. 
*/
SELECT LEFT(FirstName,8),REPLICATE('$',FLOOR(SALARY/1000)) [Salary] FROM Employees
ORDER BY Salary DESC


/*
17.Write a query to display the employees with their code, first name, last name and hire date 
who hired either on seventh day of any month or seventh month in any year. 
*/
SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees
WHERE DATEPART(DAY,HIREDATE)=7 OR
DATEPART(MM,HIREDATE)=7