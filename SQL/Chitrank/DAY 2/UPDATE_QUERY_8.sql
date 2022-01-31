/*
Write a SQL statement to increase the salary of employees under the department 40, 90 
and 110 according to the company rules that, salary will be increased by 25% for the 
department 40, 15% for department 90 and 10% for the department 110 and the rest of the 
departments will remain same.
*/

UPDATE Employees
SET
Salary += (Salary * 0.25) WHERE DepartmentID = 40
UPDATE Employees
SET
Salary += (Salary * 0.15) WHERE DepartmentID = 90
UPDATE Employees
SET
Salary += (Salary * 0.10) WHERE DepartmentID = 110