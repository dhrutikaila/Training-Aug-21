--1

BEGIN TRY
-- Generate a divide-by-zero error  
  SELECT  12 / 0 AS Error;
END TRY
BEGIN CATCH
  PRINT 'You can not Divide a Number By Zero'
END CATCH;

--2

BEGIN TRY
-- Divide By Zero Error  
  SELECT  12 / 0 AS Error;
END TRY

BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

--3

BEGIN TRY
 UPDATE Employees SET FirstName = rutvik WHERE EmployeeId = 101;  
END TRY
BEGIN CATCH
  PRINT 'You can not insert String into integer column'
END CATCH;

--4

BEGIN TRY
  UPDATE Employees SET FirstName = rutvik WHERE EmployeeId = 101;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;