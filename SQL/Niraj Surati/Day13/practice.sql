USE Assignment2

-- TRIGGER

-- UPDATE

SELECT * 
FROM Departments
GO

CREATE TRIGGER trgDepartmentUpdate
ON Departments 
FOR UPDATE
AS
BEGIN
	INSERT INTO Department_copy (DepartmentID
		,	DepartmentName
		,	ManagerID
		,	LocationID)
	SELECT DepartmentID
		,	DepartmentName
		,	ManagerID
		,	LocationID
	FROM deleted
END
GO

DROP TRIGGER trgDepartmentUpdate
GO

UPDATE Departments
SET DepartmentName = 'NOC'
WHERE DepartmentID = 220
GO



SELECT *
FROM Department_copy
GO

ALTER TABLE Department_copy
	ALTER COLUMN UpdatedON DATETIME  NULL

SP_HELP Department_copy

CREATE TABLE Info(
		ID INT
	, FirstName VARCHAR(30)
)
GO


-- INSERT 


CREATE TRIGGER trgDepartmentInsert
ON Departments 
FOR INSERT
AS
BEGIN
	INSERT INTO DepartmentInsert (DepartmentID
		,	DepartmentName
		,	ManagerID
		,	LocationID)
	SELECT DepartmentID
		,	DepartmentName
		,	ManagerID
		,	LocationID
	FROM inserted
END
GO

DROP TRIGGER trgDepartmentInsert

INSERT INTO Departments
VALUES(290,'Gaming',0,1700)

SELECT *
FROM DepartmentInsert

ALTER TABLE DepartmentInsert
ADD CreatedON DATETIME DEFAULT GETDATE()
GO

SP_HELP DepartmentInsert

-- DELETE

CREATE TABLE DeletedDepartment(
		ID INT
	,	Name VARCHAR(30)
	,	DeletedON DATETIME DEFAULT GETDATE()
)
Go

CREATE TRIGGER tgrDeletedDepartment
ON Departments
FOR DELETE
AS
BEGIN
	INSERT INTO DeletedDepartment
			(ID
		,	Name)
	SELECT DepartmentID
		,	DepartmentName
	FROM deleted
END
GO

DELETE FROM Departments
WHERE DepartmentID = 280

SELECT *
FROM DeletedDepartment
GO
-- DELETE AFTER

CREATE TRIGGER tgrDeletedAfterDepartment
ON Departments
AFTER DELETE
AS
BEGIN
	PRINT 'Record is Deleted successfully'
END

DROP TRIGGER tgrDeletedAfterDepartment
GO

-- DELETE INSTED OF

CREATE TRIGGER tgrDeletedInsteadEmployees
ON Employees
INSTEAD OF DELETE 
AS
BEGIN
	SET NOCOUNT ON
	PRINT 'Sorry you can''t Delete records from this table. Please disable trigger first.'
	SET NOCOUNT OFF
END

DROP TRIGGER tgrDeletedInsteadEmployees

DELETE FROM Employees 
WHERE EmployeeID = 100
GO

-- ENABLE AND DESABLE TRIGGER 

DISABLE TRIGGER tgrDeletedInsteadEmployees ON Employees
GO
ENABLE TRIGGER tgrDeletedInsteadEmployees ON Employees
GO

-- DDL TRIGGERS

-- 

CREATE TRIGGER tgrAccessControl
ON DATABASE
FOR DROP_TABLE,ALTER_TABLE
AS
BEGIN
	PRINT 'Please Desable trigger to make changes'
	ROLLBACK
END
GO

DROP TRIGGER tgrAccessControl ON DATABASE
GO

ENABLE TRIGGER tgrAccessControl ON DATABASE
GO
DISABLE TRIGGER tgrAccessControl ON DATABASE
GO

