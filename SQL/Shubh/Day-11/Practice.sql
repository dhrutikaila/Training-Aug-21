--1. 
CREATE PROCEDURE Empl
@LastName NVARCHAR(50),
@FirstName NVARCHAR(50) 
AS
	SELECT FirstName,LastName,DepartmentID FROM Employees
	WHERE FirstName=@FirstName AND LastName=@LastName
	AND Salary > 6486
Go

EXECUTE Empl N'King',N'Steven'
EXECUTE Empl @FirstName=N'Bruce',@LastName=N'Ernst'
GO

--2.
CREATE PROCEDURE Empl2 (@EmpId INT, @DepName CHAR(50) OUTPUT, @PromotionDate DATE OUTPUT)
AS
		IF EXISTS(SELECT * FROM Employees WHERE EmployeeID = @EmpId)
			SELECT @DepName=D.DepartmentName, @PromotionDate=J.EndDate
			FROM Departments D JOIN JobHistory J
			ON D.ManagerID=J.EmployeeID
			WHERE EmployeeID = @EmpId
		ELSE RETURN 0
GO
EXEC Empl2 1,'IT','2022-09-06'
GO


--3. Create a procedure that takes one input parameter and returns one output parameter and a return code.
CREATE PROCEDURE Test 
	@EmployeeID INT,
    @MaxTotal INT OUTPUT
AS
DECLARE @ErrorSave INT
SET @ErrorSave = 0

-- Do a SELECT using the input parameter.
SELECT FirstName, LastName, JobId
FROM Employees
WHERE EmployeeID = @EmployeeID

-- Save any nonzero @@ERROR value.
IF (@@ERROR <> 0)
   SET @ErrorSave = @@ERROR

-- Set a value in the output parameter.
SELECT @MaxTotal = MAX(Salary)
FROM Employees

IF (@@ERROR <> 0)
   SET @ErrorSave = @@ERROR

-- Returns 0 if neither SELECT statement had an error; otherwise, returns the last error.
RETURN @ErrorSave
GO
EXEC Test 100,900000

-- Declare the variables for the return code and output parameter.
DECLARE @ReturnCode INT
DECLARE @MaxTotalVariable INT

-- Execute the stored procedure and specify which variables
-- are to receive the output parameter and return code values.
EXEC @ReturnCode = Test @EmployeeID= 101,
   @MaxTotal = @MaxTotalVariable OUTPUT

-- Show the values returned.
PRINT ' '
PRINT 'Return code = ' + CAST(@ReturnCode AS CHAR(10))
PRINT 'Maximum Quantity = ' + CAST(@MaxTotalVariable AS CHAR(10))
GO

IF OBJECT_ID('Test', 'P') IS NOT NULL  
   DROP PROCEDURE Test
GO  
CREATE PROCEDURE Test
AS    
   SET NOCOUNT ON;  
   SELECT LastName, DepartmentName
   FROM Employees E JOIN Departments D ON E.DepartmentID = D.DepartmentID
   RETURN  
GO