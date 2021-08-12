use test1
--1
SELECT* FROM Employees
ORDER BY FirstName DESC;
--2
SELECT FirstName,LastName,salary,salary*.12 PF
  FROM Employees;
--3
  SELECT EmployeeID,FirstName,LastName,salary
  FROM Employees
  ORDER BY Salary;
 --4
  SELECT SUBSTRING(FirstName,1,3)
  FROM Employees;
--5 
  SELECT FirstName AS "EMPLOYEE NAME" FROM Employees;
--6
  SELECT * FROM  Employees
  WHERE Salary BETWEEN 5000 and 8000;
--7
  SELECT FirstName "NAME" 
  FROM Employees
  WHERE FirstName LIKE 'd%'
  ORDER BY FirstName;
--8   
   SELECT DISTINCT DepartmentId
     FROM Employees;
--9
	 SELECT MAX(salary) FROM Employees
	 WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employees);
--10
SELECT * FROM dbo.Employees WHERE FirstName='Steven';
--11
SELECT * FROM dbo.Employees WHERE FirstName IN('Neena','Lex');
--12

SELECT * FROM dbo.Employees WHERE FirstName NOT IN('Neena','Lex');
--13
SELECT TOP 2 Salary FROM dbo.Employees;