----------------------TRY_CATCH------------------------------
 BEGIN TRY
	DECLARE @A INT,@B INT,@C INT
	SET @A=11
	SET @B=0
	SET @C=@A/@B
END TRY
BEGIN CATCH
	PRINT('Divide by zero error encountered.')
END CATCH

------------------------------------------------------
CREATE PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
     ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage   
GO  
  
BEGIN TRY  
    -- Generate divide-by-zero error.  
    SELECT 1/0 AS Error  
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
    EXECUTE usp_GetErrorInfo   
END CATCH    
-----------------------------------------------------------------------------
USE TEST

CREATE PROCEDURE sp_EmpError
AS
BEGIN 
SELECT * FROM Employees WHERE EmployeeID = '@123%'
END

BEGIN TRY
EXECUTE sp_EmpError
END TRY
BEGIN CATCH
   DECLARE @Message varchar(MAX) = ERROR_MESSAGE(),
        @Severity int = ERROR_SEVERITY(),
        @State smallint = ERROR_STATE()
 
   RAISERROR (@Message, @Severity, @State)
   PRINT('                     ')
   RAISERROR (50001, @Severity, @State,@Message)
 END CATCH


 EXEC sp_addmessage   
    @msgnum = 50001,  
    @severity = 16,  
    @msgtext = N'ERROR Occour due to %s',   
    @lang = 'us_english' 

EXEC sp_dropmessage  50001

--------------------------RAISERROR-------------------------------------

RAISERROR (N'This is message %s 5.', -- Message text.  
           10, -- Severity,  
           1, -- State,  
           N'number', -- First argument.  
           5) -- Second argument.  
-- The message text returned is: This is message number 5.  
GO




   DECLARE @Message varchar(MAX) = ERROR_MESSAGE(),
        @Severity int = ERROR_SEVERITY(),
        @State smallint = ERROR_STATE()
 






