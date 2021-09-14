/*Write a SQL statement to change the Email column of employees TABLE with 
�not available� for those employees whose DepartmentID is 80 and gets a commission 
is less than 20%
*/

UPDATE Employees
SET Email = 'not available'
WHERE (DepartmentID = 80 and CommissionPct < 20)