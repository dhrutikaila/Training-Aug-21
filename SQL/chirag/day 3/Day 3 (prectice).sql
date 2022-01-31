SELECT ASCII('C')

SELECT CONCAT(FirstName,' ',LastName) AS emname FROM Employees 

SELECT LEFT(FirstName,6) from Employees 

select Right(FirstName,6) from Employees 

SELECT LEN(FirstName) FROM Employees 

SELECT LOWER(FirstName) FROM Employees 

SELECT UPPER(FirstName) FROM Employees 


SELECT DATEDIFF(MM,HireDate,GETDATE()) FROM Employees

SELECT DATENAME(MM,HireDate)  FROM Employees

SELECT DATEPART(MM,HireDate) FROM Employees

SELECT DAY(HireDate) FROM Employees

SELECT MONTH(HireDate) FROM Employees

SELECT SYSDATETIME() AS SystemDateTime

SELECT YEAR(HireDate) FROM Employees

SELECT MAX(Salary) FROM Employees

SELECT MIN(Salary) FROM Employees

SELECT count(Departmentid) FROM Employees



