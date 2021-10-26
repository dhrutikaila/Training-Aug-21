use test1
--1 Get all employee details from the Employee table
SELECT* FROM Employee
ORDER BY FirstName DESC;

--2 Get FirstName, LastName from Employees table
  SELECT DISTINCT DepartmentId
     FROM Employee;
--3 Get FirstName from Employees table using alias name “Employee Name”
  SELECT EmployeeID,FirstName,LastName,salary
  FROM Employee
  ORDER BY Salary;

 --4 Get employee details from Employees table whose Employee Name is “Steven”
  SELECT SUBSTRING(FirstName,1,3)
  FROM Employee;

--5 Get employee details from Employees table whose Employee Name are “Neena” and “Lex”
 
  SELECT * FROM dbo.Employee WHERE FirstName IN('Neena','Lex');
--6 Get employee details from Employees table whose Employee name are not “Neena” and “Neena”
 
  SELECT * FROM dbo.Employee WHERE FirstName NOT IN('Neena','Lex');
--7 Get employee details from Employees table whose Salary between 5000 and 8000

   SELECT * FROM  Employee
  WHERE Salary BETWEEN 5000 and 8000;

--8 Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).  
 
	 SELECT FirstName,LastName,salary,salary*.12 PF
  FROM Employee;


--9 Get employee details from Employees table whose FirstName starts with ‘N’
	 

  SELECT FirstName "NAME" 
  FROM Employee
  WHERE FirstName LIKE 'N%'
  ORDER BY FirstName;
--10 Write a query to get unique department ID from Employees table
SELECT * FROM dbo.Employee WHERE FirstName='Steven';

--11 Write a query to get all employee details from the employee table order by FirstName, descending.
 SELECT FirstName AS "EMPLOYEE NAME" FROM Employee;

--12 Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.
SELECT employeeID,  (firstname  +lastname) 'names', salary 
FROM Employee
ORDER BY Salary ASC

--13 Select TOP 2 salary from employee table
SELECT TOP 2 Salary FROM dbo.Employee;

















