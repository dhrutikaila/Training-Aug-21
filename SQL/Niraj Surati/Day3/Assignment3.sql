-- Assignment 3 Day 3

USE Assignment2

SELECT * FROM Employees

-- 1 .Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT Firstname, LEN(FirstName) AS 'Employee Name Length' 
FROM Employees WHERE Firstname LIKE 'A%' OR Firstname LIKE 'J%' OR Firstname LIKE 'M%'
ORDER BY Firstname ASC

SELECT Firstname, LEN(FirstName) AS 'Employee Name Length' 
FROM Employees WHERE  LEFT(Firstname,1)  IN('A','J','M')
ORDER BY Firstname ASC


-- 2. Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT Firstname, CONCAT('$',SPACE(1),CAST(CAST(Salary AS DECIMAL(10,5)) AS varchar)) AS 'SALARY' FROM Employees 


-- 3. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT EmployeeID 'Code', Firstname, LastName, HireDate 
FROM Employees WHERE CAST(DATEPART(DD,HireDate) AS INT) = 7 OR CAST(DATEPART(MM,HireDate) AS INT) = 7


-- 4. Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT Firstname, Lastname, LEN(FirstName) AS 'Employee Name Length'  FROM Employees
WHERE  LastName LIKE('__C%')

-- 5. Write a query to extract the last 4 character of PhoneNumber.

SELECT FirstName,RIGHT(CAST(PhoneNumber AS VARCHAR),4) AS 'Number' FROM Employees

-- 6. Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

SELECT FirstName,REPLACE(CAST(PhoneNumber AS VARCHAR),'124','999') AS 'Number' FROM Employees

-- 7. Write a query to calculate the age in year.

SELECT FirstName, DATEDIFF(YY,HireDate,GETDATE()) AS 'AGE' FROM Employees

-- 8. Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT  HireDate FROM Employees WHERE DATEPART(WEEKDAY,HireDate) = 2

-- 9. Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName,HireDate FROM Employees WHERE HireDate  BETWEEN '1987-06-01'  AND '1987-07-30'

-- 10. Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014

SELECT FirstName,FORMAT(HireDate,'hh:mm tt MMM d, yyyy') FROM Employees

-- 11. Write a query to get the FirstName, LastName who joined in the month of June.

SELECT Firstname,Lastname FROM Employees Where DATEPART(MM,Hiredate) = 6  

-- 12. Write a query to get first name, hire date and experience of the employees.

SELECT FirstName, DATEDIFF(YY,HireDate,GETDATE()) AS 'Experience' FROM Employees

-- 13. Write a query to get first name of employees who joined in 1987.

SELECT FirstName, Hiredate FROM Employees WHERE DATEPART(yyyy,Hiredate) = 1987