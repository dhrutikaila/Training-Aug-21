UPDATE Employees 
SET email='Not Available (Task5)' 
WHERE DepartmentID=(SELECT DepartmentID
FROM Departments WHERE DepartmentName='Accounting');

SELECT * FROM Employees
