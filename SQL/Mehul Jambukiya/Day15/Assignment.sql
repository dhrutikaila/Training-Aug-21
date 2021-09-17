USE Practice

--Detroit Bank need to implement the transaction whenever the amount is
--transferred from one account to the another account.

CREATE TABLE BankAccount
(
CustomerId INT CONSTRAINT BankAccount_CustomerId_Pk PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(30) CONSTRAINT BankAccount_FirstName_NotNull NOT NULL,
LastName VARCHAR(30) CONSTRAINT BankAccount_LastName_NotNull NOT NULL,
AccountNumber INT CONSTRAINT BankAccount_AccountNumber_Chk_Unique CHECK (AccountNumber BETWEEN 00000000 AND 99999999) UNIQUE NOT NULL,
AccountBalance MONEY CONSTRAINT BankAccount_AccountBalance_NotNull NOT NULL,
CreatedOn DATETIME CONSTRAINT BankAccount_CreatedOn_Def DEFAULT GETDATE()
)

CREATE TABLE TransactionRecords
(
TransactionId INT CONSTRAINT TransactionRecords_TransactionId_Pk PRIMARY KEY IDENTITY(1,1),
CreditorID INT CONSTRAINT TransactionRecords_CreditorID_Fk NOT NULL FOREIGN KEY REFERENCES BankAccount(CustomerId) ON DELETE NO ACTION ON UPDATE NO ACTION,
DebitorID INT CONSTRAINT TransactionRecords_DebitorID_Fk NOT NULL FOREIGN KEY REFERENCES BankAccount(CustomerId) ON DELETE NO ACTION ON UPDATE CASCADE,
Amount MONEY CONSTRAINT TransactionRecords_Amount_NotNull NOT NULL,
TransferredOn DATETIME CONSTRAINT TransactionRecords_TransferredOn_Def DEFAULT GETDATE()
)

INSERT INTO BankAccount VALUES ('John','Bell',44444444,50000,GETDATE()),
('Roy','Chen',44444445,55000,GETDATE()),
('Steaven','King',44444446,45000,GETDATE()),
('Kevin','Popp',44444447,60000,GETDATE())


DECLARE @CreditorId INT=3,@DebitorId INT=4,@Amount MONEY=10000,@Balance MONEY
SET TRANSACTION ISOLATION LEVEL
READ COMMITTED
BEGIN TRANSACTION MyTran
	BEGIN TRY 
		IF(@CreditorId<>@DebitorId)
			BEGIN
				SET @Balance=(SELECT AccountBalance FROM BankAccount WHERE CustomerId=@DebitorId)
				IF(@Balance>@Amount)
					BEGIN
						INSERT INTO TransactionRecords VALUES (@CreditorId,@DebitorId,@Amount,GETDATE())
						UPDATE BankAccount SET AccountBalance+=@Amount WHERE CustomerId=@CreditorId
						UPDATE BankAccount SET AccountBalance-=@Amount WHERE CustomerId=@DebitorId
						COMMIT TRANSACTION MyTran
						SAVE TRANSACTION MyTran
					END
				ELSE
					BEGIN
						PRINT 'Insufficient account balance...'
					END
			END
		ELSE
			BEGIN
				PRINT 'Transaction cannot be done within self account...'
			END
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT 'Something went wrong,Please try again...'
	END CATCH