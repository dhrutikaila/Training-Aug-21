USE AdventureWorks2019  

-- Distributed Transaction is used to satisfy ACID property over a Distributed Database.
Begin Try 
BEGIN DISTRIBUTED Transaction 
-- Delete candidate from local instance.  
DELETE AdventureWorks2019.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13  
-- Delete candidate from remote instance.  
DELETE RemoteServer.AdventureWorks2019.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13  
COMMIT Transaction
End try
Begin Catch 
	Rollback Transaction
End Catch
GO 

-- BEGIN TRANSACTION  
Begin Transaction
Delete From HumanResources.JobCandidate  
    Where JobCandidateID = 13;  
Commit 

-- COMMIT TRANSACTION

Begin Try
Begin Transaction Trans1
	Update HumanResources.Employee Set HireDate = GETDATE() where Year(HireDate) = 2021 
Commit Transaction Trans1
End Try
Begin Catch
	Print 'Update Failed'
End Catch
Go

-- ROLLBACK TRANSACTION
Begin Try
Begin Transaction Trans1
	Update HumanResources.Employee Set HireDate = GETDATE() where Year(HireDate) = 2021 
Commit Transaction Trans1
End Try
Begin Catch
	Rollback Transaction Trans1
End Catch
Go