/*Write a SQL statement to change the Email column of employees table with 
‘not available’ for those employees who belongs to the ‘Accouning’ department.
*/

UPDATE Employees
SET Email = 'not available'
WHERE DepartmentID=(
SELECT DepartmentID from Departments
WHERE DepartmentName = 'Accounting')
