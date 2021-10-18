--Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.

USE Demo_5

CREATE TABLE BANK 
(
	CustomerName VARCHAR(25) NOT NULL,
	AccountNo DECIMAL(12,0) CHECK(LEN(AccountNo) = 12) NOT NULL,
	Amount INT NOT NULL,
	AccountType VARCHAR(10) NOT NULL,
	CONSTRAINT chk_AccountNo UNIQUE(AccountNo),
	CONSTRAINT chk_AccountType CHECK(AccountType IN ('Savings','Current'))
)

INSERT INTO BANK VALUES
	('Hitesh Panchal',385739573857,450000,'Current'),
	('Hardik Shah',582749836482,550000,'Savings'),
	('Jeet Panchal',783768237689,250000,'Current'),
	('Hiren Singh',877749836482,300000,'Savings'),
	('Pratik Parikh',452459836482,450000,'Current')



CREATE PROCEDURE spGetTransaction
 @DebitAccountNo DECIMAL(12,0), @CreditAccountNo DECIMAL(12,0),@Amount INT
AS
BEGIN
	BEGIN TRANSACTION Money_Transfer
	BEGIN TRY
		UPDATE BANK SET Amount -= @Amount 
					WHERE AccountNo = @DebitAccountNo

		WAITFOR DELAY '00:00:12'

		UPDATE BANK SET Amount += @Amount 
					WHERE AccountNo = @CreditAccountNo

		COMMIT TRANSACTION Money_Transfer
		PRINT 'Transaction Successfull'
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION Money_Transfer
		PRINT 'Transaction Failed'
	END CATCH
END
		
EXEC spGetTransaction  @DebitAccountNo = 783768237689, @CreditAccountNo = 877749836482, @Amount = 30000

