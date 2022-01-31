--1. Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.

CREATE TABLE DetroitBank (
		CutsomerName VARCHAR(50) NOT NULL,
		AccountNo VARCHAR(20) PRIMARY KEY,
		AccountType VARCHAR (10) NOT NULL,
		Amount INT NOT NULL
		)
INSERT INTO DetroitBank VALUES ('Chris Evans','KP01012568','Savings',100000),
							   ('RDJ','KP01012648','Current',486000),
							   ('Chris Hemsworth','KP01012486','Demate',64800)

--Query:
BEGIN TRANSACTION Transfers
DECLARE @Transaction INT
SET @Transaction=15000
BEGIN TRY
		UPDATE DetroitBank SET Amount = Amount - @Transaction WHERE AccountNo = 'KP01012568' AND Amount > @Transaction;
		PRINT 'Debit Successfull'
		UPDATE DetroitBank SET Amount = Amount + @Transaction WHERE AccountNo = 'KP01012648';
		PRINT 'Credit Successfull'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION Trasnfers
	PRINT 'Transaction Failed'
END CATCH
						
COMMIT TRANSACTION Transfers
SELECT * FROM DetroitBank

UPDATE DetroitBank
SET Amount=486000 WHERE AccountNo='KP01012648'