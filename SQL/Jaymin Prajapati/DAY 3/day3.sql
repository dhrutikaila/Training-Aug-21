SELECT * From dbo.Employees

--Q1

SELECT FirstName'First Name', LEN(FirstName) 'Name length' FROM Dbo.Employees
WHERE FirstName LIKE ('A%') OR FirstName LIKE ('J%') OR FirstName LIKE ('M%')
ORDER BY FirstName

--Q2

SELECT FirstName ,
SALARY = REPLICATE('$', 10-LEN(Salary))+CAST(LEFT(SALARY,10) AS varchar(10)) 
FROM dbo.employees

--Q3

SELECT EmployeeID, FirstName,LastName,HireDate FROM dbo.Employees
WHERE DATEPART(dd,HireDate) LIKE 07 OR DATEPART(mm,HireDate) LIKE 07

--Q4

SELECT FirstName ,LEN(FirstName) 'First Name Length', LastName FROM dbo.Employees
WHERE LastName LIKE '__%c%'

--Q5

SELECT RIGHT(PhoneNumber, 4) 'Last 4 digits of Phone No.' FROM dbo.Employees 

--Q6

SELECT REPLACE(PhoneNumber, '124', '9999') 'New Number'  FROM dbo.Employees

--Q7

SELECT Hiredate, DATEPART(year,GETDATE())-DATEPART(year, HireDate) AS 'Years in company' FROM dbo.Employees

--OR

SELECT Hiredate, DATEDIFF(YEAR, HireDAte, GETDATE()) AS 'Years in company' FROM dbo.Employees

--Q8

SELECT  HireDate FROM Employees 
WHERE  DATENAME(WEEKDAY,HireDate) LIKE 'Monday'

--Q9

SELECT FirstName , HireDate FROM dbo.Employees
WHERE CAST(HireDate AS varchar) BETWEEN '1987-06-01' AND '1897-07-30'

--Q10

SELECT LTRIM(RIGHT(CONVERT(VARCHAR(20), GETDATE(),100),7)) +' '+
SUBSTRING(DATENAME(MONTH, GETDATE()), 1, 3)+' '+ DATENAME(DAY, GETDATE()) + ', '+ DATENAME(YEAR, GETDATE())

--Q11

SELECT FirstName, LastName, HireDate FROM dbo.Employees
WHERE DATENAME(MONTH, Hiredate) LIKE 'JUNE'

--Q12

SELECT FirstName, LastName,HireDate, Experience=DATEDIFF(YEAR, HireDAte, GETDATE()) FROM dbo.Employees

--Q13

SELECT FirstName, HireDate FROM dbo.Employees
WHERE DATEPART(YEAR, HireDate) like 1987

