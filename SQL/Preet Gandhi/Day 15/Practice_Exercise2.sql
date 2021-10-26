
--Lost Updates Continue....--
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION TryLostUpdates2

DECLARE @Year INT

SELECT @Year = ExpYear FROM Sales.CreditCard WHERE CreditCardID = 19245
WAITFOR DELAY '00:00:01'
SET @Year = @Year + 2

UPDATE Sales.CreditCard SET ExpYear = @Year WHERE CreditCardID = 19245
PRINT @Year
COMMIT TRANSACTION TryLostUpdates2

SELECT * FROM Sales.CreditCard
---------------------------------------------------------------



--Dirty Read--
--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT * FROM Sales.CreditCard WHERE CreditCardID = 19245

SELECT * FROM Sales.CreditCard (NOLOCK) WHERE CreditCardID = 19245


--Nonrepeatable read--

UPDATE Sales.CreditCard SET ExpYear = 2025 WHERE CreditCardID = 19245


----Phantom Read--
INSERT INTO Sales.CreditCard VALUES ('Visa', 3456789012345678,7,2028,GETDATE())

DBCC useroptions 