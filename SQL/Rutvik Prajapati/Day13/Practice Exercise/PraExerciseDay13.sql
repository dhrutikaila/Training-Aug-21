-- Exception Handling 
	--means any error at runtime it call as Exception..

-- using try catch
   BEGIN TRY
    SELECT 1/0;
   END TRY
   BEGIN CATCH
	SELECT  @@ERROR AS ERROR,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
   END CATCH
--------------------------------------------------
BEGIN
	BEGIN TRY 
		DECLARE @NAME  VARCHAR(20);
		DECLARE @Salary NUMERIC
		SET @Salary = 5000
		SET @NAME = 'Rutvik'
		PRINT @NAME + ' EARNS ' +@Salary
	END TRY
	BEGIN CATCH
		SELECT  @@ERROR AS ERROR,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
	END CATCH
END 
---------------------------------------------
 CREATE PROCEDURE spUpdateSalaryAndDepartmentWithTryCatch
  @TEMPSALARY DECIMAL(8,2),@TEMPDEPT VARCHAR(30)
  AS 
  BEGIN TRY 
		UPDATE Employees SET Salary = @TEMPSALARY WHERE EmployeeID = 106

		UPDATE Departments SET DepartmentName = @TEMPDEPT WHERE DepartmentID = 60
	PRINT 'Successfully'
  END TRY 
  BEGIN CATCH 
	PRINT 'Error..'
  END CATCH 


  EXECUTE spUpdateSalaryAndDepartmentWithTryCatch 5500,NULL
  --ERROR

