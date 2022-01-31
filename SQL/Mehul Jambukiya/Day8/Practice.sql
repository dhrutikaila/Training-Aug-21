USE Practice

--CLUSTERED INDEX

CREATE CLUSTERED INDEX IndexOnEmpID
ON Employees(EmployeeID)

ALTER TABLE Employees DROP CONSTRAINT pkEmployeeID

DROP INDEX Employees.IndexOnEmpID

--NON-CLUSTERED INDEX

CREATE NONCLUSTERED INDEX NonClusteredIndexOnEmpID
ON Employees(EmployeeID)

SELECT * FROM EMployees

DROP INDEX Employees.NonClusteredIndexOnEmpID
