--Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.

CREATE PROC spTransactionForBank
@Amount MONEY, @Debit INT, @Credit INT
AS
BEGIN
     BEGIN TRY
           BEGIN TRAN Online_Transfer
                UPDATE DepositTab 
                SET Amount -= @Amount
                WHERE ACTNO = @Debit

				WAITFOR DELAY '00:00:10'

		        UPDATE DepositTab 
                SET Amount += @Amount
                WHERE ACTNO = @Credit


		   COMMIT TRANSACTION Online_Transfer
		   PRINT 'Transaction successful'
     END TRY
	 BEGIN CATCH
	       ROLLBACK TRAN  Online_Transfer
		   PRINT 'Transaction Rolled back'
	 END CATCH

END

EXEC spTransactionForBank 1000,56,57
 SELECT * FROM DepositTab