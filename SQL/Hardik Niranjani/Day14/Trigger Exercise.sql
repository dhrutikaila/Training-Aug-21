--Create Empty Table
SELECT * INTO TriggerEmployee FROM (
	SELECT * FROM Employees
	WHERE 1=0
	) TEMP

	SELECT * FROM TriggerEmployee
-------------------------------------

CREATE TABLE tblEmployeeAudit
(
	ID INT PRIMARY KEY IDENTITY,
	AuditData NVARCHAR(MAX)
)
SELECT * FROM tblEmployeeAudit

-- DML Trigger -- ========================================

--Insert Trigger--

CREATE TRIGGER  tr_tblEmployee_ForInsert
ON TriggerEmployee
FOR INSERT
AS
BEGIN
	
	DECLARE @Id INT
	SELECT @Id = EmployeeID FROM inserted
	
	INSERT INTO tblEmployeeAudit VALUES
	('New Employee with Id = ' + 
		CAST(@Id AS NVARCHAR(5)) + 
		'is added at' + CAST(GETDATE() AS NVARCHAR(20))
	)
END
 
 INSERT INTO TriggerEmployee VALUES('3', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90')

 SELECT * FROM TriggerEmployee
 SELECT * FROM tblEmployeeAudit


 --Delete Trigger--

 CREATE TRIGGER tr_tblEmployee_ForDelete 
 ON TriggerEmployee
 FOR DELETE 
 AS
 BEGIN
		DECLARE @Id INT
		SELECT @Id = EmployeeID FROM deleted

		INSERT INTO tblEmployeeAudit VALUES
		('An existing employee with Id = ' + 
		  CAST(@Id AS NVARCHAR(5)) + 
		  'is deleted at' + CAST(GETDATE() AS NVARCHAR(20))
	     )

 END

 DELETE FROM TriggerEmployee WHERE EmployeeID = 3

 SELECT * FROM TriggerEmployee
 SELECT * FROM tblEmployeeAudit

 
-- After Trigger -- ========================================

CREATE TRIGGER tr_tblEmployee_ForUpdate
ON TriggerEmployee
FOR UPDATE
AS
BEGIN

	DECLARE @Id INT
	SELECT * FROM inserted
	SELECT * FROM deleted

END

UPDATE TriggerEmployee 
	   SET FirstName='Stave', LastName='Jobs' WHERE EmployeeID=3

 SELECT * FROM TriggerEmployee
 SELECT * FROM tblEmployeeAudit

