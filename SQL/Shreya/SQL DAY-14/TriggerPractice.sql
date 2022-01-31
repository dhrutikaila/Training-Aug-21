CREATE TABLE EMP_HISTORY
(
ID INT IDENTITY(1,1),
ACTION VARCHAR(30)
)

ALTER TABLE EMP_HISTORY ALTER COLUMN ACTION VARCHAR(50)
---UPDATE TRIGGER EXAMPLE
CREATE TRIGGER trg_Update ON HumanResources.Employee
FOR UPDATE
AS
BEGIN
SELECT * FROM inserted
SELECT * FROM deleted
END

UPDATE HumanResources.Employee SET JobTitle='DEVELOPER' WHERE BusinessEntityID=5

SELECT * INTO ChangeRecord FROM HumanResources.Employee WHERE 1=0

---INSERT THE DELETED RECORD IN ANOTHER TABLE

ALTER TRIGGER [HumanResources].trg_Update ON HumanResources.Employee
FOR UPDATE
AS
BEGIN
INSERT INTO ChangeRecord
SELECT * FROM deleted
END

SELECT * FROM ChangeRecord


---INSERT TRIGGER
--create a trigger that stores transaction records of each insert operation

ALTER TRIGGER [dbo].trInsertEmployee ON Employees
FOR INSERT
AS
BEGIN
	DECLARE @ID INT
	SELECT @ID = EmployeeID FROM inserted
	INSERT INTO EMP_HISTORY
	VALUES ('Id :'+CAST(@ID AS VARCHAR(10))+'added on'+CAST(GETDATE() AS VARCHAR(50)))
END

SELECT * FROM Employees

INSERT INTO Employees VALUES(301,'shreya','Thakkar','shreya@gmail.com','9870087829','1987-06-22','developer',8000.00,0.10,103,60)

SELECT * FROM EMP_HISTORY

--create another trigger to store transaction records of each delete operation 

ALTER TRIGGER [dbo].trDeleteEmployee ON Employees
FOR DELETE
AS
BEGIN
	DECLARE @ID INT
	SELECT @ID = EmployeeID FROM deleted
	INSERT INTO EMP_HISTORY
	VALUES ('Id :'+CAST(@ID AS VARCHAR(10))+'delete on'+CAST(GETDATE() AS VARCHAR(50)))
END

DELETE FROM Employees WHERE EmployeeID=101

SELECT * FROM EMP_HISTORY

---DML TRIGGER -----> AFTER TRIGGER 

ALTER TRIGGER [dbo].trDeleteEmployee ON Employees
AFTER DELETE
AS
BEGIN
	DECLARE @ID INT
	SELECT @ID = EmployeeID FROM deleted
	INSERT INTO EMP_HISTORY
	VALUES ('Id :'+CAST(@ID AS VARCHAR(10))+'delete on'+CAST(GETDATE() AS VARCHAR(50)))
END

DELETE FROM Employees WHERE EmployeeID=101

SELECT * FROM EMP_HISTORY