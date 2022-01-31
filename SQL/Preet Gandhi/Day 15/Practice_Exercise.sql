USE AdventureWorks2016

--IMPLICIT TRANSACTION--

--ROLLBACK IMPLICIT TRANSACTION--
SET IMPLICIT_TRANSACTIONS ON
INSERT INTO Sales.CreditCard VALUES('Visa',1234567890123756,6,2025,GETDATE())
INSERT INTO Sales.CreditCard VALUES('MasterCard',2345676901234567,6,2024,GETDATE())
ROLLBACK TRANSACTION
SET IMPLICIT_TRANSACTIONS OFF

SELECT * FROM Sales.CreditCard


--COMMIT IMPLICIT TRANSACTION--
SET IMPLICIT_TRANSACTIONS ON
INSERT INTO Sales.CreditCard VALUES('Visa',1234567890123456,6,2025,GETDATE())
INSERT INTO Sales.CreditCard VALUES('MasterCard',2345678901234567,6,2024,GETDATE())
COMMIT TRANSACTION
SET IMPLICIT_TRANSACTIONS OFF

SELECT * FROM Sales.CreditCard
-----------------------------------------------------------------------------------

--EXPLICIT TRANSACTION with TRY CATCH--

--ROLLBACK IS USED--
BEGIN TRANSACTION DeleteFromCardDetails
BEGIN TRY 
	UPDATE Purchasing.PurchaseOrderDetail SET OrderQty += 2000, ReceivedQty += 'ABC',ModifiedDate = GETDATE()
	WHERE PurchaseOrderDetailID = 8845

	COMMIT TRANSACTION
	PRINT 'Transaction Successfull'
END TRY
BEGIN CATCH 
		ROLLBACK TRANSACTION
		PRINT 'Transaction Failed'
END CATCH

SELECT * FROM Purchasing.PurchaseOrderDetail


--COMMIT IS USED--
BEGIN TRANSACTION DeleteFromCardDetails
BEGIN TRY 
	UPDATE Purchasing.PurchaseOrderDetail SET OrderQty += 2000, ReceivedQty += 2000, ModifiedDate = GETDATE()
	WHERE PurchaseOrderDetailID = 8845
	COMMIT TRANSACTION
	PRINT 'Transaction Successfull'
END TRY
BEGIN CATCH 
		ROLLBACK TRANSACTION
		PRINT 'Transaction Failed'
END CATCH
SELECT * FROM Purchasing.PurchaseOrderDetail
-------------------------------------------------------------------------------------------


--Lost Updates (Transaction 2 can't update data while t1 is running)--
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION TryLostUpdates

DECLARE @Year INT

SELECT @Year = ExpYear FROM Sales.CreditCard WHERE CreditCardID = 19245
WAITFOR DELAY '00:00:30'
SET @Year = @Year + 1

UPDATE Sales.CreditCard SET ExpYear = @Year WHERE CreditCardID = 19245
PRINT @Year
COMMIT TRANSACTION TryLostUpdates


---------------------------------------------------------------------------------


--Dirty Read--

BEGIN TRANSACTION TryDirtyread
	UPDATE Sales.CreditCard SET ExpYear = 2023, ModifiedDate = GETDATE() WHERE CreditCardID = 19245

WAITFOR DELAY '00:00:30'
ROLLBACK TRANSACTION TryDirtyread

--------------------------------------------------------------------

--Nonrepeatable read  (Transaction 2 can't change the data due to REPEATABLE READ)--
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION TryNonRepeatableRead
SELECT  ExpYear FROM Sales.CreditCard WHERE CreditCardID = 19245

WAITFOR DELAY '00:00:15'

SELECT  ExpYear FROM Sales.CreditCard WHERE CreditCardID = 19245
COMMIT TRANSACTION TryNonRepeatableRead


---------------------------------------------------------------------


--Phantom Read (Can't add/delete new row while t1 is running)--
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION TryPhantomRead
SELECT * FROM Sales.CreditCard WHERE CreditCardID BETWEEN 19244 AND 19246

WAITFOR DELAY '00:00:15'

SELECT * FROM Sales.CreditCard WHERE CreditCardID BETWEEN 19244 AND 19246
COMMIT TRANSACTION TryPhantomRead

DBCC useroptions