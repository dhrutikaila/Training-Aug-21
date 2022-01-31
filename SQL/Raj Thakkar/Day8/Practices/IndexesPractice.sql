--CREATE--DROP--
CREATE INDEX IX_Employee_Salary
ON Employees (Salary ASC)

DROP INDEX Employees.IX_Employee_Salary

--To see index list in a table
sp_Helpindex Employees


--COMPOSITE CLUSTERED--
CREATE CLUSTERED INDEX IX_employees_Department_Salary
ON Employees(DepartmentId DESC, Salary ASC)


--UNIQUE NONClustered index--
CREATE UNIQUE NONCLUSTERED INDEX UIX_Emplyees_FirstName
ON Employees(FirstName, LastName)
