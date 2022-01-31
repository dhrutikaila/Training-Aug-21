CREATE DATABASE Day15_SQL


CREATE TABLE BANK 
(
	CustomerName VARCHAR(25) NOT NULL,
	AccountNo DECIMAL(12,0) NOT NULL CHECK(LEN(AccountNo) = 12) ,
	Amount INT NOT NULL,
	AccountType VARCHAR(10) NOT NULL,
	CONSTRAINT chk_accountNo UNIQUE(AccountNo),
	CONSTRAINT chk_accountType CHECK(AccountType IN ('Savings','Current'))
)

INSERT INTO BANK VALUES
	('Hitesh Panchal',385739573857,30000,'Savings'),
	('Jay Shah',582749836482,25000,'Current'),
	('Jeet Patel',783768237689,35000,'Current'),
	('Karan Singh',877749836482,20000,'Savings'),
	('Heet Parikh',452459836482,25000,'Savings')



CREATE PROCEDURE MoneyTransaction
 @DebitAccountNo DECIMAL(12,0), @CreditAccountNo DECIMAL(12,0),@Amount INT
AS
BEGIN
	BEGIN TRANSACTION MoneyTransfer
	BEGIN TRY
		UPDATE BANK SET Amount -= @Amount WHERE AccountNo = @DebitAccountNo

		WAITFOR DELAY '00:00:15'

		UPDATE BANK SET Amount += @Amount WHERE AccountNo = @CreditAccountNo
		COMMIT TRANSACTION MoneyTransfer
		PRINT 'Transaction Successfull'
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION MoneyTransfer
		PRINT 'Transaction Failed'
	END CATCH
END
		
EXEC MoneyTransaction @DebitAccountNo = 783768237689, @CreditAccountNo = 877749836482, @Amount = 5000

