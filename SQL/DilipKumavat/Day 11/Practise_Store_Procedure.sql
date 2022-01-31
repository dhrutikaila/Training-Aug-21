
USE AdventureWorks2016
GO
CREATE PROCEDURE HumanResources.uspGetEmployeesTest
	-- Add the parameters for the stored procedure here
	@LastName NVARCHAR(50), 
	@FirstName NVARCHAR(50) 
AS

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName
	SET NOCOUNT OFF
GO

EXECUTE HumanResources.uspGetEmployeesTest 
@LastName = N'Ackerman',@FirstName = N'Pilar'
GO

DROP PROCEDURE HumanResources.uspGetEmployeesTest

SELECT * FROM HumanResources.vEmployeeDepartmentHistory ORDER BY LastName

SELECT * FROM HumanResources.vEmployeeDepartmentHistory


--------------------------------------------------------------------------------




ALTER PROCEDURE prcGetEmployeeDetail 
	@BusinessId INT,
	@DepName CHAR(50) OUTPUT,
	@ShiftId INT OUTPUT
AS
BEGIN 
IF EXISTS(SELECT * FROM HumanResources.Employee WHERE BusinessEntityID=@BusinessId)
BEGIN 
	SELECT @DepName = d.Name,@ShiftId = h.ShiftID FROM HumanResources.Department d JOIN 
	HumanResources.EmployeeDepartmentHistory h ON 
	d.DepartmentID = h.DepartmentID
	WHERE BusinessEntityID=@BusinessId
	AND h.EndDate IS NULL
	RETURN 0
END
ELSE 
	RETURN 1
END


---EXEC prcGetEmployeeDetail @BusinessId = 32,@DepName = 'Production',@ShiftId = 1---

SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = 32

DECLARE @DepName CHAR(50),@ShiftId INT

EXEC prcGetEmployeeDetail 
	@BusinessId = 32,
	@DepName = @DepName OUTPUT,
	@ShiftId = @ShiftId OUTPUT

SELECT @DepName AS 'Department',@ShiftId AS 'ShiftId'

DROP PROCEDURE prcGetEmployeeDetail

SELECT * FROM HumanResources.Department 
SELECT * FROM HumanResources.EmployeeDepartmentHistory

--------------------------------------------------------------------------

ALTER PROCEDURE prcDisplayEmployeeStatus
	@BusinessId INT
AS 
BEGIN 
	DECLARE	@DepName CHAR(50),@ReturnValue INT,@ShiftId INT 
	EXEC @ReturnValue = prcGetEmployeeDetail @BusinessId, @DepName OUTPUT,@ShiftId OUTPUT
	
	IF(@ReturnValue = 0)
		BEGIN 
			PRINT 'The details of an employee with ID: ' + convert(char(10),@BusinessId)
			PRINT 'Department Name: '+@DepName
			PRINT 'Shift ID: ' + convert(char(1),@ShiftId)

			SELECT JobTitle,BirthDate FROM HumanResources.Employee
			WHERE BusinessEntityID = @BusinessId
		END
	ELSE
	BEGIN
		PRINT 'No Records found for the given employee'
	END
END
DROP PROCEDURE prcDisplayEmployeeStatus

SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = 3333
EXEC prcDisplayEmployeeStatus @BusinessId = 3333

--WITH ENCRYPTION and CREATE SP With Multiple Variable--
CREATE PROCEDURE uspGetEmployeesTest2   
    @LastName nvarchar(50),   
    @FirstName nvarchar(50) 
	WITH ENCRYPTION
AS   

    SET NOCOUNT ON;  
    SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL; 
	SET NOCOUNT OFF
GO


EXEC uspGetEmployeesTest2 @LastName= 'Norred', @FirstName = 'Chris'



-----------------------------------------------------------------
sp_helptext prcDisplayEmployeeStatus

sp_help prcDisplayEmployeeStatus

sp_depends prcDisplayEmployeeStatus



