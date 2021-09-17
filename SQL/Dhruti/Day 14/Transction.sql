USE dhruti

--IMPLICIT TRANSACTION
SET IMPLICIT_TRANSACTIONS ON;
INSERT INTO departments VALUES(4,'DHRUTI','1');
INSERT INTO departments VALUES(3,'DH','2');
COMMIT TRANSACTION;
SET IMPLICIT_TRANSACTIONS OFF;

--EXPLICIT TRANSACTION
USE AdventureWorks2012

BEGIN TRAN myTran
BEGIN TRY
  UPDATE Person.ContactType
  SET Name='owner'
  WHERE ContactTypeID=2
--Statement 1
  UPDATE HumanResources.Employee SET VacationHours=20
  WHERE BusinessEntityID=2
COMMIT TRANSACTION myTran
--Statement 2
SELECT 'Transaction executed'
END  TRY
BEGIN CATCH 
ROLLBACK TRANSACTION myTran
SELECT 'Transaction Rollbacked'
END CATCH
SELECT * from HumanResources.Employee
SELECT * FROM Person.ContactType

--TRANSACTION ISOLATION LEVEL
USE AdventureWorks2012;  
GO  
SET TRANSACTION ISOLATION LEVEL --REPEATABLE READ
--READ UNCOMMITTED
    -- READ COMMITTED
     --REPEATABLE READ
    --SNAPSHOT
    SERIALIZABLE;  
GO  
BEGIN TRANSACTION;  
GO  
SELECT *   
    FROM HumanResources.EmployeePayHistory;  
GO  
SELECT *   
    FROM HumanResources.Department;  
GO  
COMMIT TRANSACTION;  
GO

-- NAMEING TRAN
DECLARE @TranName VARCHAR(20);  
SELECT @TranName = 'MyTransaction';  
  
BEGIN TRANSACTION @TranName;  
USE AdventureWorks2012;  
DELETE FROM AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13;  
  
COMMIT TRANSACTION @TranName;  
GO  
SELECT * FROM HumanResources.JobCandidate


