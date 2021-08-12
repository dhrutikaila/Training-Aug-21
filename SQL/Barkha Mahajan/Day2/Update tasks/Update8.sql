UPDATE Employees SET Salary += Salary*0.25 where DepartmentID = 40
UPDATE Employees SET Salary += Salary*0.15 where DepartmentID = 90
UPDATE Employees SET Salary += Salary*0.10 where DepartmentID = 110

SELECT * FROM Employees
