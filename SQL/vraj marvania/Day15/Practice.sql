--  Naming a transaction

DECLARE @TranName VARCHAR(20)  
SELECT @TranName = 'MyTransaction'  
  
BEGIN TRANSACTION MyTransaction  
USE AdventureWorks2012  
DELETE FROM AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13  
  
COMMIT TRANSACTION @TranName  
GO  


-- Rolling back a transaction

CREATE TABLE ValueTable (id INT)  
BEGIN TRANSACTION  
       INSERT INTO ValueTable VALUES(1)  
       INSERT INTO ValueTable VALUES(2)  
ROLLBACK  


--DISTRIBUTED TRANSACTION  
USE AdventureWorks2012  
GO  
BEGIN DISTRIBUTED TRANSACTION  
-- Delete candidate from local instance.  
DELETE AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 14  
-- Delete candidate from remote instance.  
DELETE AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 14  
COMMIT TRANSACTION  
GO  


--Save Points in Transactions

BEGIN TRANSACTION 
	INSERT INTO Person 
	VALUES('Mouse', 'Micky','500 South Buena Vista Street, Burbank','California',43)
	SAVE TRANSACTION InsertStatement
	DELETE Person WHERE PersonID=3
	SELECT * FROM Person 
	ROLLBACK TRANSACTION InsertStatement
COMMIT

SELECT * FROM Person


--Using an explicit transaction

BEGIN TRANSACTION  
DELETE FROM HumanResources.JobCandidate  
    WHERE JobCandidateID = 13  
COMMIT 

--Create Product table
CREATE TABLE Product
(
 ProductID INT PRIMARY KEY, 
 Name VARCHAR(40), 
 Price INT,
 Quantity INT
 )
 GO

 -- Populate Product Table with test data
 INSERT INTO Product VALUES(101, 'Product-1', 100, 10)
 INSERT INTO Product VALUES(102, 'Product-2', 200, 15)
 INSERT INTO Product VALUES(103, 'Product-3', 300, 20)
 INSERT INTO Product VALUES(104, 'Product-4', 400, 25)

-- Example of COMMIT transaction in SQL Server with DML statements

--COMMIT TRANSACTION
BEGIN TRANSACTION
 INSERT INTO Product VALUES(105,'Product-5',500, 30)
 UPDATE Product SET Price =350 WHERE ProductID = 103
 DELETE FROM Product WHERE ProductID = 103
COMMIT TRANSACTION

--ROLLBACK TRANSACTION
BEGIN TRANSACTION
INSERT INTO Product VALUES(110,'Product-10',600, 30)
INSERT INTO Product VALUES(110,'Product-10',600, 30)
IF(@@ERROR > 0)
BEGIN
    Rollback Transaction
END
ELSE
BEGIN
   Commit Transaction
END