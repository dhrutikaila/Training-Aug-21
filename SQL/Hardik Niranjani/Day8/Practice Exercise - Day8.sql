
-- Indexes =================================================

-- Createing an Index

CREATE INDEX IX_Employees_Salary
ON Employees (Salary ASC)

--System Sp
sp_Helpindex Employees


--Drop index
DROP INDEX Employees.IX_Employees_Salary


--Clustered Index
CREATE CLUSTERED INDEX IX_EmployeesCluster_Name
ON Employees (FirstName ASC)


-- NonClustered Index
CREATE NONCLUSTERED INDEX IX_EmployeesNonCluster_Name
ON Employees (FirstName ASC)


--Unique Index
