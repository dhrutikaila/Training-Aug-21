CREATE TABLE DetroitBank (
        CutsomerName VARCHAR(50) NOT NULL,
        AccountNo VARCHAR(20) PRIMARY KEY,
        AccountType VARCHAR (10) NOT NULL,
        Amount INT NOT NULL
        )
INSERT INTO DetroitBank VALUES ('Chris Evans','KP01012568','Savings',100000),
                               ('RDJ','KP01012648','Current',486000),
                               ('Chris Hemsworth','KP01012486','Demate',64800)




							  
BEGIN TRANSACTION Transfers
DECLARE @Transaction INT
SET @Transaction=15000000
BEGIN TRY

        UPDATE DetroitBank SET Amount = Amount - @Transaction WHERE AccountNo = 'KP01012568' AND Amount > @Transaction;
		IF @@ERROR!>0 PRINT 'Transaction Failed'
		ELSE UPDATE DetroitBank SET Amount = Amount + @Transaction WHERE AccountNo = 'KP01012648'
END TRY
BEGIN CATCH
    PRINT 'Transaction Failed'
END CATCH
                   
COMMIT TRANSACTION Transfers
SELECT * FROM DetroitBank