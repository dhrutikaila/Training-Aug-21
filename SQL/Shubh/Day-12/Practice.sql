--1. Try Catch for Mathematical Exception
BEGIN TRY
    SELECT 1/0 AS ErrorCheck 
END TRY
BEGIN CATCH
    SELECT
		ERROR_NUMBER() AS ErrorNumber, 
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,  
        ERROR_PROCEDURE() AS ErrorProcedure,  
        ERROR_LINE() AS ErrorLine,  
        ERROR_MESSAGE() AS ErrorMessage;  
END CATCH
GO

--2. Constraint Violation Error
BEGIN TRY
    DELETE FROM dbo.Customer 
    WHERE Cname = 'ANIL';  
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber, 
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,  
        ERROR_PROCEDURE() AS ErrorProcedure,  
        ERROR_LINE() AS ErrorLine,  
        ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
GO

--3. Error in sp.
CREATE TABLE Math (Id INT, No1 INT, No2 INT)
INSERT INTO Math VALUES (0,1,0),(1,8,24),(2,25,29),(3,0,89),(4,0,0),(5,6,48)
GO

CREATE PROCEDURE MathOps
@Id INT
AS
	BEGIN
		SELECT 
			No1+No2 AS Addition, 
			No1*No2 AS Multiplication, 
			No1/No2 AS Division, 
			No1-No2 AS Subtraction
		FROM Math WHERE Id=@Id
	END
GO
--I.
BEGIN TRY
    EXEC MathOps 4
END TRY
BEGIN CATCH
    SELECT
		ERROR_NUMBER() AS ErrorNumber, 
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,  
        ERROR_PROCEDURE() AS ErrorProcedure,  
        ERROR_LINE() AS ErrorLine,  
        ERROR_MESSAGE() AS ErrorMessage;  
END CATCH
GO
----------------------------------------------------------
--II.
BEGIN TRY
    EXEC MathOps 4
END TRY
BEGIN CATCH  
    DECLARE @ErrorMessage VARCHAR(50);  
    DECLARE @ErrorSeverity INT;  
    DECLARE @ErrorState INT;  
  
    SELECT   
        @ErrorMessage = 'ERROR ENCOUNTERED, CHECKING RAISE ERROR SYNTAX',  
        @ErrorSeverity = ERROR_SEVERITY(),  
        @ErrorState = ERROR_STATE();  
  
    RAISERROR (@ErrorMessage, -- Message text.  
               @ErrorSeverity, -- Severity.  
               @ErrorState -- State.  
               );  
END CATCH;


--4. RaiseError
BEGIN TRY  
    UPDATE Post
	SET UserId=11 WHERE UserId IN (1,2,3)
   
END TRY  
BEGIN CATCH  
    DECLARE @ErrorMessage NVARCHAR(4000);  
    DECLARE @ErrorSeverity INT;  
    DECLARE @ErrorState INT;  
  
    SELECT   
        @ErrorMessage = ERROR_MESSAGE(),  
        @ErrorSeverity = ERROR_SEVERITY(),  
        @ErrorState = ERROR_STATE();  
  
    -- Use RAISERROR inside the CATCH block to return error  
    -- information about the original error that caused  
    -- execution to jump to the CATCH block.  
    RAISERROR (@ErrorMessage, -- Message text.  
               @ErrorSeverity, -- Severity.  
               @ErrorState -- State.  
               );  
END CATCH;

--5. Constraint Vioaltion Error
BEGIN TRY
	UPDATE Post
	SET UserId=11 WHERE UserId IN (1,2,3)
END TRY
BEGIN CATCH
	SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO