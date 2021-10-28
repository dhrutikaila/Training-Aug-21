--Update Queries:

SELECT * INTO Employees1 FROM Employees

--1 Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.
UPDATE Employees1 SET Email= 'not available'

--2 Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.
UPDATE Employees1 SET Email= 'not available',CommissionPct=0.10

--3 Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.
UPDATE Employees1 SET Email= 'not available',CommissionPct=0.10 WHERE DepartmentID=  110

--4 Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%
UPDATE Employees1 SET Email= 'not available' WHERE  DepartmentID= 80 and CommissionPct <0.20

--5 Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.
UPDATE Employees1 SET Email= 'not available' WHERE JObId='AC_ACCOUNT'

--6 Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
UPDATE Employees1SET salary= 8000 WHERE EmployeeID=105 and Salary <5000

--7 Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH
UPDATE Employees1 SET JobId='SH_CLERK' WHERE EmployeeID=118 AND DepartmentID=30 AND NOT JobId LIKE 'SH%'

--8 Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
UPDATE Employees1 SET Salary= CASE DepartmentID WHEN 40 THEN Salary+(salary*0.25) WHEN 90 THEN Salary+(salary*0.15) WHEN 110 THEN Salary+(salary*0.10) ELSE salary END




-- Basic SELECT Queries:

--1 Get all employee details FROM the Employee table
SELECT * FROM Employees

--2 Get FirstName, LastName FROM Employees table
SELECT FirstName, LastName FROM Employees

--3 Get FirstName FROM Employees table using alias name “Employee Name”
SELECT FirstName 'Employee Name' FROM Employees WHERE FirstName='alias'

--4 Get employee details FROM Employees table whose Employee Name is “Steven”
SELECT * FROM Employees WHERE FirstName= 'Steven'

--5 Get employee details FROM Employees table whose Employee Name are “Neena” and “Lex”
SELECT *  FROM Employees WHERE FirstName='Neena' or  FirstName='Lex'

--6 Get employee details FROM Employees table whose Employee name are not “Neena” and “Neena”
SELECT *  FROM Employees WHERE  not  FirstName='Neena'

--7 Get employee details FROM Employees table whose Salary between 5000 and 8000
SELECT *  FROM Employees WHERE    Salary BETWEEN  5000 and 8000

--8 Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).
SELECT  FirstName+' '+LastName AS name,Salary ,(Salary*12)/100 AS PF  FROM Employees

--9 Get employee details FROM Employees table whose FirstName starts with ‘N’
SELECT * FROM Employees WHERE FirstName LIKE 'N%'

--10 Write a query to get unique department ID FROM Employees table
SELECT DISTINCT DepartmentID FROM Employees

--11 Write a query to get all employee details FROM the employee table order by FirstName, descending.
SELECT * FROM Employees ORDER BY  FirstName DESC

--12 Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.
SELECT EmployeeID,FirstName+' '+LastName AS name,salary FROM Employees  ORDER by  salary ASC

--13 SELECT TOP 2 salary FROM employee table
SELECT TOP 2 * FROM Employees  ORDER by salary DESC 


