--try..catch

BEGIN TRY  
     { sql_statement | statement_block }  
END TRY  
BEGIN CATCH  
     [ { sql_statement | statement_block } ]  
END CATCH  

/*
A TRY...CATCH construct catches all execution errors that have a severity higher than 10 that do not close the database connection.

A TRY block must be immediately followed by an associated CATCH block. Including any other statements between the END TRY and BEGIN CATCH statements generates a syntax error.
*/

-------------------------------------------------------------------------------------------

CREATE PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO  
  
BEGIN TRY  
    -- Generate divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
    EXECUTE usp_GetErrorInfo;  
END CATCH;


-----
CREATE FUNCTION ufn_divide(@x INT,@y INT)
RETURNS INT
AS
BEGIN
		DECLARE @ret_value INT;
		SET @ret_value= @x / @y;
		RETURN @ret_value;
END

BEGIN TRY
	SELECT dbo.ufn_divide(2,2)
END TRY
BEGIN CATCH
	 SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage; 
END CATCH



BEGIN TRY
	DECLARE @x INT = 0,@y INT = 21;
	SELECT @y /@x AS val
END TRY
BEGIN CATCH
	 SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage; 
END CATCH



-------------------------------------------------------------------------------

/*select value from nono existent table*/

BEGIN TRY
	SELECT * FROM helloWorld
END TRY
BEGIN CATCH
	SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage; 
END CATCH

--error was not detected


--Running the SELECT statement inside a stored procedure will cause the error to occur at a level lower than the TRY block


CREATE PROCEDURE usp_detectError
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM Raviraj                --here raviraj is non-existent table

	SET NOCOUNT OFF;
END



BEGIN TRY
	EXEC usp_detectError
END TRY
BEGIN CATCH
	EXEC usp_GetErrorInfo
END CATCH


--TODO constraint voilation

--throw keyword

THROW 51000, 'The record does not exist.', 1;

/*
op:- Msg 51000, Level 16, State 1, Line 116
The record does not exist.

Completion time: 2021-09-08T13:17:43.2093066+05:30
*/


CREATE TABLE dbo.throwTest1
(
ID INT PRIMARY KEY
)

BEGIN TRY
	INSERT dbo.throwTest1 VALUES(1);

	INSERT dbo.throwTest1 VALUES(1);
END TRY
BEGIN CATCH
	PRINT 'In The block: ';
	THROW;
END CATCH



BEGIN TRY
	INSERT dbo.throwTest1 VALUES(1);

	INSERT dbo.throwTest1 VALUES(1);
END TRY
BEGIN CATCH
	PRINT 'In The block: ';
	THROW 56000, 'repeted primary key please check correct insert value ',1;
END CATCH


----------------------------------------------------------------------------------------------------
USE AdventureWorks2019

--The XACT_STATE function determines whether the transaction should be committed or rolled back

-- SET XACT_ABORT ON will cause the transaction to be uncommittable  
-- when the constraint violation occurs.  
SET XACT_ABORT ON


BEGIN TRY  
    BEGIN TRANSACTION;  
        -- A FOREIGN KEY constraint exists on this table. This   
        -- statement will generate a constraint violation error.  
        DELETE FROM Production.Product  
            WHERE ProductID = 980;  
  
    -- If the DELETE statement succeeds, commit the transaction.  
    COMMIT TRANSACTION;  
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
    EXECUTE usp_GetErrorInfo;  
  
    -- Test XACT_STATE:  
        -- If 1, the transaction is committable.  
        -- If -1, the transaction is uncommittable and should   
        --     be rolled back.  
        -- XACT_STATE = 0 means that there is no transaction and  
        --     a commit or rollback operation would generate an error.  
  
    -- Test whether the transaction is uncommittable.  
    IF (XACT_STATE()) = -1  
    BEGIN  
        PRINT  
            N'The transaction is in an uncommittable state.' +  
            'Rolling back transaction.'  
        ROLLBACK TRANSACTION;  
    END;  
  
    -- Test whether the transaction is committable.
    -- You may want to commit a transaction in a catch block if you want to commit changes to statements that ran prior to the error.
    IF (XACT_STATE()) = 1  
    BEGIN  
        PRINT  
            N'The transaction is committable.' +  
            'Committing transaction.'  
        COMMIT TRANSACTION;     
    END;  
END CATCH;  
GO  

