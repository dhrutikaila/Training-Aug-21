--Exception Handling

--SYSTEM Define Exception
--Divede By Zero Error
DECLARE @Val1 Int;  
DECLARE @Val2 Int;  
BEGIN TRY  
SET @Val1=8;  
SET @Val2=@Val1/0; /* Error Occur Here */  
END TRY  
BEGIN CATCH  
PRINT 'Error Occur that is:'  
PRINT ERROR_MESSAGE()  
END CATCH


--USER Define Exception : This type of exception is user generated, not system generated.
--Error Occur When Val1 Number is Even Number
DECLARE @Val1 int;  
DECLARE @Val2 int;  
BEGIN TRY  
SET @Val1=7;  
SET @Val2=@val1%2;   
IF @Val2=1  
PRINT ' Error Not Occur' + ' Number Is Odd'
ELSE  
BEGIN  
PRINT 'Error Occur';  
THROW 60000,'Number Is Even',5  --Here 60000 denotes the error number and 5 denotes the state to associate with the message.
END  
END TRY  
BEGIN CATCH  
PRINT 'Error Occur that is:'  
PRINT ERROR_MESSAGE()  
END CATCH  

---------------------------------------------------------------------------------------------
--All System Error Function
---------------------------------------------------------------------------------------------
BEGIN TRY   
INSERT INTO Employees (Salary) VALUES ('dev')
END TRY  
BEGIN CATCH 
SELECT 
--Error_Message return error massage
ERROR_MESSAGE() AS ErrorMessage, 
--ERROR_NUMBER : Return The Error Number.It Return 0 If Called Out Side The Catch
ERROR_NUMBER() AS ErrorNumber, 
--Error_State return the state number of error
ERROR_STATE() AS ErrorState, 
--Error_Line return the line number at which an error occurred
ERROR_LINE() AS ErrorLine, 
--Error_Severity returns the severity of the error
ERROR_SEVERITY() AS ErrorSeverity
--RAISEERROR is used to generate an error message and initiates error processing for the session.
--RAISERROR(N'An Error Is Occur',16,3);
END CATCH  
GO


