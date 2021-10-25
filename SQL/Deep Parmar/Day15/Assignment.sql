--Assignment
--Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.

CREATE DATABASE Day15_SQL


CREATE TABLE Bank_Detail 
(
	CustomerName VARCHAR(25) NOT NULL,
	AccountNo DECIMAL(12,0) NOT NULL,
	Amount INT NOT NULL,
	AccountType VARCHAR(10) NOT NULL,
	CONSTRAINT chk_ACC_No CHECK(LEN(AccountNo) = 12), 
	CONSTRAINT chk_accountNo UNIQUE(AccountNo),
	CONSTRAINT chk_accountType CHECK(AccountType IN ('Savings','Current'))
)

INSERT INTO Bank_Detail VALUES
	('Deep Parmar',995739573857,30000,'Savings'),
	('Jay Patel',892749836482,25000,'Current'),
	('Jeet Patel',983768237689,35000,'Current'),
	('Karan Singh',977749836482,20000,'Savings'),
	('Heet Parikh',252459836482,25000,'Savings')



CREATE PROCEDURE Money_Transaction
 @DebitAccountNo DECIMAL(12,0), @CreditAccountNo DECIMAL(12,0),@Amount INT
AS
BEGIN
	BEGIN TRANSACTION Transfer_Amount
	BEGIN TRY
		UPDATE Bank_Detail SET Amount -= @Amount WHERE AccountNo = @DebitAccountNo

		WAITFOR DELAY '00:00:15'

		UPDATE Bank_Detail SET Amount += @Amount WHERE AccountNo = @CreditAccountNo
		COMMIT TRANSACTION Transfer_Amount
		PRINT 'Transaction Successfull'
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION Transfer_Amount
		PRINT 'Transaction Failed'
	END CATCH
END
		
EXEC Money_Transaction 977749836482,995739573857,15000

 SELECT * FROM Bank_Detail