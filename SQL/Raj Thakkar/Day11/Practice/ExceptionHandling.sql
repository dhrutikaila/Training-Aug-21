--Try...Catch with true value 
BEGIN TRY  
    -- Basic select statement  
    SELECT 12/10
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

--Try...Catch with false value
BEGIN TRY  
    -- Basic select statement  
    SELECT 12/0
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

--Try...Catch with insert
BEGIN TRY  
    -- Insert in Employees 
    INSERT INTO Employees VALUES (1,'Jeremy','King','JHGKL',5544554455,'1999/2/24','IT',25000,0,0,0,9,8)
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


--Try...Catch in procedure
CREATE PROC spInsertCatch
AS
BEGIN
    -- Insert in Employees 
    INSERT INTO Employees VALUES (1,'Jeremy','King','JHGKL',5544554455,'1999/2/24','IT',25000,0,0,0,9,8)
END
BEGIN TRY  
     -- EXECUTE sp
    EXEC spInsertCatch
END TRY  
BEGIN CATCH  
     SELECT ERROR_NUMBER() AS ErrorNumber,  
              ERROR_SEVERITY() AS ErrorSeverity,  
              ERROR_STATE() AS ErrorState,  
              ERROR_PROCEDURE() AS ErrorProcedure,  
              ERROR_LINE() AS ErrorLine,  
              ERROR_MESSAGE() AS ErrorMessage 
         
END CATCH
GO



--Try..catch with sp
CREATE PROC spSelectCatch
AS
BEGIN
     SELECT * FROM Employeee
END
BEGIN TRY  
    -- EXECUTE sp
    EXEC spSelectCatch
END TRY  
BEGIN CATCH  
       SELECT ERROR_NUMBER() AS ErrorNumber,  
              ERROR_SEVERITY() AS ErrorSeverity,  
              ERROR_STATE() AS ErrorState,  
              ERROR_PROCEDURE() AS ErrorProcedure,  
              ERROR_LINE() AS ErrorLine,  
              ERROR_MESSAGE() AS ErrorMessage 
       
END CATCH
GO

--RAISEERROR--
BEGIN TRY  
    -- EXECUTE sp
    EXEC spSelectCatch
END TRY  
BEGIN CATCH  
RAISERROR (N'You have got a %s error number %d.', -- Message text.  
           10, -- Severity,  
           1, -- State,  
           N'SELECT', -- First argument.  
           5); -- Second argument.  
END CATCH
GO
