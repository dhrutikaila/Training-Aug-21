USE AdventureWorks2012

-- Transaction With Mark

BEGIN TRANSACTION CandidateDelete  
    WITH MARK N'Deleting a Job Candidate';  
GO  

DELETE FROM AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13;  
	/*
WAITFOR DELAY '00:00:30' -- wait for 30 sec
WAITFOR TIME '00:30' -- wait for 30 minutes
	*/
GO  
COMMIT TRANSACTION CandidateDelete;  
GO


-- Implicit Transaction

SET IMPLICIT_TRANSACTIONS ON

INSERT INTO dbo.myTable VALUES(4,'test4'),(5,'test5')

COMMIT TRANSACTION
SET IMPLICIT_TRANSACTIONS OFF


----------------------------------------------------------------------------------------------------


-- Explicit Transaction

BEGIN TRANSACTION

UPDATE Person.Person
SET LastName = 'Patel'

SELECT * FROM Person.Person

-- COMMIT TRANSACTION
ROLLBACK TRANSACTION



----------------------------------------------------------------------------------------------------



-- Example of dirty read

BEGIN TRANSACTION
UPDATE Person.Person
SET LastName = 'Harrison'
WHERE BusinessEntityID = 1

ROLLBACK TRANSACTION

SELECT * FROM Person.Person ORDER BY BusinessEntityID ASC


SET TRANSACTION ISOLATION LEVEL
 READ UNCOMMITTED
SELECT LastName FROM Person.Person WHERE BusinessEntityID = 1



----------------------------------------------------------------------------------------------------



-- Repeatable Read

BEGIN TRANSACTION

UPDATE Person.Person
SET LastName = 'Harrison'
WHERE BusinessEntityID = 1

SELECT * FROM Person.Person

ROLLBACK TRANSACTION



----------------------------------------------------------------------------------------------------



-- Serializalbe

BEGIN TRANSACTION

UPDATE Person.Person
SET LastName = 'Harrison'
WHERE BusinessEntityID = 1

SELECT * FROM Person.Person

ROLLBACK TRANSACTION



----------------------------------------------------------------------------------------------------



-- Snapshot

BEGIN TRANSACTION

UPDATE Person.Person
SET LastName = 'Harrison'
WHERE BusinessEntityID = 1

SELECT * FROM Person.Person ORDER BY BusinessEntityID ASC

ROLLBACK TRANSACTION