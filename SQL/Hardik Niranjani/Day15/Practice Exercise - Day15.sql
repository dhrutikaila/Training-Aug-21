
-- TRANSACTION ===================================================================================

USE AdventureWorks2019

-- Explicit Transaction


BEGIN TRANSACTION T1
DELETE FROM HumanResources.JobCandidate  
    WHERE JobCandidateID = 13

SELECT * FROM HumanResources.JobCandidate 




-- Rolling back a transaction

ROLLBACK TRANSACTION T1
SELECT * FROM HumanResources.JobCandidate 



-- Commit Transaction

BEGIN TRANSACTION T2
DELETE FROM HumanResources.JobCandidate
		WHERE JobCandidateID = 13
COMMIT TRANSACTION

ROLLBACK TRAN T2 --Not Possible
SELECT * FROM HumanResources.JobCandidate 


--Transation Example with exception handling


BEGIN TRANSACTION Tran_Person_ContactType
BEGIN TRY 
	UPDATE Person.ContactType
	SET [Name] = 'Sales RP'
	WHERE ContactTypeID =20

	UPDATE Person.ContactType
	SET ModifiedDate = 'Monday'
	WHERE ContactTypeID = 20
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION Tran_Person_ContactType
	SELECT 'You Update with wrong datatype' AS [Error Massage]
END CATCH

SELECT * FROM Person.ContactType









