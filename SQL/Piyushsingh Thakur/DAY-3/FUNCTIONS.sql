USE day6


---task1
---Write a query that displays the FirstName and the length of the FirstName for all 
---employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName


SELECT * FROM Employees

SELECT FirstName AS NAME, LEN(FirstName) AS 'lenth of first name' FROM  Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%'  ORDER BY FirstName
use DAY6

-----task-2

---Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FIRSTNAME, CONCAT(REPLICATE('$', 10-Len(Salary)),Cast(Salary AS varchar)) AS PAGAR FROM Employees

----TASK-3
---Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT EMPLOYEEID,FIRSTNAME,LASTNAME,HIREDATE FROM EMPLOYEES WHERE DATEPART(Day,HireDate)='07' OR DATEPART(Month,HireDate)='07'

----TASK-4
---Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
SELECT LEN (FIRSTNAME) AS 'LENGTH OF FIRSTNAME'  FROM EMPLOYEES WHERE  CHARINDEX('C', LastName,3)>0;

------TASK-5
--- Write a query to extract the last 4 character of PhoneNumber.
SELECT RIGHT(PhoneNumber,4) AS 'LAST 4 DIGIT' FROM Employees



--TASK-6
---Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber, '124', '999') WHERE PhoneNumber LIKE '%124%';

-----TASK-7
---Write a query to calculate the age in year.
SELECT DATEDIFF(yyyy,'2000-07-05',GetDate()) AS YEAR
--TASK-8
---Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT EmployeeID,FirstName,HireDate FROM Employees WHERE DATENAME(WEEKDAY,HireDate)='Monday'

TASK-9
---Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

 SELECT FirstName,HireDate FROM Employees WHERE HireDate between '1987-06-01' and '1987-07-30'

---------TASK10
---Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014

SELECT FORMAT (GETDATE(), 'hh:mm tt MMM dd, yyyy') as time

--TASK-11
---Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName,LastName FROM Employees WHERE DATEPART(MONTH,HireDate)='06'

-----TASK-12
---Write a query to get first name, hire date and experience of the employees.
SELECT FirstName AS 'Name',HireDate,CONCAT(DATEDIFF(dd,HireDate,GETDATE())/365,' ', 'Year',' ',DATEDIFF(MM,HireDate,GETDATE())%12,' ','Month') AS 'Experience' from Employees


---task13
---Write a query to get first name of employees who joined in 1987.

SELECT FirstName FROM Employees WHERE DATEPART(YEAR,HireDate)='1987'