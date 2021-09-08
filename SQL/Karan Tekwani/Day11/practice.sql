use day6_sql_file
select * from Employees where FirstName='Alexander' and LastName='Hunold'
--Create Store Procedure

create procedure practice @FirstName varchar(30)
as
select * from Employees where FirstName=@FirstName

exec practice @FirstName='Steven'

--Modify 
alter procedure practice @FirstName varchar(30),@LastName varchar(30)
as
select * from Employees where FirstName=@FirstName and LastName=@LastName

--Execute
exec practice @FirstName='Steven', @LastName='Markle'

--Delete
drop procedure practice

--Specifying Parameters
create procedure practice @FirstName varchar(30),@LastName varchar(30)
as
select * from Employees where FirstName=@FirstName and LastName=@LastName

exec practice @FirstName='Alexander', @LastName='Hunold'

--Specifying Parameters Output
create procedure practice @FirstName varchar(30),@LastName varchar(30), @EmployeeId int OUTPUT
as
set @EmployeeId=(select EmployeeId from Employees where FirstName=@FirstName and LastName=@LastName)


declare @EmployeeId int 
exec practice @FirstName='Alexander', @LastName='Hunold', @EmployeeId= @EmployeeId output
print @EmployeeId

--Grant Permission
create login admin with password='12345678', default_database=day6_sql_file

create user admin for login admin

grant execute on practice to admin

execute as user='admin'
exec practice @FirstName='Alexander', @LastName='Hunold'

drop procedure practice
revert

--Return Data using OUTPUT Parameter
GO
create procedure Salary @EmployeeID int,@Salary money output
as
set NOCOUNT ON;
select @Salary=Salary from Employees Where EmployeeID=@EmployeeID
RETURN
GO

declare @Salary money
EXEC Salary @EmployeeID=100,@Salary=@Salary output
print @Salary

drop procedure Salary

--Return Data using Cursor Data Type in OUTPUT Parameter
GO
create procedure LocationCursor @LocationID CURSOR VARYING OUTPUT 
as
set NOCOUNT ON;
set @LocationID= CURSOR FORWARD_ONLY STATIC FOR
			select * from Locations;
			open @LocationID;
RETURN
GO
drop procedure LocationCursor

declare @MyCursor CURSOR
EXEC LocationCursor @LocationID=@MyCursor OUTPUT
WHILE(@@FETCH_STATUS=0)
BEGIN
	FETCH NEXT FROM @MyCursor
END
CLOSE @MyCursor
DEALLOCATE @MyCursor

select * from Locations
select * from Employees

--Return Data using Return Code
GO
Create Procedure EmployeeGetData @EmployeeID int=NULL, @Salary MONEY OUTPUT
AS
IF @EmployeeID IS NULL
	BEGIN
		PRINT 'ERROR: You must specify a EmployeeID.'
		RETURN(1)
	END
ELSE
	--Check the Entered value is Valid
	IF (SELECT COUNT(*) FROM Employees WHERE EmployeeID=@EmployeeID)=0
	RETURN(2)

--Get the detalis for the entered EmployeeID
select @Salary=Salary from Employees where EmployeeID=@EmployeeID

--Check for sql error
IF @@ERROR!=0
	RETURN(3)
ELSE
	RETURN(0)
GO
-----Run the stored procedure without input value.
GO
DECLARE @SALARY MONEY,@Return_Code int,@ID int;
set @ID=10
EXEC @Return_Code= EmployeeGetData @EmployeeID=@ID, @Salary=@SALARY output

IF @Return_Code=0
BEGIN  
   PRINT 'Procedure executed successfully'  
   -- Display the value returned by the procedure.  
   PRINT 'Salary of the employee with EmployeeID='+CONVERT(varchar(10) ,@ID)+' is '+CONVERT( varchar(10),@SALARY)
END  
ELSE IF @Return_Code = 1  
   PRINT 'ERROR: You must specify a EmployeeID.'  
ELSE IF @Return_Code = 2   
   PRINT 'ERROR: You must enter a valid EmployeeID.'  
ELSE IF @Return_Code = 3  
   PRINT 'ERROR: An error occurred getting Salary value.'  
ELSE IF @Return_Code = 4  
   PRINT 'ERROR: No sales recorded for this employee.'     
GO  
  

-- Return Json as output
Create  Procedure EMP_Details @Id int
As
    Select EmployeeID, FirstName,LastName from Employees where EmployeeID=@Id for json path
Go


Exec EMP_Details 100

-- Take Json as Input Parameter
create procedure Open_Json @Emp_json Nvarchar(max)
As
    Select * from openjson ( @Emp_json )
    with(
            EmployeeID int '$.EmployeeID',
            FirstName Varchar(30) '$.FirstName',
            LastName Varchar(30) '$.LastName')
Go

 

Exec Open_Json '[{"EmployeeID":100,"FirstName":"Steven","LastName":"King"}]'
 
 
-- Call procedure in a procedure.
Create  Procedure EMP_Details1 @Id int
As
    Select EmployeeID, FirstName, LastName from Employees where EmployeeID= @ID 
Go

Create Procedure EMP_Details2 @Id int
As
    Exec EMP_Details1 @Id
Go

Exec EMP_Details2 100


--Recompile
EXEC sp_recompile 'EmployeeGetData';   

--View Definition
--1st Method
EXEC sp_helptext EmployeeGetData

--2nd Method
Select OBJECT_DEFINITION (OBJECT_ID(N'EmployeeGetData'))

--3rd Method
SELECT [definition]
FROM sys.sql_modules  
WHERE object_id = (OBJECT_ID(N'dbo.EmployeeGetData'));
