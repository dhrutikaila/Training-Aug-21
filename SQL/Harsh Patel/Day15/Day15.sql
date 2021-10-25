--Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.


create table account
(
	AccountNumber INT PRIMARY KEY,
	Balance MONEY
)
INSERT INTO account values(156478,200000),(141234,300000)

CREATE PROCEDURE Ttransaction @Amount MONEY, @debit INT,@credit INT
AS
BEGIN TRANSACTION MoneyTransfer
BEGIN TRY
UPDATE Account SET Balance=Balance - @Amount WHERE AccountNumber=@debit
UPDATE Account SET Balance=Balance + @Amount WHERE AccountNumber=@credit
COMMIT TRANSACTION MoneyTransfer
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION MoneyTransfer
PRINT 'theres an error'
END CATCH

EXEC Ttransaction @Amount=10000,@debit=156478,@credit=141234
SELECT * FROM Account