USE day6

CREATE TABLE Bank
(
CustomerId INT PRIMARY KEY,
CustomerName VARCHAR(30),
MobileNo INT,
AccountNo INT,
Amount DECIMAL
)



BEGIN TRANSACTION change
DECLARE @Money INT
SET @Money=500
BEGIN TRY
UPDATE Bank SET Amount=  Amount - @Money WHERE AccountNo = 456
UPDATE Bank SET Amount = Amount + @Money WHERE AccountNo =123
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION Credit
PRINT 'Transaction Failed'
END CATCH

COMMIT TRANSACTION change
SELECT * FROM Bank