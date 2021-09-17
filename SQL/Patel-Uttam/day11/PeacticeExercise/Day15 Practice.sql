
USE [Day15 (USP)]
GO

-- Practice Exercise

/*
	What is Store Procedure
	Built in Store Procedure
	Creating Store Procedure with input and output parameter
	Executing Store Procedure
	Returning multiple resultset
	Return JSON output from Store Procedure
	Use the SET NOCOUNT ON
	WITH ENCRYPTION
	Exception Handling
	Using Try Catch
*/


-- Store Procedure / Stored Procedure : Store Procedure is bunch of SQL statement stored or saved in database.
								--		Main benefit of Store procedure is once we create Store Procedure then we can execute from within database environment.
								--		Store procedure accept input parameters and return multiple values in output parameters to the calling program.
								--		return status value to the calling program to indicate status.
								
								-- Benefits 
									-- Reduce network traffic
									-- Security
									-- Reduce the number of time we have to write simillar code.
									-- it improve execute , because when procedure compile first then procedure create one execution plan that reuse everytime procedure execute.



-- Buit-in Procedure : 
--///////////////////////////////////////////////////////////////////

-- Sp_depends <Object Name> : display the procedure , function etc.. depend on object.
-- Sp_tables <DataBase> : return list of tables from database.
-- Sp_helptext <Object> : dispaly the definition script of that object for creation.
-- Sp_help <Object> : display the information of database object like properties.

--
sp_help Employees

--
sp_helptext usp1

--
USE [Day16 (Function)]
sp_helptext nth_salary_employee
USE [Day15 (USP)]

--
EXEC dbo.sp_tables

--
sp_depends Employees

sp_depends usp_ass_5
--///////////////////////////////////////////////////////////////////


-- Creating Store Procedure with input and output parameter 

--1 without parameter
--///////////////////////////////////////////////////////////////////

-- store procedure to select all from Employees	
	CREATE PROC usp1
	AS
	SET NOCOUNT ON;
	SELECT * FROM Employees 
	GO

	usp1	--(executing store procedure)
	GO
	--DROP PROCEDURE usp1
	--GO
--///////////////////////////////////////////////////////////////////




--2 with input parameter
--///////////////////////////////////////////////////////////////////

	-- store procedure to select FullName of give name Employee from Employees
	CREATE PROCEDURE usp2 
	
	@name varchar(20) 

	AS
	SET NOCOUNT ON;
	SELECT (FirstName + ' ' + LastName) as'FullName' FROM Employees WHERE FirstName = @name
	GO 

--///////////////////////////////////////////////////////////////////


--3 with output parameter

--///////////////////////////////////////////////////////////////////

	-- find number of department under ManagerID = 0
	ALTER PROC usp3 
	@id int,
	@Dept int OUTPUT 

	AS
	BEGIN
	SELECT @Dept = COUNT(DepartmentName) FROM Departments WHERE ManagerID = @id
	END
	GO


--///////////////////////////////////////////////////////////////////




--Executing Store Procedure : EXEC / EXECUTE is use to execute Store Procedure , procedure without parameter can directly execute only by name of store procedure.
--///////////////////////////////////////////////////////////////////

	-- execution of usp1
	usp1
	GO

	
	-- execution of usp2 method-1
	usp2  @name = 'David' -- Executing procedure
	GO

	-- execution of usp2 method-2
	EXEC usp2  @name = 'David' -- Executing procedure
	GO


	-- execute of usp3 method-1 
	DECLARE @numdept int		
	EXECUTE usp3 0 , @numdept OUTPUT
	PRINT @numdept
	GO

	-- execute of usp3 method-2
	DECLARE @numdept int		
	EXECUTE usp3 @Dept = @numdept OUTPUT , @id=0
	PRINT @numdept
	GO


--///////////////////////////////////////////////////////////////////




-- case : what to do if we don't want to pass input parameter at execution time.
--///////////////////////////////////////////////////////////////////

	ALTER PROCEDURE usp9 
	@name varchar(20) = '',
	@id int = NULL,
	@dept int = NULL
	AS
	SET NOCOUNT ON;
	 SELECT (FirstName + ' ' + LastName) as'FullName' FROM Employees WHERE FirstName = @name OR EmployeeID = @id OR DepartmentID = @dept
	GO 
	
	--insert
	EXEC usp9 @name = 'Steven' 
	GO
--///////////////////////////////////////////////////////////////////





-- Returning multiple resultset : 
--///////////////////////////////////////////////////////////////////
	-- procedure to return multiple output parameter

	-- Author : Uttam    Scripting Date .2021-09-07
	
	ALTER PROC usp8
	@name varchar(10) OUTPUT,
	@dept varchar(10) OUTPUT,
	@deptid int OUTPUT,
	@empid int = NULL
	AS
	BEGIN
		SELECT @name = CONCAT(FirstName,' ',LastName) , @deptid = DepartmentID FROM Employees WHERE EmployeeID = @empid
		SELECT @dept = DepartmentName FROM Departments WHERE DepartmentID = (SELECT DepartmentID FROM Employees WHERE EmployeeID = @empid)
	END
	GO

	-- Execution (Execute usp8  < 1.[variable_name1] OUT , 2.[variable_name2] OUT , 3.[variable_name3] OUT ,  [Enter_EmployeeID] (input parameter))
	DECLARE @empname varchar(10),@deptname varchar(10), @deptid int
	EXEC usp8  @empname OUT , @deptname OUT , @deptid OUT ,103
	PRINT 'Name :'+' ' +@empname
	PRINT 'Department :'+' '+ @deptname
	PRINT 'DeptID :'+' '+RIGHT(STR(@deptid),3)
	GO
--///////////////////////////////////////////////////////////////////




-- Return JSON output from Store Procedure 
--///////////////////////////////////////////////////////////////////
	GO
	
	-- procedure for store json object in output variable .
	ALTER PROCEDURE usp4 
	@jsonstore nvarchar(MAX) OUTPUT
	AS
	BEGIN
		SET @jsonstore = (SELECT FirstName , LastName , Salary FROM Employees FOR JSON PATH)
	END
	GO

	-- EXECUTE (Execute usp4 )
	DECLARE @out nvarchar(MAX)
	EXECUTE usp4 @out OUTPUT
	PRINT @out 
	SELECT * FROM OPENJSON(@out)
	WITH
	(FirstName varchar(25) '$.FirstName',LastName varchar(25) '$.LastName',Salary float '$.Salary')
	GO

--///////////////////////////////////////////////////////////////////





-- store procedure within store procedure  (to update incentives for employee if salary is hike.)
--///////////////////////////////////////////////////////////////////

CREATE PROC usp11
@id int,
@increment int
AS
BEGIN
	IF (SELECT EMPLOYEE_REF_ID FROM Incentives WHERE EMPLOYEE_REF_ID = @id ) > 0
	BEGIN
		UPDATE Incentives SET  INCENTIVE_AMOUNT = (INCENTIVE_AMOUNT + @increment*0.10) WHERE EMPLOYEE_REF_ID = @id

	END	
	ELSE
	BEGIN
	PRINT 'Not details for Employee'
	END
END
GO

CREATE PROC  usp10
@id int,
@increment int
AS
BEGIN 
	UPDATE Employee SET SALARY = SALARY+@increment WHERE EMPLOYEE_ID = @id 
	EXEC usp11 @id , @increment
END
GO

-- Execute procedure
	EXEC usp10 6 ,10000

	--SELECT * FROM Employee
	--SELECT * FROM Incentives

--///////////////////////////////////////////////////////////////////





-- Use the SET NOCOUNT ON : SET NOCOUNT ON prevent sending details message to client , that improve execution time. 
--///////////////////////////////////////////////////////////////////

	ALTER PROCEDURE usp5 

	AS
	SET NOCOUNT ON;
	BEGIN
		SELECT FirstName , LastName , Salary FROM Employees
	END
	GO

	usp5 
	GO

--///////////////////////////////////////////////////////////////////





-- WITH ENCRYPTION : 'WITH ENCRYPTION' use to encrypt or prevent accessing 'generate script' of PROCEDURE.
				--    Nobody access it.
--///////////////////////////////////////////////////////////////////

	CREATE PROCEDURE usp6 WITH ENCRYPTION
	AS
	BEGIN
	SELECT * FROM Departments
	END
	GO

	sp_helptext usp6
	GO
--///////////////////////////////////////////////////////////////////




-- Recompile : 'RECOMPILE' use to recompile the procedure again at time of execution. (mostly procedure not compile every time.)
			-- 'RECOMPILE' required when significant changes done in procedure.
--///////////////////////////////////////////////////////////////////

	ALTER PROCEDURE usp7 
	@id int OUTPUT,
	@name varchar(20)
	AS
	BEGIN
		SELECT @id=MIN(Salary) FROM Employees WHERE FirstName = @name
	END
	GO

	-- insert
	
	usp7 -- (With recolmpile at create Procedure) 
	GO

	--OR
	DECLARE @id1 int
	EXECUTE usp7 @id1 OUTPUT ,'David'
	PRINT @id1
	GO
	--OR

	EXEC sp_recompile 'usp7'
	DECLARE @id int
	EXEC usp7 @id=@id OUT , @name='Steven'
	PRINT @id
	GO
--///////////////////////////////////////////////////////////////////




--Exception Handling
--///////////////////////////////////////////////////////////////////

-- Exception : Exception is error occurs at execution time of statement.
			-- Exception is mostly symmentic error rather then syntax error.
			-- Exception disturbed execution flow of Statements.

-- Exception Handling is use to handle or to prevent occurance of exception

-- two way to handle exception
	-- TRY / CATCH BLOCK
	-- RAISEERROR


	--TRY / CATCH
	------------------------------------------------------------------------
	--1
	 BEGIN TRY
	SELECT EmployeeID FROM Employees WHERE EmployeeID = 'abc'
	 END TRY

	 BEGIN CATCH
	SELECT 'Error massage is : ' + ERROR_MESSAGE() 
	 END CATCH

	 --2
	 BEGIN TRY
	SELECT DepartmentID FROM Employees WHERE EmployeeID = 100
		BEGIN TRY
			UPDATE Departments SET LocationID = 'zbc'
		END TRY
		BEGIN CATCH

			SELECT 'Error Line1 is : ' + ERROR_LINE()  
			SELECT 'Error Severity is : ' + ERROR_SEVERITY()

		END CATCH
	 END TRY

	 BEGIN CATCH
	SELECT 'Error massage1 is : ' + ERROR_MESSAGE()
	SELECT 'Error Number is : ' + ERROR_NUMBER()
	 END CATCH


	--3 
	 BEGIN TRY
	DECLARE @var int
	SET @var = '2021-09-09'

	 BEGIN CATCH
	SELECT 'Error massage is : ' + ERROR_MESSAGE() AS 'Message', @@ERROR AS '@@Message' , ERROR_NUMBER() AS 'number', ERROR_STATE() AS 'state','Error massage is : ' + ERROR_PROCEDURE() AS 'procedure'
	 END CATCH


	--4
	 BEGIN TRY
	DECLARE @var2 int
	SET @var2 = 500
	PRINT 500/0
	 END TRY

	 BEGIN CATCH
	SELECT ERROR_SEVERITY() AS 'SEVERITY',ERROR_STATE() AS 'STATE' 
	 END CATCH

	------------------------------------------------------------------------


	-- RAISEERROR
	------------------------------------------------------------------------
	 BEGIN TRY
	DECLARE @var3 int
	SET @var3 = 500
	PRINT 500/0
	 END TRY

	 BEGIN CATCH
	DECLARE @raisetext varchar(50)
	DECLARE @raiseseverity int
	DECLARE @raisestate int
	
	SET @raisetext = 'divide by zero not allow'
	SET @raiseseverity = 4
	SET @raisestate = 3

	RAISERROR (@raisetext,@raiseseverity,@raisestate) 
	 
	 END CATCH 
	

	------------------------------------------------------------------------	
--///////////////////////////////////////////////////////////////////
