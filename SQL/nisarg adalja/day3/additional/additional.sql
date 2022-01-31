
/* System Functions */

/* $PARTITION */
/* Returns the partition number INTO which a set of partitioning column values would be mapped for any specified partition function in SQL Server.*/
/*
CREATE PARTITION FUNCTION RangePF2 ( INT )  
AS RANGE FOR VALUES (10, 100, 1000) ;  */

SELECT $PARTITION.RangePF2 (10); 
SELECT $PARTITION.RangePF2 (0);
SELECT $PARTITION.RangePF2 (5);
SELECT $PARTITION.RangePF2 (9);
SELECT $PARTITION.RangePF2 (11);  
SELECT $PARTITION.RangePF2 (40);  
SELECT $PARTITION.RangePF2 (50);
SELECT $PARTITION.RangePF2 (70);
SELECT $PARTITION.RangePF2 (90);
SELECT $PARTITION.RangePF2 (100);  

/* ERROR PROCEDURE */

/* This function returns the name of the stored procedure or trigger where an error occurs, if that error caused the CATCH block of a TRY...CATCH construct to execute. */

-- Verify that the stored procedure does not already exist.

IF OBJECT_ID ( 'usp_ExampleProc', 'P' ) IS NOT NULL   
    DROP PROCEDURE usp_ExampleProc;  
GO  
  
-- CREATE a stored procedure that   
-- generates a divide-by-zero error.  
CREATE PROCEDURE usp_ExampleProc  
AS  
    SELECT 1/0;  
GO  
  
BEGIN TRY  
    -- Execute the stored procedure inside the TRY block.  
    EXECUTE usp_ExampleProc;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_PROCEDURE() AS ErrorProcedure;  
END CATCH;  
GO  

-- Verify that the stored procedure does not already exist.  
IF OBJECT_ID ( 'usp_ExampleProc', 'P' ) IS NOT NULL   
    DROP PROCEDURE usp_ExampleProc;  
GO  
  
-- CREATE a stored procedure that   
-- generates a divide-by-zero error.  
CREATE PROCEDURE usp_ExampleProc  
AS  
    SELECT 1/0;  
GO  
  
BEGIN TRY  
    -- Execute the stored procedure inside the TRY block.  
    EXECUTE usp_ExampleProc;  
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber,  
        ERROR_SEVERITY() AS ErrorSeverity,  
        ERROR_STATE() AS ErrorState,  
        ERROR_PROCEDURE() AS ErrorProcedure,  
        ERROR_MESSAGE() AS ErrorMessage,  
        ERROR_LINE() AS ErrorLine;  
        END CATCH;  
GO

/* @@ERROR */
/* dout */
/* Using @@ERROR to detect a specific error*/

UPDATE EmployeePayHistory  
    SET PayFrequency = 4  
    WHERE BusinessEntityID = 1;  
IF @@ERROR = 547
    BEGIN
    PRINT N'A check CONSTRAINT violation occurred.';
    END
GO  

/* Using @@ERROR to conditionally exit a procedure */
/* dout */
-- Drop the procedure if it already exists.  
IF OBJECT_ID(N'HumanResources.usp_DeleteCandidate', N'P') IS NOT NULL  
    DROP PROCEDURE HumanResources.usp_DeleteCandidate;  
GO  
-- CREATE the procedure.  
CREATE PROCEDURE HumanResources.usp_DeleteCandidate   
    (  
    @CandidateID INT  
    )  
AS  
-- Execute the DELETE statement.  
DELETE FROM HumanResources.JobCandidate  
    WHERE JobCandidateID = @CandidateID;  
-- Test the error value.  
IF @@ERROR <> 0   
    BEGIN  
        -- Return 99 to the calling program to indicate failure.  
        PRINT N'An error occurred deleting the candidate information.';  
        RETURN 99;  
    END  
ELSE  
    BEGIN  
        -- Return 0 to the calling program to indicate success.  
        PRINT N'The job candidate has been deleted.';  
        RETURN 0;  
    END;  
GO  

/* Binary Checksum */
/* Returns the binary checksum value computed over a row of a TABLE or over a list of expressions. */

CREATE TABLE myTABLE (column1 INT, column2 VARCHAR(256));  
 
INSERT INTO myTABLE VALUES (1, 'test');  
  
SELECT BINARY_CHECKSUM(*) FROM myTABLE;  
  
UPDATE myTABLE set column2 = 'TEST';  
  
SELECT BINARY_CHECKSUM(*) FROM myTABLE;  
  
 /* Host Id */
 /* Returns the workstation identification number. The workstation identification number is the process ID (PID) of the application on the client computer that is connecting to SQL Server. */

 CREATE TABLE Orders  
   (OrderID     INT       PRIMARY KEY,    
    TerminalID  CHAR(8)   NOT NULL DEFAULT HOST_ID(),  
    OrderDate   DATETIME  NOT NULL,  
    ShipDate    DATETIME  NULL); 

/* CheckSum() */
/* The CHECKSUM function returns the checksum value computed over a TABLE row, or over an expression list. Use CHECKSUM to build hash indexes. */

/* Checksum ignores negative signature in numeric string */
/* dout */
SELECT CHECKSUM(N'2'), CHECKSUM(N'-2');
SELECT CHECKSUM(N'1'), CHECKSUM(N'-1');

ALTER TABLE Employees  
ADD cs_ename AS CHECKSUM(FirstName);  
GO  
CREATE INDEX Pname_index ON Employees (cs_ename);  
GO  
SELECT * FROM Employees




