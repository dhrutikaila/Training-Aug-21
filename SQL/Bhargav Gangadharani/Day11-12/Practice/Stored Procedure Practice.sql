-- Create Procedure
Create Procedure EmpTop
As
	Select TOP 10 BusinessEntityID From HumanResources.Employee
Go

-- Execute Procedure
Execute EmpTop


-- Create Procedure
Create Procedure HumanResources.GetAllEmployees
As
    Select LastName, FirstName, JobTitle, Department
    From HumanResources.vEmployeeDepartment
Go

Select * From HumanResources.vEmployeeDepartment

Execute HumanResources.GetAllEmployees


-- Delete Procedure
Drop Procedure Emp_job


-- Alter Procedure
Alter Procedure EmpTop
As
	Select Top 20 BusinessEntityID From HumanResources.Employee
Go


-- Specifying Parameter 
Create Procedure Emp_Id @Jobtitle varchar(30) 
As
	Select BusinessEntityID from HumanResources.Employee where JobTitle = @Jobtitle
Go

Exec Emp_Id @Jobtitle = 'Design Engineer'
Exec Emp_Id 'Design Engineer'


-- Specifying Output Parameter
Create Procedure Emp_Job  @Id Int, @Jobtitle varchar(30)  Output
As 
	Set @Jobtitle = (Select Jobtitle from HumanResources.Employee where BusinessEntityID = @Id)
Go
-- Execute
Declare @OutParm varchar(30)
Execute Emp_Job @Id = 78 ,  @Jobtitle = @OutParm output
Print @OutParm


-- Returning data using Result Set
IF OBJECT_ID('Emp_Detail') IS NOT NULL  
    DROP PROCEDURE Emp_Detail
GO
Create Procedure Emp_Detail
AS    
 
   SET NOCOUNT ON  
   SELECT  e.BusinessEntityID, p.FirstName, p.LastName, e.JobTitle
   FROM Person.Person AS p  
   JOIN HumanResources.Employee AS e ON e.BusinessEntityID = p.BusinessEntityID  
   
RETURN  
GO 

Exec Emp_Detail


-- Returning data using Output Parameter
IF OBJECT_ID('Emp_Job') IS NOT NULL  
    DROP PROCEDURE Emp_Job
GO  
Create Procedure Emp_Job  @Id Int, @Jobtitle varchar(30)  Output
As 
	Set @Jobtitle = (Select Jobtitle from HumanResources.Employee where BusinessEntityID = @Id)
Go
-- Execute
Declare @OutParm varchar(30)
Execute Emp_Job @Id = 78 ,  @Jobtitle = @OutParm output
Print @OutParm


-- Returning data using Return code 
IF OBJECT_ID('Emp_Details') IS NOT NULL  
    DROP PROCEDURE Emp_Details
GO  
Create Procedure Emp_Details @Id int = null, @name varchar(30) output
AS 
	IF @Id IS NULL  
		BEGIN  
			 
			return(1)
		END 
   Else
		Begin
			IF (SELECT COUNT(*) FROM HumanResources.Employee  
			WHERE BusinessEntityID = @Id) = 0 
			
			RETURN(2) 
		 End
   SET NOCOUNT ON  
   SELECT  @name = p.FirstName
   FROM Person.Person AS p  
   JOIN HumanResources.Employee AS e ON e.BusinessEntityID = p.BusinessEntityID
   Where e.BusinessEntityID = @Id
   return(0)
GO 

-- Execute Procedure 
Declare @name varchar(30), @return_code int
Exec Emp_Details 1111 , @name = @name output 

-- Get Output with return code
Declare @return_code int, @name varchar(30)
Exec @return_code = Emp_Details 1111 ,  @name = @name output

If @return_code = 0 
	Begin
		Print 'Procedure Executed Successfully'
		Print 'Name of the Employee is : ' + @name 
	End

Else If @return_code = 2

	Print 'ERROR: Id you have specified is not valid, check it once and try again.'

Else If @return_code = 1
 
	Print 'ERROR: You must specify Id of the Employee.'
Go


-- Returning data using Cursor output parameter 
IF OBJECT_ID('Emp_Details_cursor') IS NOT NULL  
    DROP PROCEDURE Emp_Details_cursor
GO  
CREATE PROCEDURE Emp_Details_cursor   
    @EmpCursor CURSOR VARYING OUTPUT  
AS  
    SET NOCOUNT ON 
    SET @EmpCursor = CURSOR STATIC 
	FOR  
      SELECT *  
      FROM HumanResources.Employee  
    OPEN @EmpCursor  
GO


DECLARE @EmpCursor CURSOR  
EXEC Emp_Details_cursor @EmpCursor = @EmpCursor OUTPUT  
WHILE (@@FETCH_STATUS = 0)  
BEGIN
     FETCH NEXT FROM @EmpCursor 
END
CLOSE @EmpCursor
DEALLOCATE @EmpCursor
GO  


-- Return Json as output
Create  Procedure EMP_Details1 @Id int
As
	Select BusinessEntityID, JobTitle, BirthDate from HumanResources.Employee where BusinessEntityID= @ID for json path
Go

Exec EMP_Details1 1


-- Take Json as Input Parameter
Create procedure Open_Json @Emp_json Nvarchar(max)
As
	Select * from openjson ( @Emp_json )
	with(
			BusinessEntityID int '$.BusinessEntityID',
			JobTitle Varchar(30) '$.JobTitle',
			BirthDate date '$.BirthDate')
Go

Exec Open_Json '[{"BusinessEntityID":1,"JobTitle":"Chief Executive Officer","BirthDate":"1969-01-29"}]'


-- Call procedure in a procedure.
Create  Procedure EMP_Details1 @Id int
As
	Select BusinessEntityID, JobTitle, BirthDate from HumanResources.Employee where BusinessEntityID= @ID 
Go

Create Procedure EMP_Details2 @Id int
As
	Exec EMP_Details1 @Id
Go

Exec EMP_Details2 1

