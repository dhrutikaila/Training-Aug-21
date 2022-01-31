CREATE TABLE TRANSACTIONS 
(
	Transactions_ID INT CONSTRAINT Transactions_ID_PK PRIMARY KEY   IDENTITY(1,1),
	Debit_Account_ID INT,
	Credit_Account_ID INT,
	Transactions_Money MONEY
)

CREATE TABLE ACCOUNT
(
	Account_ID INT CONSTRAINT Account_ID_PK PRIMARY KEY  IDENTITY(1,1),
	Account_User_Name varchar(30),
	Account_Money MONEY
)

INSERT INTO ACCOUNT VALUES(1,'VRAJ',20000),
						  (2,'DARSHAN',30000),
						  (3,'VIVEK',40000),
						  (4,'VISHAL',70000),
						  (5,'KARAN',90000)



CREATE TRIGGER TRANS
ON TRANSACTIONS
FOR  INSERT 
AS

DECLARE @Debit_Account_ID  INT,
		@Credit_Account_ID INT,
		@Transactions_Money MONEY

SELECT @Debit_Account_ID=Debit_Account_ID,
	   @Credit_Account_ID=Credit_Account_ID,
	   @Transactions_Money=Transactions_Money 
FROM inserted

BEGIN TRANSACTION TRANSACTIONS 
BEGIN TRY

   --CHECK MONEY IS Available OR NOT IN Debit_Account
  IF (@Transactions_Money<=(SELECT Account_Money FROM ACCOUNT WHERE Account_ID=@Debit_Account_ID))
       BEGIN
  --Debit
		 UPDATE ACCOUNT  
		 SET Account_Money=Account_Money-@Transactions_Money
		 WHERE Account_ID=@Debit_Account_ID
 --CREDIT
		 UPDATE ACCOUNT 
		 SET Account_Money=Account_Money+@Transactions_Money
		 WHERE Account_ID=@Credit_Account_ID
	     COMMIT TRANSACTION  TRANSACTIONS
       END
  ELSE  
       BEGIN 
		 print('LESS MONEY FOUND') -- Message text.
		 ROLLBACK TRANSACTION TRANSACTIONS
	   END
END TRY
BEGIN CATCH
	 ROLLBACK TRANSACTION  TRANSACTIONS
	 PRINT 'ROLLBACK TRANSACTION'
END CATCH

--INSERT
INSERT INTO TRANSACTIONS VALUES(2,2,7000)


SELECT * FROM TRANSACTIONS
SELECT * FROM ACCOUNT
