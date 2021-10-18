--update queries
--task1-Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.

ALTER TABLE Employees DROP CONSTRAINT ukEmail

UPDATE Employees SET Email='not available'

--task2-Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.

UPDATE Employees SET Email='not available', CommissionPct=0.10

--task3-Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.

UPDATE Employees SET Email='not available', CommissionPct=0.10 WHERE DepartmentID=110;

--task4-Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%

UPDATE Employees SET Email='not available' WHERE DepartmentID=80 AND CommissionPct<0.20

--task5-Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.

UPDATE Employees SET Email='not available' FROM Employees E join Departments D ON D.DepartmentID=E.DepartmentID WHERE D.DepartmentName='Accounting'

--task6-Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.

UPDATE Employees SET Salary = CASE WHEN salary<5000 then 8000 ELSE Salary END WHERE EmployeeID=105

--task7-Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.

UPDATE Employees SET JobId='SH_CLERK' WHERE EmployeeID=118 AND DepartmentID=30 AND JobId!='SH%'

--task8-Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.

UPDATE Employees 
	SET Salary = 
		CASE 
		WHEN DepartmentID=40 
			THEN Salary+((0.25*Salary))
		WHEN DepartmentID=90
			THEN (Salary+(0.15*Salary))
		WHEN DepartmentID=110
			THEN (Salary+(0.10*Salary))
		ELSE 
			Salary
		END



--basic select queries
--task1-Get all employee details from the Employee table

SELECT * FROM Employees

--task2-Get FirstName, LastName from Employees table

SELECT FirstName,LastName FROM Employees

--task3-Get FirstName from Employees table using alias name “Employee Name”

SELECT FirstName AS 'Employee Name' FROM Employees

--task4-Get employee details from Employees table whose Employee Name is “Steven”

SELECT * FROM Employees WHERE FirstName='Steven'

--task5-Get employee details from Employees table whose Employee Name are “Neena” and “Lex”

SELECT * FROM Employees WHERE FirstName='Neena' OR FirstName='Lex'

--task6-Get employee details from Employees table whose Employee name are not “Neena” and “Neena”

SELECT * FROM Employees WHERE FirstName!='Neena' OR FirstName!='Nina'

--task7-Get employee details from Employees table whose Salary between 5000 and 8000

SELECT * FROM Employees WHERE Salary BETWEEN 5000 AND 8000

--task8-Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary).

SELECT CONCAT(FirstName,' ', LastName) AS names,Salary,(Salary*0.12) AS 'PF' FROM Employees

--task9-Get employee details from Employees table whose FirstName starts with ‘N’

SELECT * FROM Employees WHERE FirstName LIKE 'N%'

--task10-Write a query to get unique department ID from Employees table

SELECT DISTINCT DepartmentID FROM Employees;

--task11-Write a query to get unique department ID from Employees table

SELECT * FROM Employees ORDER BY FirstName DESC

--task12-Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary.

SELECT EmployeeID,  CONCAT(FirstName,' ', LastName) AS Names, Salary FROM Employees ORDER BY Salary ASC

--task13-Select TOP 2 salary from employee table

SELECT TOP 2 Salary FROM Employees 
