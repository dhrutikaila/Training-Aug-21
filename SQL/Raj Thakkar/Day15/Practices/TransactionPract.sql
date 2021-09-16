--Create transaction
BEGIN TRAN TR_Update
UPDATE Employee1 
SET First_name = 'Juan'
WHERE Employee_id=1
--undo change
ROLLBACK TRAN TR_Update
--Changes made permanent
COMMIT TRANSACTION TR_Update


--Transaction in try catch block
ALTER PROC spTransactionForUpdate
AS
BEGIN
     BEGIN TRY
           BEGIN TRAN TR_UpdateName
                UPDATE Employee1 
                SET First_name = 'Puerra'
                WHERE Employee_id=1

		        UPDATE Employee1 
                SET Salary = 'Juan'
                WHERE Employee_id=1


		   COMMIT TRANSACTION TR_UpdateName
		   PRINT 'Transaction successful'
     END TRY
	 BEGIN CATCH
	       ROLLBACK TRAN  TR_UpdateName
		   PRINT 'Transaction Rolled back'
	 END CATCH

END

EXEC spTransactionForUpdate



-----DirtyRead Cases-----
--Transaction 1
BEGIN TRAN TR_UpdateWait
UPDATE Employee1 
SET First_name = 'Juan'
WHERE Employee_id=1
WAITFOR DELAY '00:00:15'
ROLLBACK TRAN TR_UpdateWait
--Transaction 2 Case 1
SELECT * FROM Employee1 --Waits for first transaction to be commited

--Transaction 2 Case 2
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT * FROM Employee1 --DirtyRead: Reads Uncoomitted data
--Transaction 2 Case 3
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT * FROM Employee1 (NOLOCK)--DirtyRead: Reads Uncoomitted data


----LOST UPDATE----
--Transaction 1
BEGIN TRAN TR_UpdateWait
                SELECT Salary FROM Employee1
				WHERE Employee_id=1
				WAITFOR DELAY '00:00:12'

                UPDATE Employee1 
                SET Salary += 5000
                WHERE Employee_id=1
COMMIT TRAN	TR_UpdateWait			
--Transaction 2
BEGIN TRAN TR_UpdateWait
                SELECT Salary FROM Employee1
				WHERE Employee_id=1
				WAITFOR DELAY '00:00:02'

                UPDATE Employee1 
                SET Salary += 10000
                WHERE Employee_id=1
COMMIT TRAN TR_UpdateWait


--Non Repeatable Read
--Transaction 1
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN TR_Read
                SELECT Salary FROM Employee1
				WHERE Employee_id=1

				WAITFOR DELAY '00:00:15'

                SELECT Salary FROM Employee1
				WHERE Employee_id=1
COMMIT TRAN TR_Read

--Transaction 2
UPDATE Employee1 
SET Salary += 10000
WHERE Employee_id=1

-----PHANTOM READ---
--Transaction 1
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN TR_Phantom
          SELECT COUNT(*) FROM Employee1
		  WHERE Employee_id BETWEEN 0 AND 10

		  WAITFOR DELAY '00:00:15'

		  SELECT COUNT(*) FROM Employee1
COMMIT TRAN TR_Phantom

--Transaction 2
INSERT INTO Employee1 VALUES(8,'Sage','Juega',50000,GETDATE(),'Banking',2)
		  

-----DEADLOCK----
BEGIN TRAN
UPDATE Employee1
SET Salary = 20000
WHERE Employee_id = 1

WAITFOR DELAY '00:00:10'

UPDATE Employees
SET Salary = 20000
WHERE EmployeeId = 1

COMMIT TRAN

SELECT * FROM Employee1 
SELECT * FROM Employees


------SNAPSHOT----
--Transaction 1
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
BEGIN TRAN TR_Snapshot
           UPDATE Employee1 
                SET Salary += 10000
                WHERE Employee_id=1
COMMIT TRAN TR_Snapshot
--Transaction 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
BEGIN TRAN TR_Snapshot
          SELECT Salary FROM Employee1 
		  WHERE Employee_id=1
COMMIT TRAN TR_Snapshot

--Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN TR_Snapshot
           UPDATE Employee1 
                SET Salary += 10000
                WHERE Employee_id=1
COMMIT TRAN TR_Snapshot
--Transaction 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
BEGIN TRAN TR_Snapshot
          UPDATE Employee1 
                SET Salary = 10000
                WHERE Employee_id=1
COMMIT TRAN TR_Snapshot

--Implicit Transaction
SET IMPLICIT_TRANSACTIONS ON
INSERT INTO Employee1 VALUES(8,'Sage','Juega',50000,GETDATE(),'Banking',2)
COMMIT TRAN 
SET IMPLICIT_TRANSACTIONS OFF


