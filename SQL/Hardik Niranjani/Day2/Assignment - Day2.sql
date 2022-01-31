--Update Queries(1)
--Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.

ALTER TABLE Employees
DROP CONSTRAINT ukEmail
UPDATE Employees SET email='not available'
SELECT * FROM Employees


--Update Queries(2)
--Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ 
--and 0.10 for all employees.

UPDATE employees SET email='not available', CommissionPct=0.10
SELECT * FROM Employees


--Update Queries(3)
--Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 
--0.10 for those employees whose DepartmentID is 110.

UPDATE employees SET email='not available', CommissionPct=0.10 WHERE DepartmentId=110
SELECT * FROM Employees

	
--Update Queries(4)
--Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees 
--whose DepartmentID is 80 and gets a commission is less than 20%

UPDATE employees SET email='not avaliable' WHERE DepartmentId = 80 AND CommissionPct<0.20
SELECT * FROM Employees


--Update Queries(5)
--Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees 
--who belongs to the ‘Accouning’ department.

UPDATE Employees
SET Email = 'not available'
FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
AND d.DepartmentName = 'Accounting'
SELECT * FROM Employees


--Update Queries(6)
--Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.

UPDATE Employees SET Salary = 8000 WHERE EmployeeID = 105 AND Salary < 5000
SELECT * FROM Employees


--Update Queries(7)
--Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, 
--which ID is 30 and the existing job ID does not start with SH

UPDATE Employees SET JobId= 'SH_CLERK' WHERE EmployeeID=118 AND DepartmentID=30 AND NOT JobId LIKE 'SH%'
SELECT * FROM Employees


--Update Queries(8)
--Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company 
--rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 
--and the rest of the departments will remain same

UPDATE Employees SET Salary= CASE DepartmentID 
	WHEN 40 THEN Salary+(Salary*0.25)
	WHEN 90 THEN Salary+(Salary*0.15)
	WHEN 110 THEN Salary+(Salary*0.10)
	ELSE Salary
	END
	WHERE DepartmentID IN (10,90,118,110,40)
SELECT * FROM Employees



--Update Queries(9)
--Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for 
--those employees by 20% and commission by 10% .

UPDATE Employees 
SET Salary += (Salary * 20 /100) + 2000, CommissionPct += 0.10
WHERE JobId LIKE 'PU_CLERK' 
SELECT * FROM Employees

-------------------------------------------------------------------------------------------------------------

--Basic Select Queries(1)
--Get all employee details from the Employee table

SELECT * FROM Employees


--Basic Select Queries(2)
--Get FirstName, LastName from Employees table

SELECT FirstName, LastName FROM Employees


--Basic Select Queries(3)
--Get FirstName from Employees table using alias name “Employee Name”

SELECT FirstName "Employee Name" FROM Employees


--Basic Select Queries(4)
--Get employee details from Employees table whose Employee Name is “Steven”

SELECT FirstName FROM Employees WHERE FirstName = 'Steven'


--Basic Select Queries(5)
--Get employee details from Employees table whose Employee Name are “Neena” and “Lex”

SELECT FirstName FROM Employees WHERE FirstName = 'Neena' OR FirstName = 'Lex'


--Basic Select Queries(6)
--Get employee details from Employees table whose Employee name are not “Neena” and “Neena”

SELECT FirstName FROM Employees WHERE FirstName != 'Neena' OR FirstName != 'Neena'


--Basic Select Queries(7)
--Get employee details from Employees table whose Salary between 5000 and 8000

SELECT * FROM Employees WHERE Salary BETWEEN 5000 AND 8000


--Basic Select Queries(8)
--Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).

SELECT FirstName,LastName, Salary, Salary*0.12 "PF" FROM Employees


--Basic Select Queries(9)
--Get employee details from Employees table whose FirstName starts with ‘N’

SELECT FirstName FROM Employees WHERE FirstName LIKE 'N%'


--Basic Select Queries(10)
--Write a query to get unique department ID from Employees table

SELECT DISTINCT DepartmentId FROM Employees


--Basic Select Queries(11)
--Write a query to get all employee details from the employee table order by FirstName, descending.

SELECT * FROM Employees ORDER BY FirstName DESC


--Basic Select Queries(12)
--Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.

SELECT DepartmentId, FirstName, LastName, Salary FROM Employees ORDER BY Salary ASC


--Basic Select Queries(13)
--Select TOP 2 salary from employee table

SELECT TOP 2 Salary FROM Employees

