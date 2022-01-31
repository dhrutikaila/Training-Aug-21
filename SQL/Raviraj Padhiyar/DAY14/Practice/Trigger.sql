/*--------------TRIGGER-------------------------------------*/

/* a special kind of stored procedure, which “reacts” to certain actions we make in the database.

The main idea behind triggers is that they always perform an action in case some event happens. 

for example

talking about DML Trigger

 reason to use DML SQL triggers is the case when you want to assure that a certain control shall be performed before or after the defined statement on the defined table


 In SQL Server, we have 3 groups of triggers:

-->DML (data manipulation language) triggers – they react to DML commands. These are – INSERT, UPDATE, and DELETE
-->DDL (data definition language) triggers –   they react to DDL commands like – CREATE, ALTER, and DROP
-->Logon triggers – The name says it all. This type reacts to LOGON events

*/



/*  DML  TRIIGER

Syntax:

CREATE TRIGGER [schema_name.]trigger_name
ON table_name
{FOR | AFTER | INSTEAD OF} {[INSERT] [,] [UPDATE] [,] [DELETE]}
AS
{sql_statements}

*/


--CREATE A DML TRIGGER

--ex:
--insret Trigger

USE SampleTable

SELECT * FROM Countries


-------------FOR-------------------------------

CREATE TRIGGER dbo.t_country_insert
ON dbo.Countries
FOR INSERT
AS
BEGIN
	SELECT * FROM inserted
	SELECT * FROM deleted
END

INSERT INTO Countries VALUES('ID','Indonesia',3)


DELETE FROM Countries
WHERE CountryID='ID'




------------------------------AFTER-----------------------------------

CREATE OR ALTER TRIGGER dbo.t_country_insert
ON dbo.Countries
AFTER INSERT
AS
BEGIN
	SELECT * FROM inserted
END

INSERT INTO Countries VALUES('ID','Indonesia',3)



---------------------------------INSTEAD OF---------------------------------------

CREATE OR ALTER TRIGGER dbo.t_country_insert
ON dbo.Countries
INSTEAD OF INSERT
AS
BEGIN
	SELECT * FROM inserted
END

INSERT INTO Countries VALUES('ID','Indonesia',3)

--values has been not been inserted while using Instead of mode of trigger


-------------------------------------------------------------------------------------



--multi row insertion


CREATE TRIGGER NewPODetailEx
ON Purchasing.PurchaseOrderDetail
FOR INSERT AS
IF @@ROWCOUNT = 1
BEGIN
	UPDATE Purchasing.PurchaseOrderHeader
	SET SubTotal = SubTotal + LineTotal
	FROM inserted
	WHERE PurchaseOrderHeader.PurchaseOrderID = inserted.PurchaseOrderID
END
ELSE
BEGIN
	UPDATE Purchasing.PurchaseOrderHeader
	SET SubTotal = SubTotal +  (
		SELECT SUM(LineTotal)
		FROM inserted
		WHERE PurchaseOrderHeader.PurchaseOrderID = inserted.PurchaseOrderID
	)
	WHERE PurchaseOrderHeader.PurchaseOrderID IN (
		SELECT PurchaseOrderID FROM inserted
	)
END;

SELECT * FROM Purchasing.PurchaseOrderDetail
WHERE PurchaseOrderDetailID > 8845
SELECT * FROM Purchasing.PurchaseOrderHeader


INSERT INTO Purchasing.PurchaseOrderDetail (PurchaseOrderID,DueDate,OrderQty,ProductID,UnitPrice,ReceivedQty,	RejectedQty,ModifiedDate)
VALUES
(4012,'2014-07-24 00:00:00.000',6000,884,41.57,6000.00,0.00,'2015-08-12 12:25:46.483'),
(4012,'2014-07-24 00:00:00.000',6000,884,41.57,10000.00,0.00,'2015-08-12 12:25:46.483'),
(4011,'2014-07-24 00:00:00.000',6000,884,41.57,6000.00,0.00,'2015-08-12 12:25:46.483')

DELETE FROM Purchasing.PurchaseOrderDetail
WHERE PurchaseOrderDetailID > 8845

------------------------------------------------------------------------------------------------------------





USE testDB
/*DELETE TRIGGER*/

SELECT * FROM Countries

CREATE OR ALTER TRIGGER dbo.t_country_delete
ON dbo.Countries
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @countryName VARCHAR(40);
	SELECT @countryName=CountryName FROM deleted;
	PRINT ' you sure want delete ' + @countryName;
END


DELETE FROM Countries
WHERE CountryID='DE'
-------------------------------------------------------



--nested trigger

CREATE TABLE myCountry (
CID VARCHAR(5) PRIMARY KEY,
CrNAME VARCHAR(30),
RID INT
)


CREATE OR ALTER TRIGGER t_insert_country1
ON dbo.Countries
AFTER INSERT AS
BEGIN
	INSERT INTO myCountry
	SELECT CountryId,CountryName,RegionID FROM inserted
END

CREATE TRIGGER t_insert_myCountry
ON dbo.myCountry
AFTER INSERT AS
BEGIN
	PRINT 'u triggered a nested trigger';
END

INSERT INTO countries VALUES ('IN',3,'India')



/*DDL Trigger*/


CREATE TRIGGER safety   
ON DATABASE   
FOR DROP_SYNONYM  
AS   
IF (@@ROWCOUNT = 0)
RETURN;
   RAISERROR ('You must disable Trigger "safety" to remove synonyms!', 10, 1)  
   ROLLBACK  
GO



DROP TRIGGER safety  
ON DATABASE;  

