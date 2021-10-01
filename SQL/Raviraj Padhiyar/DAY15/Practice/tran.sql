/****Transactions*******/


/*A transaction is a single unit of work. If a transaction is successful, all of the data modifications made during the transaction are committed and become a permanent part of the database

If a transaction encounters errors and must be canceled or rolled back, then all of the data modifications are erased.


types of transactions

Autocommit transactions
Each individual statement is a transaction.

Explicit transactions
Each transaction is explicitly started with the BEGIN TRANSACTION statement and explicitly ended with a COMMIT or ROLLBACK statement.


Implicit transactions
A new transaction is implicitly started when the prior transaction completes, but each transaction is explicitly completed with a COMMIT or ROLLBACK statement.

*/




/*Implicit Transactions*/

SET IMPLICIT_TRANSACTIONS ON

INSERT INTO myTable VALUES('Rohit','Sharma',9925099250)
UPDATE mytable
SET PhoneNumber = 9976799676
WHERE name = 'sagar'

ROLLBACK TRAN
GO


INSERT INTO myTable VALUES('Rohit','Sharma',9925099250)
UPDATE mytable
SET PhoneNumber = 9976799676
WHERE name = 'sagar'

COMMIT TRAN
GO

SELECT * FROM mytable




------------------------------EXPLICIT TRANS ----------------------------------

BEGIN TRANSACTION;

UPDATE mytable
SET surname = 'RATHORE'
WHERE name= 'sagar'

ROLLBACK TRAN;


BEGIN TRANSACTION;

UPDATE mytable
SET surname = 'RATHORE'
WHERE name= 'sagar'

COMMIT TRAN;


--------------------------------------------

/*------naming a transaction--------------*/

BEGIN TRANSACTION myTransaction

DELETE FROM mytable
WHERE name = 'Rohit'

COMMIT TRANSACTION myTransaction

SELECT * FROM mytable



---------transaction with mark



BEGIN TRANSACTION insertingMyTable
	WITH MARK N'inserting name rahul singh'
Go

INSERT INTO mytable
VALUES('Rahul','Singh',9098090980)

COMMIT TRANSACTION insertingMyTable

SELECT * FROM mytable

--TRANSACTION with TRY CATCH

DECLARE @Amount MONEY = 5000,@Debit_From INT 124001,@Credit_To INT = 125001
BEGIN TRANSACTION Amount_Transfer
BEGIN TRY
	UPDATE ACCOUNTS
	SET Balance = Balance - @Amount
	WHERE Account_Number = @Debit_From

	UPDATE ACCOUNTS
	SET Balance = Balance + @Amount
	WHERE Account_Number = @Credit_To

	COMMIT TRANSACTION Amount_Transfer
	PRINT 'TRANSACTION SUCCESSFUL'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION Amount_Transfer
	PRINT 'TRANSACTION FAILED'
END CATCH








