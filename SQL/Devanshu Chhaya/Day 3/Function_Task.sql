---Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

USE Day_7;


SELECT FirstName, LEN(FirstName) AS Length FROM dbo.Employees WHERE FirstName LIKE'A%' OR FirstName LIKE 'J%'OR FirstName LIKE 'M%' ORDER BY FirstName ASC;



---Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FirstName, REPLICATE('$',10-LEN(Salary)) + CONVERT(VARCHAR,Salary) AS SALARY FROM Employees;


----Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT EmployeeID, FirstName, LastName, HireDate FROM dbo.Employees
WHERE (SELECT DATEPART(DAY,HireDate))= '07' OR (SELECT DATEPART(MONTH,HireDate))= '07'; 


---Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT LEN(FirstName) AS Length FROM dbo.Employees WHERE (CHARINDEX ('c', LastName, 2))<>0;  


-----Write a query to extract the last 4 character of PhoneNumber.

SELECT REVERSE(SUBSTRING (REVERSE(PhoneNumber),1,4)) FROM dbo.Employees;

----Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

UPDATE dbo.Employees SET PhoneNumber= REPLACE(PhoneNumber,'124','999');


----Write a query to calculate the age in year.

SELECT DATEDIFF(YY,HireDate,GETDATE()) FROM dbo.Employees;

-----Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT DATENAME(weekday,HireDate) FROM dbo.Employees WHERE DATENAME(weekday,HireDate)='Monday';


---Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName, HireDate From dbo.Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

------Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014

SELECT FORMAT(GETDATE(), N'hh:mm tt')+' '+ FORMAT(GETDATE(),'D', 'en-gb');


----Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName, LastName FROM dbo.Employees WHERE DATENAME(month,HireDate)='June';

----Write a query to get first name, hire date and experience of the employees.

SELECT FirstName, HireDate, DATEDIFF(year,HireDate,GETDATE()) AS Experience FROM dbo.Employees;


-----Write a query to get first name of employees who joined in 1987.

SELECT FirstName FROM dbo.Employees WHERE (DATEPART (YEAR,Hiredate))='1987'; 

