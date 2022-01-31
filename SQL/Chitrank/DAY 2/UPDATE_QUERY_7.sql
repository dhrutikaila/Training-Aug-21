/*
Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK
if the employee belongs to department, which ID is 30 and the existing job ID does 
not start with SH.
*/

UPDATE Employees
SET JobId = 'SH_CLERK' 
WHERE (EmployeeID = 118 and DepartmentID = 30 and JobId <> 'SH%')