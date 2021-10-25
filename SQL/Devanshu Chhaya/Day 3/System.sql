--- System Functions

---- 1. Binary Checksum

USE AdventureWorks2012;  
GO  
CREATE TABLE myTable (column1 INT, column2 VARCHAR(256));  
GO  
INSERT INTO myTable VALUES (1, 'test');  
GO  
SELECT BINARY_CHECKSUM(*) from myTable;  
GO  
UPDATE myTable set column2 = 'TEST';  
GO  
SELECT BINARY_CHECKSUM(*) from myTable;  
GO


---- 2.Checksum

-- Create a checksum index.  

SET ARITHABORT ON;  
USE AdventureWorks2012;   
GO  
ALTER TABLE Production.Product  
ADD cs_Pname AS CHECKSUM(Name);  
GO  
CREATE INDEX Pname_index ON Production.Product (cs_Pname);  
GO

/*Use the index in a SELECT query. Add a second search   
condition to catch stray cases where checksums match,   
but the values are not the same.*/  

SELECT *   
FROM Production.Product  
WHERE CHECKSUM(N'Bearing Ball') = cs_Pname  
AND Name = N'Bearing Ball';  
GO

--- 3. Compress

CREATE TABLE Player(
	Name VARCHAR(30),
	Surname VARCHAR(30),
	Info VARCHAR(200)
)

INSERT INTO player (name, surname, info )  
VALUES (N'Ovidiu', N'Cracium',   
        COMPRESS(N'{"sport":"Tennis","age": 28,"rank":1,"points":15258, turn":17}'));  

SELECT * FROM Player
  

--- 4. ConnectionProperty

SELECT   
ConnectionProperty('net_transport') AS 'Net transport',   
ConnectionProperty('protocol_type') AS 'Protocol type';

--- 5. CONTEXT_INFO

SET CONTEXT_INFO 0x1256698456;  
GO  
SELECT CONTEXT_INFO();  
GO

--- 6. CURRENT_TRANSACTION_ID
SELECT CURRENT_TRANSACTION_ID();

--- 7. DECOMPRESS

SELECT name, surname,  
CAST(DECOMPRESS(info) AS nvarchar(MAX)) AS info  
FROM player;

--- 8.ERROR_LINE

BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_LINE() AS ErrorLine;  
END CATCH;  

--- 9.ERROR_MESSAGE

BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
GO 
GO

---- 10.ERROR_NUMBER

BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_NUMBER() AS ErrorNumber;  
END CATCH;  
GO

---- 11. ERROR_SECURITY

BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_SEVERITY() AS ErrorSeverity;  
END CATCH;  
GO

---- 12. ERROR_STATE

BEGIN TRY  
    -- Generate a divide by zero error  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_STATE() AS ErrorState;  
END CATCH;  
GO

---- 13. FORMATMESSAGE

SELECT text FROM sys.messages WHERE message_id = 20009 AND language_id = 1033;  
DECLARE @var1 VARCHAR(200);   
SELECT @var1 = FORMATMESSAGE(20009, 'First Variable', 'Second Variable');   
SELECT @var1;


---- 14. GETANSINULL

USE AdventureWorks2012;  
GO  
SELECT GETANSINULL('AdventureWorks2012')  
GO

---- 15. ISNULL

USE AdventureWorks2012;  
GO  
SELECT AVG(ISNULL(Weight, 50))  
FROM Production.Product;  
GO

---- 16. ISNUMERIC

USE AdventureWorks2012;  
GO  
SELECT City, PostalCode  
FROM Person.Address   
WHERE ISNUMERIC(PostalCode) <> 1;  
GO


---- 17. MIN_ACTIVE_ROWVERSION

CREATE TABLE RowVersionTestTable (rv ROWVERSION)  
GO  
  
PRINT ''  
PRINT 'DBTS'  
PRINT @@DBTS  
PRINT 'MIN_ACTIVE_ROWVERSION'  
PRINT MIN_ACTIVE_ROWVERSION()   
GO

----18. NEWID

DECLARE @myid uniqueidentifier  
SET @myid = NEWID()  
PRINT 'Value of @myid is: '+ CONVERT(varchar(255), @myid)


---- 19. SESSION_CONTEXT

EXEC sp_set_session_context 'user_id', 4;  
SELECT SESSION_CONTEXT(N'user_id');


---- 20 @@ERROR

USE AdventureWorks2012;  
GO  
UPDATE HumanResources.EmployeePayHistory  
    SET PayFrequency = 4  
    WHERE BusinessEntityID = 1;  
IF @@ERROR = 547
    BEGIN
    PRINT N'A check constraint violation occurred.';
    END
GO


---- 21. @@IDENTITY

USE AdventureWorks2012;  
GO  
--Display the value of LocationID in the last row in the table.  
SELECT MAX(LocationID) FROM Production.Location;  
GO  
INSERT INTO Production.Location (Name, CostRate, Availability, ModifiedDate)  
VALUES ('Damaged Goods', 5, 2.5, GETDATE());  
GO  
SELECT @@IDENTITY AS 'Identity';  
GO  
--Display the value of LocationID of the newly inserted row.  
SELECT MAX(LocationID) FROM Production.Location;  
GO

---- 22. @@PACK_RECEIVED

SELECT @@PACK_RECEIVED AS 'Packets Received';


---- 23. @@ROWCOUNT

USE AdventureWorks2012;  
GO  
UPDATE HumanResources.Employee   
SET JobTitle = N'Executive'  
WHERE NationalIDNumber = 123456789  
IF @@ROWCOUNT = 0  
PRINT 'Warning: No rows were updated';  
GO

---- 24. @@TRANCOUNT

PRINT @@TRANCOUNT  
--  The BEGIN TRAN statement will increment the  
--  transaction count by 1.  
BEGIN TRAN  
    PRINT @@TRANCOUNT  
    BEGIN TRAN  
        PRINT @@TRANCOUNT  
--  The COMMIT statement will decrement the transaction count by 1.  
    COMMIT  
    PRINT @@TRANCOUNT  
COMMIT  
PRINT @@TRANCOUNT  
