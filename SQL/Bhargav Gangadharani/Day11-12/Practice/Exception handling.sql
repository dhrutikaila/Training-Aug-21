-- CREATE STORED PROCEDURE
-- TRY CATCH 
-- CATCH ERROR
CREATE PROCEDURE MY_PROCEDURE
AS
	SELECT * FROM HumanResources.Employee
GO

BEGIN TRY 
	-- EXECUTE PROCEDURE
	EXECUTE MY_PROCEDURE
END TRY 

BEGIN CATCH
	SELECT ERROR_NUMBER() AS ERROR_NO,
			ERROR_MESSAGE() AS ERROR_MSJ

END CATCH


----  Catch block executed
CREATE TABLE TestInsertion 
	(    
		ID INT PRIMARY KEY  
	) 

BEGIN TRY  
    INSERT TestInsertion VALUES(1)   
    INSERT TestInsertion VALUES(1)
END TRY  
BEGIN CATCH  
  
    PRINT 'In catch block, Error With ID Constraint.'  
END CATCH

--------

BEGIN TRY  
    -- Table/object does not exist   
    
    SELECT * FROM NonexistentTable
END TRY  
	-- error not caught.  
BEGIN CATCH  
PRINT 'IN CATCH' 
    SELECT   
        ERROR_NUMBER() AS ErrorNumber , 
		ERROR_MESSAGE() AS ErrorMessage 
END CATCH 


---- Retrieving Error Information
BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0 
END TRY  
BEGIN CATCH  
    SELECT  
        ERROR_NUMBER() AS ErrorNumber, 
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_STATE() AS ErrorState,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage 
END CATCH 
GO 