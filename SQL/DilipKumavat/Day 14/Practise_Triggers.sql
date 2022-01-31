USE AdventureWorks2016
SELECT * FROM Production.ProductCategory

--- FOR INSERT TRIGGER :- Trigger when you insert something to table ---

CREATE TRIGGER trgInsertShift
ON Production.ProductCategory
FOR INSERT 
AS 
BEGIN
	SELECT * FROM inserted --- Displays data when we have tried to inserted ---
	SELECT * FROM deleted  --- Displays data when we have tried to updated or deleted ---
END

INSERT INTO Production.ProductCategory VALUES ('Groceries',NEWID(),GETDATE())
SELECT * FROM Production.ProductCategory


--- FOR UPDATE TRIGGER :- Trigger when you Update something to table ---
CREATE TRIGGER trgUpdateCategory
ON Production.ProductCategory
FOR UPDATE 
AS
BEGIN
	SELECT * FROM inserted --- Displays data when we have tried to inserted ---
	SELECT * FROM deleted  --- Displays data when we have tried to updated or deleted ---	
END

UPDATE Production.ProductCategory SET Name = 'Grocery' WHERE ProductCategoryID = 8
SELECT * FROM Production.ProductCategory


--- FOR DELETE TRIGGER :- Trigger when you Delete something to table ---
CREATE TRIGGER trgDeleteCategory
ON Production.ProductCategory
FOR DELETE
AS
BEGIN
	SELECT * FROM inserted --- Displays data when we have tried to inserted ---
	SELECT * FROM deleted  --- Displays data when we have tried to updated or deleted ---
END


--- Creating a new table from existing table with structure only ----
SELECT * INTO ExtraTable FROM Production.ProductCategory WHERE 1 = 0  

CREATE TRIGGER trgDeleteCategoryAddToTable
ON Production.ProductCategory
FOR DELETE
AS
BEGIN
--- Adding data to a new table from magic table ----
INSERT INTO dbo.ExtraTable 
SELECT Name,rowguid,ModifiedDate FROM deleted
END

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

--- AFTER Trigger :- Triggers after operation(SQL Statement) has been done to table ---
CREATE TRIGGER trgAfterInsert
ON Person.BusinessEntity
AFTER INSERT
AS
BEGIN
	PRINT('Data successfully added, this is confirmed by owner')
END

INSERT INTO Person.BusinessEntity VALUES (NEWID(),GETDATE())
SELECT *FROM Person.BusinessEntity

--- Insted Of Trigger :- Triggers when operation(SQL Statement) trying to be executed ---
CREATE TRIGGER trgInstedOf
ON Person.BusinessEntity
INSTEAD OF DELETE
AS
BEGIN
	PRINT('Please do not try to delete the data, you are not permitted for this')
END

DELETE FROM Person.BusinessEntity WHERE BusinessEntityID = 2000
SELECT * FROM Person.BusinessEntity WHERE BusinessEntityID = 2000

