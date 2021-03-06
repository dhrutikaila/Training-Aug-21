--!**! TRANSACTION !**!

BEGIN TRANSACTION MyTran
UPDATE fixedDipositAcount
SET Balance = Balance - 25000
WHERE AcountName = 'John'

UPDATE SavingAcount 
SET Balance = Balance + 25000
WHERE AcountName = 'John'
COMMIT TRAN MyTran

--**************
USE AdventureWorks2012
BEGIN TRANSACTION TR1
BEGIN TRY
UPDATE HumanResources.Employee 
SET JobTitle = 'ABC'
WHERE JobTitle = 'Engineering manager'			--SELECT * FROM Person.ContactType

UPDATE Person.ContactType
SET Name = 'Sales AgentABC'
WHERE Name = 'Owner'

COMMIT TRANSACTION TR1
--SAVE TRANSACTION TR1
PRINT 'TRANSACTION EXECUTED'
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION TR1
PRINT 'TRANSACTION ROLLBACKED'
END CATCH

--!**!Implementing Isolation level!**!


--READ COMMITED

USE SQLtask

SET TRANSACTION ISOLATION LEVEL 
READ COMMITTED	
BEGIN TRANSACTION TR
BEGIN TRY
	UPDATE Employees SET Email='AVAILABLE' WHERE EmployeeID = 111
	PRINT 'TRANSACTION COMMITTED'
	WAITFOR TIME '09:12'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'TRANSACTION ROLLBACK'
END CATCH

SELECT * FROM Employees

--READ UNCOMMITTED

SET TRANSACTION ISOLATION LEVEL 
READ UNCOMMITTED	
BEGIN TRANSACTION TR
BEGIN TRY
	UPDATE Employees SET EmployeeID = 109 WHERE EmployeeID = 111
	PRINT 'TRANSACTION COMMITTED'
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'TRANSACTION ROLLBACK'
END CATCH

SELECT * FROM Employees

--REPEATABLE READ

SET TRANSACTION ISOLATION LEVEL
REPEATABLE READ
BEGIN TRANSACTION
BEGIN TRY
	UPDATE EMP1 SET EmployeeID = 101 WHERE FirstName = 'Neena'          --SELECT * FROM Employees
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	 ROLLBACK TRANSACTION
	PRINT 'TRANSACTION ROLLBACK'
END CATCH


--SERIALIZABLE

SELECT * FROM Employees
SET TRANSACTION ISOLATION LEVEL
SERIALIZABLE 
BEGIN TRANSACTION 
BEGIN TRY
	SELECT * FROM Employees
	update Employees set Email = 'None' where EmployeeID = 111
	COMMIT TRANSACTION 
	PRINT 'TRANSACTION COMMITTED'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'TRANSACTION ROLLBACK'
END CATCH











