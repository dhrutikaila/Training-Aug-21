USE AdventureWorks2016
GO



--CREATE SP--
CREATE PROCEDURE Person.uspPersonName
AS
BEGIN
SELECT FirstName,LastName FROM Person.Person
END

--Execute SP--
Person.uspPersonName
EXEC Person.uspPersonName
EXECUTE Person.uspPersonName

--Delete SP
DROP PROCEDURE Person.uspPersonName
------------------------------------------------------------




--CREATE SP With returning multiple result set--
CREATE PROCEDURE uspDepartmentInfo
	@ID INT
AS
BEGIN
	SET NOCOUNT ON
	SELECT Name, GroupName, DepartmentID FROM HumanResources.Department WHERE DepartmentID = @ID
	SELECT DepartmentID,ModifiedDate FROM HumanResources.Department WHERE DepartmentID = @ID
	SET NOCOUNT OFF
END
GO
--Execute SP
EXEC uspDepartmentInfo 5

--Delete SP-
DROP PROCEDURE uspDepartmentInfo

--Built IN SP--
SP_HELPTEXT uspDepartmentInfo
SP_HELP uspDepartmentInfo
SP_DEPENDS uspDepartmentInfo
SP_RENAME 'uspDepartmentInfo','uspEveryEmployeeTest'

--------------------------------------------------------


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
    AND EndDate IS NULL
	SET NOCOUNT OFF
GO  

EXEC uspGetEmployeesTest2 @LastName= 'Norred', @FirstName = 'Chris'

--Didn't show output due to ENCRYPTION
sp_helptext uspGetEmployeesTest2 

--ALTER PROCEDURE--
ALTER PROCEDURE uspGetEmployeesTest2   
    @LastName nvarchar(50),   
    @FirstName nvarchar(50) 
AS   

    SET NOCOUNT ON;  
    SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL
	SET NOCOUNT OFF
GO  

--Now Output will be Shown--
sp_helptext uspGetEmployeesTest2 
----------------------------------------------------------------



--SP With Output Parameter--

CREATE PROCEDURE prcGetEmployeeDetail @BE_ID INT, @DepName CHAR(30) OUTPUT, @ShiftID INT OUTPUT
AS
BEGIN
	IF EXISTS(SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = @BE_ID)
BEGIN
	SELECT @DepName = d.Name , @ShiftID = h.ShiftID 
	FROM HumanResources.Department AS d 
	INNER JOIN HumanResources.EmployeeDepartmentHistory AS h
	ON d.DepartmentID = h.DepartmentID
	WHERE BusinessEntityID = @BE_ID AND EndDate IS NULL
END
END
GO
--Result of Output Parameter--
DECLARE @DepName CHAR(30), @ShiftID INT 
EXEC prcGetEmployeeDetail @BE_ID = 32, @DepName = @DepName OUTPUT, @ShiftID = @ShiftID OUTPUT
SELECT @DepName AS 'DepartmentName', @ShiftID AS 'ShiftID'


--Use One Sp in Another Sp--
CREATE PROCEDURE prcDisplayEmployeeStatus @BE_ID INT
AS
BEGIN
DECLARE @DepName CHAR(30), @ShiftID INT, @ReturnValue INT
EXEC @ReturnValue = prcGetEmployeeDetail @BE_Id, @DepName OUTPUT, @ShiftID OUTPUT
IF(@ReturnValue = 0)
BEGIN
	PRINT 'Employee ID: ' + CONVERT(CHAR(10),@BE_ID)
	PRINT 'Department Name: ' + @DepName
	PRINT 'Shift ID: ' + CONVERT(CHAR(1), @ShiftID)
	SELECT JobTitle,BirthDate FROM HumanResources.Employee
	WHERE BusinessEntityID = @BE_ID
END
ELSE
	PRINT 'NO Record Found'
END
GO
--Execute SP--
EXEC prcDisplayEmployeeStatus @BE_ID = 32
----------------------------------------------------------------



--Return JSON output from Store Procedure--
CREATE PROCEDURE uspDepartmentInfoAsJson
	
AS
BEGIN
	SELECT * FROM HumanResources.Department FOR JSON PATH
END
GO

EXEC uspDepartmentInfoAsJson 