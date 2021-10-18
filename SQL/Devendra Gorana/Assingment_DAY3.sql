
SELECT FirstName AS Name, LEN(FirstName) AS Length FROM Employees WHERE FirstName LIKE 'J%' OR FirstName LIKE 'M%' OR FirstName LIKE 'A%' ORDER BY FirstName,

SELECT firstname,'SALARY' = RIGHT(REPLICATE('$',10-LEN(Salary)) + CAST(Salary as varchar),10) from Employees

SELECT FirstName, FORMAT(Salary, 'C', 'en-us') AS Salary FROM Employees

SELECT EmployeeID, FirstName, LastName, HireDate FROM Employees WHERE DATEPART(dd,HireDate) = 07 OR DATEPART(mm,HireDate) = 07

SELECT FirstName, LastName, LEN(FirstName) AS Length FROM Employees WHERE CHARINDEX('c',LastName)>2

SELECT RIGHT(PhoneNumber,4) AS Last_4_DigitOfNumber FROM Employees

SELECT REPLACE(PhoneNumber,'124', '999') FROM Employees
UPDATE Employees SET PhoneNumber = REPLACE(PhoneNumber,'124', '999')
SELECT * FROM Employees

SELECT DATEDIFF(yyyy,'2000-08-19',GETDATE())

SELECT EmployeeID, StartDate, EndDate, DATEDIFF(yyyy,StartDate,EndDate) As TotalYearOFJob FROM JobHistory


SELECT FirstName, HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'


SELECT SYSDATETIME() AS Current_Time

SELECT 'Current_Date' = FORMAT( GETDATE(),'hh:mm tt MMMM dd, yyyy' )

SELECT FirstName, LastName FROM Employees WHERE DATENAME(mm,HireDate) = 'June'

SELECT FirstName, HireDate, DATEDIFF(yyyy,HireDate,GETDATE()) As Experience FROM Employees

SELECT FirstName FROM Employees WHERE DATENAME(yy,HireDate) = '1987'