--  Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.

USE Demo

CREATE TABLE CustomerAccount
(
Id int PRIMARY KEY IDENTITY(1,1),
C_name varchar(20) NOT NULL,
Amount int DEFAULT 0 NOT NULL
)

ALTER TABLE CustomerAccount
ADD CONSTRAINT ckh_amount CHECK (Amount >= 0)

CREATE TABLE Transactions
(
Sender_id int FOREIGN KEY REFERENCES CustomerAccount(Id) NOT NULL,
Receiver_id int FOREIGN KEY REFERENCES CustomerAccount(Id) NOT NULL,
Trans_Amount int NOT NULL,
Trans_Date Date NOT NULL
)

ALTER TABLE Transactions
ADD CONSTRAINT ckh_ids CHECK(Receiver_id <> Sender_id)


INSERT INTO CustomerAccount VALUES
('Prit',25000),('Man',20000),('Tirth',23000),('Krusha',30000),('Raj',15000)

CREATE TRIGGER tgr_transaction
ON Transactions
FOR INSERT
AS
BEGIN

	BEGIN TRANSACTION transferAmount

		BEGIN TRY

			UPDATE CustomerAccount
			SET Amount = Amount - i.Trans_Amount
			FROM inserted i JOIN CustomerAccount c ON c.Id = i.Sender_id
			
			UPDATE CustomerAccount
			SET Amount = Amount + i.Trans_Amount
			FROM inserted i JOIN CustomerAccount c ON c.Id = i.Receiver_id

			COMMIT TRANSACTION transferAmount
			
		END TRY

		BEGIN CATCH
		
			ROLLBACK TRANSACTION transferAmount
		
		END CATCH

END

CREATE PROCEDURE depositAmount
@Sender int,
@receiver int,
@amount int
AS
INSERT INTO Transactions VALUES(@Sender,@receiver,@amount,GETDATE())

EXEC depositAmount 1,5,2000
EXEC depositAmount 1,1,2000 -- Throws Error because sender and receiver id should be different
EXEC depositAmount 5,1,50000 -- Throws Error because Amount cannot be negative

SELECT * FROM Transactions
SELECT * FROM CustomerAccount