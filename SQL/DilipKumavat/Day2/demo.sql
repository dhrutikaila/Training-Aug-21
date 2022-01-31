
---ALL EMPLOYEE DETAILS---
SELECT * FROM Employees;

---REMOVING THE CONSTRAINT---
ALTER TABLE Employees DROP CONSTRAINT ukEmail

---Query 1. Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.---
UPDATE Employees SET Email = 'not available'

---Query 2. Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.---
UPDATE Employees SET Email = 'not available' , CommissionPct = 0.10

---Query 3. Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.---
UPDATE Employees SET Email = 'Not Available' , CommissionPct = 0.10 WHERE DepartmentID = 110

---Query 4. Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees 
--- whose DepartmentID is 80 and gets a commission is less than 20% ---
UPDATE Employees SET Email = 'NOT AVAILABLE' WHERE DepartmentID = 80 AND CommissionPct < 0.20

---Query 5. Write a SQL statement to change the Email column of employees table with ‘not available’ 
--   for those employees who belongs to the ‘Accouning’ department.---
UPDATE Employees SET EMAIL = 'NoT Available' WHERE JobId LIKE '%ACCOUNT'

---Query 6. Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.---
UPDATE Employees SET Salary = 8000 WHERE EmployeeID = 105 AND Salary < 5000

---Query 7. Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK 
--   if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.---
UPDATE Employees SET JobId = 'SH_CLERK' WHERE DepartmentID = 30 AND JobId NOT LIKE 'SH%' AND EmployeeID = 118

---Query 8.  Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according 
--   to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 
--   and 10% for the department 110 and the rest of the departments will remain same.---
UPDATE Employees SET Salary += (Salary* 0.25) WHERE DepartmentID = 40

UPDATE Employees SET Salary += (Salary* 0.15) WHERE DepartmentID = 90

UPDATE Employees SET Salary += (Salary* 0.10) WHERE DepartmentID = 110

---OR---

UPDATE Employees SET Salary += CASE DepartmentID WHEN 40 THEN Salary * 0.25 
						 WHEN 90 THEN Salary * 0.15
						 WHEN 110 THEN Salary * 0.10
						 ELSE 0
						 END
						 
--- Query 9 Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary 
--   for those employees by 20% and commission by 10% .
UPDATE Employees SET Salary+=(Salary * 0.20), CommissionPct+=(CommissionPct*0.10)  WHERE JobId = 'PU_CLERK'
                         
---------------------------------------------------------------------------------                         
--- Query 1 Get all employee details from the Employee table ---
SELECT * FROM Employees;

--- Query 2 Get FirstName, LastName from Employees table ---
SELECT FirstName,LastName FROM Employees

--- Query 3 Get FirstName from Employees table using alias name “Employee Name” ---
SELECT 'Employee Name' = FirstName FROM Employees

--- Query 4 Get employee details from Employees table whose Employee Name is “Steven” ---
SELECT * FROM Employees WHERE FirstName = 'Steven'

--- Query 5 Get employee details from Employees table whose Employee Name are “Neena” and “Lex” --- 
SELECT * FROM Employees WHERE FirstName = 'Neena' OR FirstName = 'Lex'

--- Query 6 Get employee details from Employees table whose Employee name are not “Neena” and “Neena” ---
SELECT * FROM Employees WHERE FirstName <> 'Neena'

--- Query 7 Get employee details from Employees table whose Salary between 5000 and 8000 ---
SELECT * FROM Employees WHERE Salary BETWEEN 5000 AND 8000

--- Query 8 Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary). ---
SELECT FirstName,LastName,Salary,'PF ' = Salary*0.12 FROM Employees

--- Query 9 Get employee details from Employees table whose FirstName starts with ‘N’ ---
SELECT FirstName FROM Employees WHERE FirstName LIKE 'N%'

--- Query 10 Write a query to get unique department ID from Employees table ---
SELECT DISTINCT DepartmentId FROM Employees

--- Query 11 Write a query to get all employee details from the employee table order by FirstName, descending. ---
SELECT * FROM Employees ORDER BY FirstName DESC

--- Query 12 Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary. ---
SELECT EmployeeID,FirstName,LastName,Salary FROM Employees ORDER BY Salary ASC


--- Query 13 Select TOP 2 salary from employee table ---
SELECT TOP 2 Salary FROM Employees
