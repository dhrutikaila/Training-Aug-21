USE AdventureWorks2016


--TRY CATCH EXAMPLE--
CREATE PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber,  
    ERROR_SEVERITY() AS ErrorSeverity,  
    ERROR_STATE() AS ErrorState,  
    ERROR_PROCEDURE() AS ErrorProcedure,  
    ERROR_LINE() AS ErrorLine,  
    ERROR_MESSAGE() AS ErrorMessage  
GO  
  
BEGIN TRY  
    -- Generate divide-by-zero error.  
    SELECT 1/0
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
    EXECUTE usp_GetErrorInfo 
END CATCH



--CREATE TRY CATCH STATEMENT USING SP--
CREATE PROCEDURE GetuspTryCatch
AS
BEGIN
	SELECT * FROM HumanResources.Employee
END
GO

BEGIN TRY 
	EXECUTE GetuspTryCatch
END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine,
		   ERROR_MESSAGE() AS ErrorMessage,
		   ERROR_NUMBER() AS ErrorNumber,
		   ERROR_SEVERITY() AS ErrorSeverity,
		   ERROR_STATE() AS ErrorState,  
           ERROR_PROCEDURE() AS ErrorProcedure 
END CATCH

--ALTER SP TO USE CATCH STATEMENT--
ALTER PROCEDURE GetuspTryCatch
AS
BEGIN
	SELECT * FROM HumanResources.Person
END
GO

BEGIN TRY 
	EXECUTE GetuspTryCatch
END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine,
		   ERROR_MESSAGE() AS ErrorMessage,
		   ERROR_NUMBER() AS ErrorNumber,
		   ERROR_SEVERITY() AS ErrorSeverity,
		   ERROR_STATE() AS ErrorState,  
           ERROR_PROCEDURE() AS ErrorProcedure 
END CATCH


--Exception Handling Example of PPT--
--Insert row using try catch--
BEGIN TRY 
	INSERT INTO Production.ProductReview
	VALUES
	(331,'Raj Shah',GETDATE(),'raj@gmail.com',3,'Good Product',GETDATE())
END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine,
		   ERROR_MESSAGE() AS ErrorMessage,
		   ERROR_NUMBER() AS ErrorNumber
END CATCH

SELECT * FROM Production.ProductReview

--Delete row using try catch-- 
BEGIN TRY
	DELETE FROM Production.ProductReview WHERE ReviewerName = 1
END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine,
		   ERROR_MESSAGE() AS ErrorMessage,
		   ERROR_NUMBER() AS ErrorNumber
END CATCH




--RAISEERROR--

--
BEGIN TRY
	SELECT 1/0
END TRY
BEGIN CATCH
	DECLARE @EM NVARCHAR(500) ,@ESev INT ,@Est INT ,@El INT 
	SELECT @EM = ERROR_MESSAGE(), @ESev = ERROR_SEVERITY(), @Est = ERROR_STATE(), @El = ERROR_LINE()
	PRINT 'Catch'
	RAISERROR (@EM,@ESev,@Est,@El)
END CATCH


--User defined Error message--
BEGIN TRY
	SELECT 1/0
END TRY
BEGIN CATCH
	DECLARE @EM NVARCHAR(500) ,@ESev INT ,@Est INT ,@El INT 
	SELECT @EM = 'Error at line number %d', @ESev = ERROR_SEVERITY(), @Est = ERROR_STATE(), @El = ERROR_LINE()
	--PRINT 'Catch'
	RAISERROR (@EM,@ESev,@Est,@El)
END CATCH