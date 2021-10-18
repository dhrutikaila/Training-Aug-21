select  employeeid from employees

SELECT * FROM  Employees;


SELECT FirstName, LastName FROM  Employees;

SELECT FirstName 'Employee name' FROM  Employees;

SELECT * FROM  Employees WHERE FirstName='Steven';

SELECT * FROM  Employees WHERE FirstName IN('chirag','chapaneri');

SELECT * FROM  Employees WHERE FirstName NOT IN('chirag','chapaneri');

SELECT * FROM  Employees WHERE EmployeeId BETWEEN 112 AND 120;


SELECT FirstName FROM  Employees WHERE FirstName like 'b%'

SELECT Distinct Salary FROM  Employees;

SELECT * FROM  Employees ORDER BY FirstName DESC;


SELECT EmployeeID, FirstName+' '+LastName AS Name, Salary FROM  Employees ORDER BY Salary ASC;

SELECT * FROM Employees WHERE Salary > 30000


SELECT * FROM Employees WHERE DepartmentID = 90 OR DepartmentID = 60

SELECT * FROM Employees WHERE Salary BETWEEN 20000 AND 50000


SELECT * FROM Employees WHERE jobId IN ('sa_rep')

SELECT * FROM Employees WHERE DepartmentID   IN (100,90,50)


SELECT firstName FROM Employees WHERE FirstName LIKE '%v'

SELECT TOP 10 * FROM Employees WHERE DepartmentId=100

SELECT DISTINCT DepartmentID FROM Employees

SELECT * FROM Employees ORDER BY Salary




