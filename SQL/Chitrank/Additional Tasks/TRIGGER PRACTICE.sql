--TRYING FOR|AFTER IN TRIGGER
ALTER TRIGGER TRG1
ON dbo.Person
AFTER INSERT,UPDATE,DELETE
AS
PRINT(1)
IF 1/0 >0
PRINT(2)
GO

SET NOCOUNT ON
INSERT INTO Person VALUES(7,'Sudhir')
SET NOCOUNT OFF

---------------------------------------------------------------------

--TRYING INSTEAD OF IN TRIGGER
ALTER TRIGGER TRG1
ON dbo.Person
INSTEAD OF INSERT,UPDATE,DELETE
AS
PRINT('Sorry But you do not have access')
GO

SET NOCOUNT ON
INSERT INTO Person VALUES(7,'Sudhir')
SET NOCOUNT OFF


ALTER TRIGGER TRG2
ON dbo.Person
AFTER INSERT 
AS
IF (ROWCOUNT_BIG() = 0)
RETURN;
IF EXISTS (SELECT 1  
           FROM inserted AS i   
           JOIN Employees AS e   
           ON e.EmployeeID = i.ID
           WHERE  JobID = 'IT_PROG'  
          )  
BEGIN
RAISERROR('Sorry cant do this insertion',16,10);
ROLLBACK TRANSACTION;
RETURN
END;
GO


INSERT INTO Person VALUES(106,'Snehal')

--CREATING TRIGGER FOR INSERT,UPDATE,DELETE FOR MULTIPLE TABLE

ALTER TRIGGER TRIG3
ON dbo.jsontable1
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
--INSERT INTO Person
--SELECT ID,Name FROM inserted
--INSERT INTO Skills
--SELECT ID,Skills FROM inserted
--INSERT INTO Qualifications
--SELECT ID,Degree,Year,Grade FROM inserted

UPDATE Person
SET Name = (SELECT Name FROM inserted) 
WHERE ID = (SELECT ID FROM inserted)

END


INSERT INTO jsontable1 
VALUES (7,'Yash','Java','BE',2021,'A')

UPDATE jsontable1
SET Name = 'Jaimin' WHERE ID = 7

