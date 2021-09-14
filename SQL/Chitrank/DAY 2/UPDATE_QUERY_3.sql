/*
Write a SQL statement to change the Email and CommissionPct column of employees 
TABLE with �not available� and 0.10 for those employees whose DepartmentID is 110.
*/


UPDATE Employees
SET Email = 'not available',CommissionPct=0.10 WHERE DepartmentID = 110)