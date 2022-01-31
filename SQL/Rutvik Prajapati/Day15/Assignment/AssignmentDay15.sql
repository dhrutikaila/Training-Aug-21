-- Assignment:

         --Detroit Bank need to implement the transaction whenever the amount is 
         --transferred from one account to the another account.
		 USE SampleDB
		 CREATE TABLE DetroitBank(
		 AccountNO INT PRIMARY KEY ,
		 FirstName VARCHAR(20),
		 TransactionType VARCHAR(10),
		 Amount MONEY,
		 TransactionTime DATETIME
		 );

		 INSERT INTO DetroitBank VALUES(123,'Jay','Credit',25000,GETDATE()),
										(124,'Kuldip','Credit',50000,GETDATE()),
										(125,'Ravi','Credit',60000,GETDATE()),
										(126,'Kishan','Credit',70000,GETDATE())
		SELECT * FROM DetroitBank

		CREATE PROCEDURE spTransferAmountOneAccountToAnother
		@DebitAccountNo INT,@TempAmount MONEY,@CreditAccountNo INT
		AS 
		BEGIN 
			IF @TempAmount > 0 
				BEGIN TRY
					BEGIN TRANSACTION 
						UPDATE DetroitBank SET Amount = Amount-@TempAmount,
												TransactionType = 'Debit',
												TransactionTime = GETDATE()
						WHERE AccountNO = @DebitAccountNo

						UPDATE DetroitBank SET Amount = Amount+@TempAmount,
											   TransactionType = 'Credit',
											   TransactionTime = GETDATE()
						WHERE AccountNO = @CreditAccountNo
					COMMIT TRANSACTION 
					PRINT 'Successfully transfer amount'
				END TRY
				BEGIN CATCH 
					ROLLBACK TRANSACTION 
					PRINT 'Transaction Roll back'
				END CATCH 
		END 

		EXECUTE spTransferAmountOneAccountToAnother 126,5000,123

		SELECT * FROM DetroitBank