USE AdventureWorks2019
GO

-- FUNCTION


-- EXCEPTION HANDLING

BEGIN TRY
	INSERT INTO HumanResources.Employee
	SELECT * FROM HumanResources.Department 
END TRY
BEGIN CATCH 
	SELECT 'There was an error '
	+ ERROR_MESSAGE() AS 'ErrorMessage'
	,	ERROR_LINE() AS 'ErrorLine'
	,	ERROR_PROCEDURE() As 'ErrorProcedure'
	,	ERROR_SEVERITY() AS 'ErrorSeverity'
	,	ERROR_STATE() AS 'ErrorState'
END CATCH 
GO

BEGIN TRY
    INSERT INTO HumanResources.EmployeeDepartmentHistory
        VALUES(NULL, NULL,NULL,NULL,NULL,NULL)
 
END TRY
BEGIN CATCH
    SELECT 'There was an error!' + ERROR_MESSAGE() 'ErrorMessage'
        , ERROR_LINE() 'ErrorLine'
        , ERROR_NUMBER() 'ErrorNumber'
        , ERROR_PROCEDURE() 'ErrorProcedure'
        , ERROR_SEVERITY() 'ErrorSeverity'
        , ERROR_STATE() 'ErrorState'
END CATCH

SELECT * FROM HumanResources.EmployeeDepartmentHistory

--  RAISERROR
RAISERROR (N'This was an error!',10,1)

