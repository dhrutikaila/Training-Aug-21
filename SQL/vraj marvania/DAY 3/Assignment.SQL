-- --1.Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName
      
      SELECT FirstName ,LEN(FirstName) AS 'FirstName length'  
      FROM Employees 
      WHERE ((FirstName LIKE 'A%') OR (FirstName LIKE 'J%') OR (FirstName LIKE 'M%')) 
      ORDER BY FirstName


--  2Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

      SELECT FirstName,REPLICATE('$',cast(10-LEN(Salary)as int))+cast(Salary as varchar) as  SALARY from Employees


-- 3Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

      SELECT FirstName,LastName,HireDate FROM Employees WHERE DAY(HireDate)=07 OR MONTH(HireDate) =07


-- 4Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
      
      SELECT LEN(FirstName) FROM Employees WHERE  CHARINDEX('C',LASTNAME,2)>2


-- 5Write a query to extract the last 4 character of PhoneNumber.
      
      SELECT RIGHT(PhoneNumber,4) FROM Employees 


-- 6Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
  
      UPDATE Employees
      SET PhoneNumber=replace(PhoneNumber,'124','999')

-- 7Write a query to calculate the age in year.
      
      SELECT DATEDIFF(YEAR, '2000-04-10', GETDATE())

-- 8Write a query to get the distinct Mondays from HireDate in employees tables.
      
      SELECT * FROM Employees WHERE DATENAME(weekday,HireDate)='Monday'


-- 9Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
      
      SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'


-- 10Write a query to display the current date in the following format.
-- Sample output : 12:00 AM Sep 5, 2014 NOTE FORMATE FUNCTION IS NOT WORKING

      SELECT RIGHT(convert(VARCHAR, getdate(), 100),7)+' '+convert(varchar, getdate(), 107)
     

-- 11Write a query to get the FirstName, LastName who joined in the month of June.

      SELECT FirstName,LastName FROM Employees WHERE DATENAME(month,Hiredate)='June' 


-- 12Write a query to get first name, hire date and experience of the employees. 
      
      SELECT FirstName,HireDate,DATEDIFF(YEAR,HireDate,GETDATE())  AS Experience FROM Employees


-- 13Write a query to get first name of employees who joined in 1987.
      
      SELECT FirstName FROM Employees WHERE DATENAME(YEAR,HIREDATE)=1987