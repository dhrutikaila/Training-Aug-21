USE DB_BANK
GO

-- TABLES

CREATE TABLE Customers(
		ID INT IDENTITY(1,1)
	,	Name VARCHAR(30) NOT NULL
	,	Balance MONEY  DEFAULT 0
	,	CONSTRAINT PK_Customer_ID PRIMARY KEY(ID)
	,	CONSTRAINT CHK_Customer_Balance CHECK(Balance > 0)
)
GO 

CREATE TABLE PaymentStatus(
		PID INT IDENTITY(1,1)
	,	Status VARCHAR(10)
	,	CONSTRAINT PK_PaymentStatuts_PID PRIMARY KEY(PID)
)

CREATE TABLE PaymentHistory(
		PymentID INT IDENTITY(1,1)
	,	CreditorID INT NOT NULL
	,	DebitorID INT NOT NULL
	,	Amount MONEY NOT NULL
	,	PID INT NOT NULL DEFAULT 3
	,	TransferdON DATETIME DEFAULT GETDATE()
	,	CONSTRAINT PK_PaymentHistory_PymentID PRIMARY KEY(PymentID)
	,	CONSTRAINT FK_PaymentHistory_Customers_CreditorID FOREIGN KEY(CreditorID) REFERENCES Customers(ID)
	,	CONSTRAINT FK_PaymentHistory_Customers_DebitorID FOREIGN KEY(DebitorID) REFERENCES Customers(ID)
	,	CONSTRAINT FK_PaymentHistory_PaymentStatus_PID FOREIGN KEY(PID) REFERENCES PaymentStatus(PID)
	,	CONSTRAINT CHK_PaymentHistory_Amount CHECK(Amount > 0)
	,	CONSTRAINT CHK_PaymentHistory_CreditorID_DebitorID CHECK(DebitorID <> CreditorID)
)
GO


-- INSERT 

INSERT INTO Customers
	VALUES('Niraj',150000)
	,	('Sagar',100000)
	,	('Meet',150000)
	,	('Vinod',250000)
	,	('Manthan',350000)
	,	('Amit',200000)
GO

INSERT INTO PaymentStatus
	VALUES('Success')
		,	('Failed')
		,	('Pending')
GO

-- CREATEING PROCEDURE

CREATE PROCEDURE UspPaymentInsertJson
	@PayData NVARCHAR(MAX)
AS
BEGIN
	IF ISJSON(@PayData)>0
	BEGIN
		SET NOCOUNT ON
		INSERT INTO PaymentHistory(CreditorID
								,	DebitorID
								,	Amount
							)
		SELECT *
		FROM OPENJSON(@PayData)
		WITH(
				CreditorID INT '$.CreditorID'
			,	DebitorID INT '$.DebitorID'
			,	Amount INT '$.Amount'
		)
		SET NOCOUNT OFF
	END
END
GO

--DROP PROCEDURE UspPaymentInsertJson
--GO

-- CREATING TRIGGER

CREATE TRIGGER TrgPaymentInsert
ON PaymentHistory
FOR INSERT
AS 
BEGIN
	SET NOCOUNT ON
	DECLARE @ID INT, @CID INT, @DID INT, @Amount MONEY
	DECLARE CusrerInsertPayment CURSOR
	SCROLL FOR
	SELECT PymentID 
		,	CreditorID 
		,	DebitorID 
		,	Amount 
	FROM inserted
	
	OPEN CusrerInsertPayment
	IF @@CURSOR_ROWS > 0	
	BEGIN

	FETCH FIRST FROM CusrerInsertPayment  INTO @ID, @CID, @DID, @Amount

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET TRANSACTION ISOLATION LEVEL
			READ COMMITTED
			BEGIN TRAN TraPaymentInsert
			BEGIN TRY
		
				UPDATE Customers
				SET Balance -= @Amount
				WHERE ID = @CID

				UPDATE Customers
				SET Balance += @Amount
				WHERE ID = @DID

				UPDATE PaymentHistory
				SET PID = 1
				WHERE PymentID = @ID

				PRINT 'Payment Successfull'

				COMMIT TRAN TraPaymentInsert
			END TRY
			BEGIN CATCH
				ROLLBACK TRAN TraPaymentInsert
		
				UPDATE PaymentHistory
				SET PID = 2
				WHERE PymentID = @ID

				PRINT 'Payment Failed'

			END CATCH
			FETCH NEXT FROM CusrerInsertPayment  INTO @ID, @CID, @DID, @Amount
		END
	END
	CLOSE CusrerInsertPayment
	DEALLOCATE CusrerInsertPayment
	SET NOCOUNT OFF
END
GO

--DROP TRIGGER TrgPaymentInsert
--GO

-- SELECT

SELECT * 
FROM Customers

SELECT *
FROM PaymentStatus

SELECT *
FROM PaymentHistory

-- EXECUTE

DECLARE @JsonData NVARCHAR(MAX) = 
'[
 {
   "CreditorID": 1,
   "DebitorID": 2,
   "Amount": 5000
 },
 {
   "CreditorID": 2,
   "DebitorID": 1,
   "Amount": 10000
 },
 {
   "CreditorID": 2,
   "DebitorID": 3,
   "Amount": 500
 }
]'

EXEC UspPaymentInsertJson @JsonData
GO

SELECT * FROM PaymentHistory
SELECT * FROM Customers

--DROP TABLE Customers
--DROP TABLE PaymentStatus
--DROP TABLE PaymentHistory
--GO