USE [Day7 (Function)]

SELECT * FROM Departments

-- Practice Exercise




-- String Function 

--1
SELECT  len(FirstName) FROM Employees 


--2
SELECT  CONCAT('Name of Department' , DepartmentName ) as 'dept' FROM Departments 


--3
SELECT  LOWER(DepartmentName ) as 'lower dept' FROM Departments 


--4
SELECT   LEFT(LastName,len(EmployeeID)) FROM Employees 


--5
SELECT  SOUNDEX('to') 
SELECT  SOUNDEX('Too') 


--6
SELECT REVERSE(DepartmentName) FROM Departments 


--7
SELECT  FORMAT(HireDate,'HH:MMMM:SS tt ')  FROM Employees

SELECT  FORMAT(Salary,'$0000000.00')  FROM Employees

--8
SELECT CHARINDEX('A',DepartmentName,2) FROM Departments

SELECT PATINDEX('%in%',DepartmentName) FROM Departments

--9
SELECT  REPLACE(FirstName,'A','M')  FROM Employees 

SELECT  STUFF('UTTAN',4,1,'Has')  FROM Employees 

SELECT  STUFF('UTTAN',4,2,'Has')  FROM Employees 


--10 

SELECT CHAR(122) --integer to character (integer from 65 to 122 Cap and Small) 

SELECT ASCII('A') 


--11
SELECT UNICODE(FirstName) FROM Employees 





-- Date Function


SELECT YEAR(HireDate) FROM Employees


SELECT MONTH(HireDate) FROM Employees

SELECT DAY(HireDate) FROM Employees


--DatePart
SELECT DATEPART(MM,HireDate) FROM Employees


SELECT DATEPART(WEEK,HireDate) FROM Employees


SELECT DATEPART(DAYOFYEAR,HireDate) FROM Employees


--GetDate
SELECT GETDATE()


--DateAdd

SELECT DATEADD(MM,5,GETDATE()) FROM Employees


SELECT DATEADD(WEEK,2,GETDATE()) FROM Employees


SELECT DATEADD(DAYOFYEAR,100,GETDATE()) FROM Employees


--DateName

SELECT DATENAME(mm,HireDate) FROM Employees

SELECT DATENAME(WEEKDAY,HireDate) FROM Employees






--System Function


--returns application number and Name of client side device connected to server

SELECT HOST_ID()

SELECT HOST_NAME()

--create value of type unique identifier , Value is unique

SELECT NEWID()


-- to replace NULL value to define one

declare @new varchar(20) = 'Hi everyone'
declare @newnull varchar(20) = NULL

SELECT ISNULL(@new,'not')
SELECT ISNULL(@newnull,'not')

