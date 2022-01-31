USE Practice

--Built in Store Procedure

EXEC sp_help
EXEC sp_help 'Demo4'
EXEC sp_tables
EXEC sp_helptext 'DemoJsonOutput'
EXEC sp_depends 'DemoJsonOutput'

--Creating Store Procedure with input and output parameter

/*
SP_NAME : Procedure1
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	DECLARE @AgeReturned INT 
	EXEC Procedure1 'Name', @AgeReturned OUTPUT
	SELECT @AgeReturned
*/

CREATE PROCEDURE Procedure1 @Name VARCHAR(30),@Age INT OUT
	AS
		SELECT * FROM Demo4 WHERE Name=@Name
		SELECT @Age=Age FROM Demo4 WHERE Name=@Name
	RETURN 0

--Executing Store Procedure

DECLARE @AgeReturned INT 
EXEC Procedure1'John' , @AgeReturned OUTPUT
SELECT @AgeReturned

--Returning multiple resultset

/*
SP_NAME : MultipleResults
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	DECLARE @NameOut VARCHAR(50),@AgeOut SMALLINT
	EXEC MultipleResults Id,@NameOut OUTPUT,@AgeOut OUTPUT
	SELECT @NameOut AS Name,@AgeOut AS Age
*/

CREATE PROCEDURE MultipleResults @Id INT,@Name VARCHAR(50) OUTPUT,@Age SMALLINT OUTPUT
	AS
		SELECT @Name=Name,@Age=Age FROM Demo4 WHERE Id=@Id
		 
DECLARE @NameOut VARCHAR(50),@AgeOut SMALLINT
EXEC MultipleResults 1,@NameOut OUTPUT,@AgeOut OUTPUT
SELECT @NameOut AS Name,@AgeOut AS Age

/*
SP_NAME : MultipleResults2
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC MultipleResults2
*/

CREATE PROCEDURE MultipleResults2
	AS
		SELECT * FROM Demo2
		SELECT * FROM Demo4

EXEC MultipleResults2

--Return JSON output from Store Procedure

/*
SP_NAME : DemoJsonOutput
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	DECLARE @jsoninfo NVARCHAR(MAX)
	EXEC DemoJsonOutput @jsoninfo OUT
	SELECT @jsoninfo
*/


CREATE PROCEDURE DemoJsonOutput @jsondata NVARCHAR(MAX) OUT
	AS
		SET NOCOUNT ON
		SELECT @jsondata = (SELECT * FROM Demo4 FOR JSON PATH,INCLUDE_NULL_VALUES)
		SET NOCOUNT OFF
	RETURN 0

DECLARE @jsoninfo NVARCHAR(MAX)
EXEC DemoJsonOutput @jsoninfo OUT
SELECT @jsoninfo

--Use the SET NOCOUNT ON 

/*
SP_NAME : Procedure2
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXECUTE Procedure2 'Name'
*/


CREATE PROCEDURE Procedure2 @Name VARCHAR(30)
	AS
		SET NOCOUNT ON
		SELECT * FROM Demo4 WHERE Name=@Name
		SET NOCOUNT OFF

EXECUTE Procedure2 'John'

--WITH ENCRYPTION

/*
SP_NAME : Encryptedproc
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC Encryptedproc 'Name'
*/


CREATE PROCEDURE Encryptedproc @Name VARCHAR(30)
	WITH ENCRYPTION
		AS
			SET NOCOUNT ON
			SELECT * FROM Demo4 WHERE Name=@Name
			SET NOCOUNT OFF

EXEC Encryptedproc 'John'

sp_helptext Encryptedproc

--Exception Handling

--ALTER TABLE Demo4 ADD CONSTRAINT Demo4_Ade_Chk CHECK (Age >18)

/*
SP_NAME : InsertProc
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC InsertProc 'Name','City','State',Age

	NOTE : Exception may occure while executing this procedure.
		   Please check constraints before executing this procedure.
*/

CREATE PROCEDURE InsertProc @Name VARCHAR(50),@City VARCHAR(30),
@State VARCHAR(30),@Age SMALLINT
	AS
		INSERT INTO Demo4 (Name,City,State,Age) VALUES (@Name,@City,@State,@Age)

BEGIN TRY

	EXEC InsertProc 'testname','ahmedabad','gujarat',15

END TRY
BEGIN CATCH
	SELECT ERROR_LINE() AS ErrorLine
	SELECT ERROR_MESSAGE() AS ErrorMessage
	SELECT ERROR_NUMBER() AS ErrorNumber
	SELECT ERROR_PROCEDURE() AS ErrorProcedure
	SELECT ERROR_SEVERITY() AS ErrorSeverity
	SELECT ERROR_STATE() AS ErrorState
	--SELECT RAISEERROR('Age Should be greate than 18',ERROR_SEVERITY(),ERROR_STATE())
	--SELECT RAISEERROR('Age Should be greate than 18',15,0)
END CATCH


BEGIN TRY
	EXEC InsertProc 'testname','ahmedabad','gujarat',22
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage
END CATCH

--Using Try Catch

/*
SP_NAME : DemoProc
AUTHOR : Mehul Jambukiya   CREATED ON : 06/09/2021
EXECUTION : 
	EXEC DemoProc 

	NOTE : Exception may occure while executing this procedure.
*/

CREATE PROCEDURE DemoProc  
AS  
    SELECT 1/0
  
BEGIN TRY  
    EXEC DemoProc 
END TRY  
BEGIN CATCH  

    SELECT ERROR_MESSAGE() AS ErrorMessage;  

END CATCH