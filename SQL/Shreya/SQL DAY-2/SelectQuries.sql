--1
SELECT * FROM Employees

--2
SELECT FirstName,LastName FROM Employees

--3 
SELECT FirstName AS EmployeeName FROM Employees

--4 
SELECT * FROM Employees WHERE FirstName='Steven'

--5 
SELECT * FROM Employees WHERE FirstName IN ('Neena','Lex')

--6
SELECT * FROM Employees WHERE FirstName NOT IN ('Neena','Lex')

--7 
SELECT * FROM Employees WHERE Salary BETWEEN 5000 AND 8000

--8
SELECT FirstName +' '+LastName AS Employeename , Salary , PF=0.12*Salary FROM Employees

--9	
SELECT * FROM Employees WHERE FirstName LIKE 'N%'

--10
SELECT DISTINCT DepartmentID FROM Employees

--11
SELECT * FROM Employees ORDER BY FirstName DESC

--12
SELECT EmployeeID,FirstName, LastName ,Salary FROM Employees ORDER BY Salary ASC

--13
SELECT TOP 2 Salary,FirstName FROM Employees 