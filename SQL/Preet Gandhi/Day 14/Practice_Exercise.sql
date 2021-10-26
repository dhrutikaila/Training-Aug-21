USE AdventureWorks2016

--Create trigger for insert-- 
CREATE TRIGGER trgInsertScrapReason
ON Production.ScrapReason
FOR INSERT
AS
BEGIN
	SELECT * FROM inserted
	SELECT * FROM deleted
END

INSERT INTO Production.ScrapReason VALUES
	('Color is  Proper',GETDATE())
---------------------------------------------------

--CREATE TRIGGER FOR UPDATE
CREATE TRIGGER trgUpdateScrapReason
ON Production.ScrapReason
FOR UPDATE
AS
BEGIN
	SELECT * FROM inserted
	SELECT * FROM deleted
END

UPDATE Production.ScrapReason SET ModifiedDate = GETDATE()  WHERE ScrapReasonID = 16
-------------------------------------------------------------------------------------------

--CREATE TRIGGER AND ADD DELETED DATA INTO NEW TABLE--
SELECT * INTO ScrapReasonDeletedData FROM Production.ScrapReason WHERE 1=0 

CREATE TRIGGER trgDeleteScrapReason
ON Production.ScrapReason
FOR DELETE
AS
BEGIN
	--SELECT * FROM inserted
	INSERT INTO dbo.ScrapReasonDeletedData
	SELECT Name,ModifiedDate FROM deleted
END

DELETE FROM Production.ScrapReason WHERE ScrapReasonID = 19
SELECT * FROM ScrapReasonDeletedData

SELECT * FROM  Production.ScrapReason
----------------------------------------------------------------

--CREATE TRIGGER FOR INSERT and UPDATE--
CREATE TRIGGER trgInsertUpdateShift
ON HumanResources.Shift
FOR INSERT,UPDATE
AS
BEGIN
	DECLARE @ModifiedDate DATETIME
	SELECT @ModifiedDate = ModifiedDate FROM inserted
	IF (@ModifiedDate != GETDATE())
	BEGIN
	PRINT 'The modified date should be the current date.'
	END
END

INSERT INTO HumanResources.Shift VALUES('Yesterday','23:00:00.0010030','07:00:00.0022000','2008-04-30 01:00:01.000')
UPDATE HumanResources.Shift SET ModifiedDate = '2008-04-30 02:00:00.001' WHERE ShiftID = 8
SELECT * FROM HumanResources.Shift
-------------------------------------------------------------------------------------------------

--USE AFTER while CREATING TRIGGER--
CREATE TRIGGER trgUseAfter
ON Production.ScrapReason
AFTER INSERT,UPDATE
AS
BEGIN 
	DECLARE @ModifiedDate DATETIME, @ID INT

	SELECT @ModifiedDate = ModifiedDate, @ID = ScrapReasonID FROM inserted
	IF(@ModifiedDate > GETDATE())
	BEGIN
		PRINT('ModifiedDate cant be a Future Date')
		UPDATE Production.ScrapReason SET ModifiedDate = GETDATE() WHERE ScrapReasonID = @ID
	END
END

INSERT INTO Production.ScrapReason VALUES('Handlling Damage', '2022-09-09 16:49:29.290')
UPDATE Production.ScrapReason SET ModifiedDate = '2023-09-09 17:54:23.983' WHERE ScrapReasonID = 21

SELECT * FROM  Production.ScrapReason
-----------------------------------------------------------------------------------

--INSTEAD OF in TRIGGER--
CREATE TRIGGER trgUseInsteadOf
ON dbo.Person1
INSTEAD OF DELETE
AS
BEGIN
	PRINT ('Delete is not Possible on this table')
END

DELETE FROM dbo.Person1 WHERE Skill = 'C++'
SELECT * FROM  Person1
--------------------------------------------------



--RECURSIVE TRIGGER--

CREATE TRIGGER trgUpdateShift
ON Production.ScrapReason
FOR UPDATE
AS
BEGIN
	UPDATE HumanResources.Shift SET ModifiedDate = GETDATE() WHERE ShiftID = 6
END

CREATE TRIGGER trgUpdateScrap
ON HumanResources.Shift
FOR UPDATE
AS
BEGIN
	UPDATE Production.ScrapReason SET ModifiedDate = GETDATE() WHERE ScrapReasonID = 21
END


UPDATE Production.ScrapReason SET ModifiedDate = GETDATE() WHERE ScrapReasonID = 21

SELECT * FROM Production.ScrapReason
SELECT * FROM HumanResources.Shift