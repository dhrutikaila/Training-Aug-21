

UPDATE dbo.Employees SET Email='Not avilable'
WHERE DepartmentID = (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName='Accounting')


