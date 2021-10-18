/*Write a SQL statement to change the Email column of employees TABLE with 
�not available� for those employees who belongs to the �Accouning� department.
*/

UPDATE Employees
SET Email = 'not available'
WHERE DepartmentID=(
SELECT DepartmentID FROM Departments
WHERE DepartmentName = 'Accounting')
