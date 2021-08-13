use test1
--1
SELECT FirstName "Name",
LEN(FirstName) "Length"
FROM employees
WHERE FirstName LIKE 'J%'
OR FirstName LIKE 'M%'
OR FirstName LIKE 'A%'
ORDER BY FirstName ;
--2
SELECT FirstName ,
SALARY = REPLICATE('$', 10-LEN(Salary))+CAST(LEFT(SALARY,10) AS varchar(10)) 
FROM dbo.employees

--3

 SELECT EmployeeID, FirstName,LastName,HireDate FROM Employees
WHERE HireDate LIKE '____-07-' OR HireDate LIKE '____--07'

--4
SELECT FirstName ,LEN(FirstName) 'First Name Length', LastName FROM Employees
WHERE LastName LIKE '__%c%'

--5
SELECT RIGHT(PhoneNumber,4) as 'ph.no.' FROM Employees;

--6
UPDATE Employees
SET PhoneNumber= REPLACE(PhoneNumber,'124','999')
WHERE PhoneNumber LIKE '%124%';

--7
SELECT Hiredate, DATEPART(year,GETDATE())-DATEPART(year, HireDate) AS 'Years in company' FROM Employees

--8
set datefirst 1
SELECT  HireDate FROM Employees 
WHERE  DATEPART(WEEKDAY,HireDate) LIKE 1

--9
SELECT FirstName,HireDate
FROM Employees
WHERE HireDate
BETWEEN '1987-06-01'
AND '1987-07-30';

--10
SELECT LTRIM(RIGHT(CONVERT(VARCHAR(20), GETDATE(),100),7)) +' '+
SUBSTRING(DATENAME(MONTH, GETDATE()), 1, 3)+' '+ DATENAME(DAY, GETDATE()) + ', '+ DATENAME(YEAR, GETDATE())

--11
SELECT FirstName, LastName, HireDate FROM Employees
WHERE DATENAME(MONTH, Hiredate) LIKE 'JUNE'
--or
SELECT FirstName,LastName
  FROM Employees WHERE MONTH(HireDate)=6;

 --12
 SELECT FirstName, LastName, HireDate,  Experience=DATEDIFF(YEAR, HireDAte, GETDATE()) FROM Employees

 --13
SELECT FirstName,HireDate
 FROM Employees
 WHERE YEAR(HireDate)=1987;