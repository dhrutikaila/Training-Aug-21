USE [Day19 (Index and Transaction)]

-- Assignment

/*
Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another
account.


*/


--Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.

		 CREATE TABLE DetroitBank_Account_Details(
		 AccountNO int PRIMARY KEY IDENTITY(1,1),
		 FirstName varchar(20) NOT NULL,
		 AccountType varchar(10) NOT NULL,
		 Amount money NOT NULL DEFAULT 0,
		 Branch varchar(25) NOT NULL
		 );

		 CREATE TABLE DetroitBank_Transaction_Details(
		 credited_In_Acc int  NOT NULL CONSTRAINT FK_credit FOREIGN KEY REFERENCES DetroitBank_Account_Details(AccountNO),
		 debited_from_Acc int NOT NULL CONSTRAINT FK_debit FOREIGN KEY REFERENCES DetroitBank_Account_Details(AccountNO),
		 Amount money NOT NULL CONSTRAINT FK_amount_check CHECK (Amount > 0),
		 Transaction_date DATE DEFAULT GetDate()
		 );


		 
		 INSERT INTO DetroitBank_Account_Details VALUES('Jeel','Current',25000,'Ahmedabad'),
										('Jimmy','Saving',10000,'Ahmedabad'),
										('jinesh','Current',0,'Ahmedabad'),
										('kathan','Saving',70000,'Ahmedabad')
		
		SELECT * FROM DetroitBank_Account_Details


		GO
		ALTER PROCEDURE dbo.Transaction_proceudre
		@DebitAcc INT,@CreditAcc INT,@Amount MONEY
		AS 
		BEGIN 
			IF @Amount > 0 AND (SELECT Amount FROM DetroitBank_Account_Details WHERE AccountNO=@DebitAcc) > @Amount  
			BEGIN
			IF (@DebitAcc = @CreditAcc)
			BEGIN
			PRINT 'You can''t transfer in same account'
			END
			ELSE
			BEGIN
				BEGIN TRY
					BEGIN TRANSACTION 
					
						UPDATE DetroitBank_Account_Details SET Amount = Amount-@Amount
						WHERE AccountNO = @DebitAcc

						UPDATE DetroitBank_Account_Details SET Amount = Amount+@Amount
						WHERE AccountNO = @CreditAcc
					
						INSERT INTO DetroitBank_Transaction_Details Values(@CreditAcc,@DebitAcc,@Amount,GetDate())

					COMMIT TRANSACTION
					
					PRINT 'transfer Successfull'
				END TRY
				BEGIN CATCH 
					ROLLBACK TRANSACTION 
					PRINT 'Transaction Cancel'
				END CATCH 
			END
			END
			ELSE
			BEGIN
			PRINT 'Insufficient Amount in Account for transaction ( transfer Amount should not be equal to balance Amont )'
			END
		END 
		GO

		-- execution (EXEC TransTransaction_proceudre  <1.[Accountno debit From] , 2.[Accountno credit In] , 3.[Amount] >)
		EXECUTE [dbo].[Transaction_proceudre] 3,3,1000

		SELECT * FROM DetroitBank_Account_Details
		SELECT * FROM DetroitBank_Transaction_Details
