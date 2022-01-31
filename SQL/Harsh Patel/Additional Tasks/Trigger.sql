--Insert Trigger

SELECT * FROM Departments


ALTER TRIGGER trgInsert
ON Departments
FOR INSERT
AS
BEGIN
	INSERT INTO Temp SELECT * FROM inserted
END


INSERT INTO Departments VALUES(101,'IT',501,2001)
INSERT INTO Departments VALUES(102,'IT',502,2002)
INSERT INTO Departments VALUES(103,'IT',503,2003)


SELECT * INTO Temp  FROM Departments WHERE 1=0
SELECT * FROM Temp

--Delete Trigger

CREATE TRIGGER trgDelete
ON Departments
FOR DELETE
AS
BEGIN

	SELECT * FROM deleted  		
END

DELETE FROM Departments WHERE DepartmentID=101
DELETE FROM Departments WHERE DepartmentID=102
DELETE FROM Departments WHERE DepartmentID=103

ALTER TRIGGER trgDelete
ON Departments
FOR DELETE
AS
BEGIN
	
 
	INSERT INTO TempDelete SELECT * FROM deleted
	 
END
DELETE FROM Departments WHERE DepartmentID=210

SELECT * INTO TempDelete FROM Departments WHERE	1=0
SELECT * FROM TempDelete

--Update Trigger

CREATE TRIGGER tgrUpdate
ON Departments

FOR UPDATE
AS
BEGIN
	INSERT INTO Temp SELECT * FROM inserted
	INSERT INTO TempDelete SELECT * FROM deleted

END
UPDATE Departments SET DepartmentName='IT' WHERE DepartmentID=20
SELECT * FROM Temp
SELECT * FROM TempDelete


SELECT * FROM Departments1

--Instead Of Insert Trigger

ALTER TRIGGER trgInsteadOfInsert
ON Departments1
INSTEAD OF INSERT
AS
BEGIN

	INSERT INTO Temp SELECT * FROM inserted

END
INSERT INTO Departments1 Values(1002,'IT',2001,3001)
SELECT * FROM Temp

--Insead Of Delete  trigger

CREATE TRIGGER trgInsteadOfDelete
ON Departments1
INSTEAD OF DELETE
AS
BEGIN

	INSERT INTO TempDelete SELECT * FROM deleted

END
DELETE FROM Departments1 WHERE ID=260
SELECT * FROM TempDelete
SELECT * FROM Departments1

--Insead Of Update  trigger

CREATE TRIGGER trgInsteadOfUpdate
ON Departments1
INSTEAD OF Update
AS
BEGIN

		INSERT INTO Temp SELECT * FROM inserted
	INSERT INTO TempDelete SELECT * FROM deleted

END
 
SELECT * FROM TempDelete
SELECT * FROM Temp
SELECT * FROM Departments1

--DDL TRIGGER


ALTER TRIGGER CreateALterDropTabel
ON DATABASE
FOR CREATE_TABLE,DROP_TABLE,ALTER_TABLE
AS
BEGIN
		SELECT 'You Have Created,Altered Or Delated Table'
		
END
CREATE TABLE Dep(DepID INT PRIMARY KEY NOT NULL)


