-- In the scope of a CATCH block, the following system functions can be used to obtain information about the error that caused the CATCH block to be executed:

    -- ERROR_NUMBER() returns the number of the error.

    -- ERROR_SEVERITY() returns the severity.

    -- ERROR_STATE() returns the error state number.

    -- ERROR_PROCEDURE() returns the name of the stored procedure or trigger where the error occurred.

    -- ERROR_LINE() returns the line number inside the routine that caused the error.

    -- ERROR_MESSAGE() returns the complete text of the error message. The text includes the values supplied for any substitutable parameters, such as lengths, object names, or times.

-- DIVIDE BY ZERO ERROR
    BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0; 
        
    END TRY  
    BEGIN CATCH  
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH;  
    GO

-- FOREIGN  KEY VIOALTION ERROR

    BEGIN TRY  
    -- Generate a constraint violation error.  
    DELETE FROM Employee  
    WHERE EMPLOYEE_ID = 2;  
    END TRY  
    BEGIN CATCH  
        SELECT   
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;      
    END CATCH;  

-- NON-EXISTING TABLE ERROR
    CREATE PROCEDURE usp_ExampleProc  
    AS  
        SELECT * FROM NonexistentTable;  
    GO  
    
    BEGIN TRY  
        EXECUTE usp_ExampleProc;  
    END TRY  
    BEGIN CATCH  
        SELECT   
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH;  

-- CONVERSION FAILED ERROR
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
        SELECT 1/'VORA';  
    END TRY  
    BEGIN CATCH  
        -- Execute error retrieval routine.  
        EXECUTE usp_GetErrorInfo;  
    END CATCH;   
