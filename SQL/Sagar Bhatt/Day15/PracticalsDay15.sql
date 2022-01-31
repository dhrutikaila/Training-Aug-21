USE Day6_August17
GO
SELECT * FROM Deposit
SELECT * FROM Borrow
GO

--1-Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.
CREATE TRIGGER dbo.trgAmountTransfer
ON dbo.Deposit
FOR Update
AS
BEGIN
	SELECT *
	FROM inserted
	SELECT *
	FROM deleted
END
GO

DROP PROCEDURE uspAmountTransfer
GO
CREATE PROCEDURE uspAmountTransfer
	@LenderActNo VARCHAR(5)
	, @BorrowerActNo VARCHAR(5)
	, @Amount Decimal(9,2)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Deposit WHERE ActNo LIKE @LenderActNo)
		PRINT @LenderActNo + ' is not exists.'
	IF NOT EXISTS(SELECT * FROM Deposit WHERE ActNo = @BorrowerActNo)
		PRINT @BorrowerActNo + ' is not exists.'
	IF NOT EXISTS(SELECT * FROM Deposit WHERE Amount >= @Amount AND  ActNo = @LenderActNo)
		PRINT @LenderActNo + ' doesn''t have enough balanace.'
	ELSE
	BEGIN
		BEGIN TRANSACTION trAmountTransfer
		BEGIN TRY
			UPDATE dbo.Deposit
			SET Amount = Amount - @Amount
			WHERE ActNo = @LenderActNo
		
			UPDATE dbo.Deposit
			SET Amount = Amount + @Amount
			WHERE ActNo = @BorrowerActNo

			COMMIT TRANSACTION trAmountTransfer
			SELECT 'Transaction Executed.'
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION trAmountTransfer
			SELECT 'Transaction Rollbacked!'
		END CATCH
	END
END

SELECT * FROM Deposit
EXEC uspAmountTransfer 102, 110, 100
