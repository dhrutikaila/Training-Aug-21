CREATE DATABASE BANK
USE BANK;

CREATE TABLE Customer_info (
	Customer_ID INT PRIMARY KEY IDENTITY(1000,1),
	Customer_Name VARCHAR(30) NOT NULL,
	DOB DATE NOT NULL,
	Email NVARCHAR(30) CONSTRAINT chk_email CHECK (Email LIKE '%@%.%'),
	Address NVARCHAR(30) NOT NULL,
	PinCode NUMERIC(6) NOT NULL,
	Phone_Number NUMERIC(10) NOT NULL
)

CREATE TABLE ACCOUNTS (
Customer_ID INT CONSTRAINT fk_account_cid FOREIGN KEY REFERENCES Customer_info(Customer_ID),
Account_Number INT PRIMARY KEY,
Balance MONEY NOT NULL,
)


INSERT INTO Customer_info VALUES
('Raviraj','2000-01-30','raviraj@sbi.com','Morbi',363331,9925099250),
('Yuvraj','1999-10-30','raviraj@sbi.com','Morbi',363331,9925099251),
('Sagar','1998-01-12','raviraj@sbi.com','Halvad',363330,9925099252),
('Sanjay','2000-09-10','raviraj@sbi.com','Halvad',363330,9925099253),
('Sunil','2001-11-30','raviraj@sbi.com','Halad',363330,9925099254)



INSERT INTO ACCOUNTS VALUES
(1000,124001,100000),
(1001,124003,80000),
(1002,125001,300000),
(1003,125002,90000),
(1004,125003,500000)


SELECT * FROM Customer_info
SELECT * FROM ACCOUNTS

ALTER TABLE ACCOUNTS
ADD CONSTRAINT chk_Balance CHECK ( Balance > 0 )



------ Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.


CREATE OR ALTER PROCEDURE dbo.usp_transferMoney 
@Amount MONEY,
@Debit_From INT,
@Credit_To INT

AS
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





EXEC dbo.usp_transferMoney @Amount= 5000, @Debit_From = 124001, @Credit_To = 124003
--transaction successful because account holder 124001 has enough amount for transfer


EXEC dbo.usp_transferMoney @Amount= 96000, @Debit_From = 124001, @Credit_To = 124003

--transaction failed because account holder 124001 has  not enough amount for transfer
