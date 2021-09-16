CREATE TABLE Recursive1
(
Id1 INT PRIMARY KEY,
Val1 INT 
)

INSERT INTO Recursive1 VALUES (1,2), (2,3), (3,5), (4,5)
SELECT * INTO Recursive2 FROM Recursive1
SELECT * INTO Recursive3 FROM Recursive1


CREATE TRIGGER TRG_Recursive1
ON Recursive1
FOR UPDATE
AS
BEGIN
      UPDATE Recursive2 
	  SET Val1 = 6
	  WHERE Id1 = 4
END 
GO


CREATE TRIGGER TRG_Recursive2
ON Recursive2
FOR UPDATE
AS
BEGIN
      UPDATE Recursive3 
	  SET Val1 = 6
	  WHERE Id1 = 4
END 
GO


CREATE TRIGGER TRG_Recursive3
ON Recursive3
FOR UPDATE
AS
BEGIN
      UPDATE Recursive1 
	  SET Val1 = 6
	  WHERE Id1 = 4
END 
GO

UPDATE Recursive1 
	  SET Val1 = 6
	  WHERE Id1 = 4

	  EXEC sp_configure 'nested triggers',0