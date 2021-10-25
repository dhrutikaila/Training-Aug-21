
CREATE TABLE Account
(
	FirstName VARCHAR(25) CONSTRAINT FirstName_NotNull NOT NULL,
	LastName VARCHAR(25) CONSTRAINT LastName_NotNull NOT NULL,
	AccountNumber NUMERIC CONSTRAINT AccNumber_PK PRIMARY KEY,
	AccountBalance MONEY CONSTRAINT AccountBalance_NotNull NOT NULL,
	OpningDate DATE CONSTRAINT Date_NotNull NOT NULL
)

INSERT INTO Account VALUES
('Rohit','Sharma',12000045215,25000,GETDATE()),
('Rahul','Patel',12000045216,100000,GETDATE()),
('Ronit','Shah',12000045217,35000,GETDATE()),
('Shubham','Patel',12000045218,80000,GETDATE())

SELECT * FROM Account

ALTER PROCEDURE Transactions
(@AccountNumber1 NUMERIC,
@AccountNumber2 NUMERIC,
@Amount INT)  
AS

BEGIN TRANSACTION TR1
BEGIN TRY
	IF(SELECT AccountBalance FROM Account WHERE AccountNumber=@AccountNumber1)>0
	BEGIN
		UPDATE Account SET AccountBalance=AccountBalance-@Amount WHERE AccountNumber=@AccountNumber1
		UPDATE Account SET AccountBalance=AccountBalance+@Amount WHERE AccountNumber=@AccountNumber2
		COMMIT TRANSACTION TR1
		PRINT 'Transaction Completed successfully'
	END
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION TR1
	PRINT 'Transaction failed'
END CATCH

EXEC Transactions 12000045215,12000045216,25000

