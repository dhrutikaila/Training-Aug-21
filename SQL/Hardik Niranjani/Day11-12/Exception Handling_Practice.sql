
--Exception Handling ======================================

--Display Error 

CREATE PROCEDURE spGetExceptionHandlingSimpleQuery  
AS  
    SELECT * FROM NonexistentTable
GO  
  
BEGIN TRY  
    EXECUTE spGetExceptionHandlingSimpleQuery
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_MESSAGE() AS ErrorMessage
END CATCH 


-- Execute Successfully 

CREATE PROCEDURE spGetExceptionHandlingSimpleQuerySuccess  
AS  
    SELECT * FROM Departments
GO  
  
BEGIN TRY  
    EXECUTE spGetExceptionHandlingSimpleQuerySuccess 
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_MESSAGE() AS ErrorMessage
END CATCH 


--Simple TRY-CATCH

BEGIN TRY  
    SELECT 1/0
END TRY  
BEGIN CATCH  
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage  
END CATCH  
GO 




--========================================================================================================
--TRY-CATCH With UDF

-- 1 without error
	
CREATE FUNCTION Fn_SimpleFunctionException(@DepId INT)
RETURNS TABLE
AS
RETURN
(
		SELECT COUNT(EmployeeID) AS [Number Of Employees]
		FROM Employees
		WHERE DepartmentID = @DepId
)	

BEGIN TRY
	SELECT * FROM Fn_SimpleFunctionException(90)
END TRY

BEGIN CATCH
 SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage 
END CATCH

-- 2 with error

CREATE FUNCTION Fn_SimpleFunctionExceptionError11()
RETURNS TABLE
AS
RETURN
(
		SELECT COUNT(EmployeeID) AS [Number Of Employees],DepartmentID
		FROM Employees1
		GROUP BY DepartmentID
		
)	

BEGIN TRY
		SELECT * FROM dbo.Fn_SimpleFunctionExceptionError()
END TRY

BEGIN CATCH
 SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage 
END CATCH

--========================================================================================================

--USE SP TRY-CATCH

CREATE FUNCTION SampleFunction()
RETURNS TABLE
AS
RETURN
(
		SELECT * FROM Departments
)

ALTER PROCEDURE spGetProcedureWithFunction
AS
BEGIN
	SELECT emp FROM SampleFunction1()
END


BEGIN TRY
EXEC spGetProcedureWithFunction
END TRY

BEGIN CATCH
 SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage 
END CATCH