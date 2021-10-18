---2.1---
SELECT * FROM dbo.Employees;

----2.2

SELECT FirstName, LastName FROM dbo.Employees;
----2.3

SELECT FirstName 'Employee name' FROM dbo.Employees;

---2.4
SELECT * FROM dbo.Employees WHERE FirstName='Steven';

----2.5
SELECT * FROM dbo.Employees WHERE FirstName IN('Neena','Lex');

----2.6
SELECT * FROM dbo.Employees WHERE FirstName NOT IN('Neena','Lex');

---2.7--
SELECT * FROM dbo.Employees WHERE Salary BETWEEN 5000 AND 8000;

---2.8--
SELECT FirstName+' '+LastName AS Name,Salary,PF=.12*Salary  FROM dbo.Employees;

---2.9--
SELECT FirstName FROM dbo.Employees WHERE FirstName like 'N%'

----2.10---
SELECT Distinct DepartmentID FROM dbo.Employees;

----2.11

SELECT * FROM dbo.Employees ORDER BY FirstName DESC;

---2.12

SELECT EmployeeID, FirstName+' '+LastName AS Name, Salary FROM dbo.Employees ORDER BY Salary ASC;

----2.13
SELECT TOP 2 Salary FROM dbo.Employees;

