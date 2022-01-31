--1. Sample explicit transaction
BEGIN TRANSACTION;  
DELETE FROM SalesLT.Product
    WHERE ProductID = 700;  
COMMIT;  

--2. Rollback
CREATE TABLE SampleTable (id INT);  
BEGIN TRANSACTION;  
       INSERT INTO SampleTable VALUES(1),(2);  
       INSERT INTO SampleTable VALUES(3);  
ROLLBACK;

--3. Marking a transaction
BEGIN TRANSACTION CustomerDelete  
    WITH MARK N'Deleting Customer Profile';  
GO  
USE AdventureWorksLT2014;  
GO  
DELETE FROM AdventureWorksLT2014.SalesLT.Customer  
    WHERE CustomerID = 3;  
GO  
COMMIT TRANSACTION CustomerDelete;  
GO 

--4. Isolation
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;  
GO  
BEGIN TRANSACTION;  
GO  
SELECT *   
    FROM UserData;  
GO  
SELECT *   
    FROM Post
GO  
COMMIT TRANSACTION;  
GO  


--5. Implicit Transaction
SET IMPLICIT_TRANSACTIONS ON 
UPDATE 
    DetroitBank 
SET 
    Lastname = 'Sawyer', 
    Firstname = 'Tom' 
WHERE 
    PersonID = 2 
SELECT 
    IIF(@@OPTIONS & 2 = 2, 
    'Implicit Transaction Mode ON', 
    'Implicit Transaction Mode OFF'
    ) AS 'Transaction Mode' 
SELECT 
    @@TRANCOUNT AS OpenTransactions 
COMMIT TRANSACTION

--6. Non Cluster Index
USE CharityDatabase
CREATE NONCLUSTERED INDEX NonClusteredIXUID
ON Post (UserId)
CREATE NONCLUSTERED INDEX ClustereUIDIX
ON ClusterLocations (UserId)