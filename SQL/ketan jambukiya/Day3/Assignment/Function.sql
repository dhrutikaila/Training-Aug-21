USE Ketan

---SQL Day3 Query

--1.Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

   SELECT FirstName as name, LEN (FirstName) AS 'length' FROM Employees
   WHERE firstname like 'A%' or
   firstname like 'J%'or
   firstname like'M%' ORDER FirstName

--2.Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
   
  SELECT FirstName, REPLICATE('$',10-LEN(Salary)) + CONVERT(varchar,Salary) FROM Employees

--3.Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
   
   SELECT FirstName,LastName,HireDate FROM Employees WHERE DAY(HireDate)=07 OR MONTH(HireDate) =07

--4.Write a query to display the length of first name for employees WHERE last name contains character ‘c’ after 2nd position.

  SELECT FirstName,LastName,LEN(FirstName) as 'length' FROM Employees 
  WHERE LastName like '__%c%' ORDER BY LastName 

--5.Write a query to extract the last 4 character of PhoneNumber

  SELECT Right(PhoneNumber,4) AS MobileNumber FROM Employees

--6.Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’

  SELECT * INTO employee FROM Employees

  UPDATE employee SET PhoneNumber= REPLACE(PhoneNumber,124,999)

--7.Write a query to calculate the age in year.

  SELECT DATEDIFF(DAY,'2000-07-29', SYSDATETIME() )/365

--8.Write a query to get the distinct Mondays FROM HireDate in employees tables.
   
   SELECT * FROM Employees WHERE DATENAME(weekday,HireDate)='Monday'

--9.Write a query to get the FirstName and HireDate FROM Employees table WHERE HireDate between ‘1987-06-01’ and ‘1987-07-30’
  
  SELECT FirstName,HireDate FROM Employees WHERE HireDate Between ' 1987-06-01' and '1987-07-30'

--10&11 Write a query to display the current date in the following format.
 --Sample output : 12:00 AM Sep 5, 2014
  
  SELECT FORMAT(GETDATE(),'hh:mm tt MMM dd,yyyy') 

--Write a query to get the FirstName, LastName who joined in the month of June.
  
  SELECT FirstName,LastName FROM Employees WHERE MONTH(HireDate)=6

--Write a query to get first name, hire date and experience of the employees.
  
  SELECT FirstName, HireDate,DATEDIFF( DAY,HireDate,SYSDATETIME())/365 AS 'EXPERIENCE' FROM Employees

--Write a query to get first name of employees who joined in 1987.

  SELECT FirstName FROM Employees WHERE YEAR(HireDate)=1987 

