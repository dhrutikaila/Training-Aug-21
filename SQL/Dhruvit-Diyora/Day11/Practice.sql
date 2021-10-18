CREATE PROCEDURE HumanResources.uspEmployeeTest2 @LastName NVARCHAR(50),@FirstName NVARCHAR(50) 
AS
	SET NOCOUNT ON
	SELECT FirstName,LastName,Department FROM HumanResources.vEmployeeDepartmentHistory
	WHERE FirstName=@FirstName AND LastName=@LastName
	AND EndDate IS NULL
Go

EXECUTE HumanResources.uspEmployeeTest2
EXECUTE HumanResources.uspEmployeeTest2 N'Ackerman',N'Pilar'
EXECUTE HumanResources.uspEmployeeTest2 @FirstName=N'Pilar',@LastName=N'Ackerman'


CREATE PROCEDURE prcGetEmployeeDetail (@EmpId INT, @DepName CHAR(50) OUTPUT, @ShiftId INT OUTPUT)
AS
		IF EXISTS(SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = @EmpId)
			SELECT @DepName=d.Name,@ShiftId=h.ShiftId
			FROM HumanResources.Department d JOIN HumanResources.EmployeeDepartmentHistory h
			ON d.DepartmentID=h.DepartmentID
			WHERE BusinessEntityID = @EmpId AND h.EndDate IS NULL
			RETURN 0

IF OBJECT_ID ( 'Purchasing.uspVendorAllInfo', 'P' ) IS NOT NULL   
    DROP PROCEDURE Purchasing.uspVendorAllInfo;  
CREATE PROCEDURE Purchasing.uspVendorAllInfo  
WITH EXECUTE AS CALLER  
AS  
    SET NOCOUNT ON;  
    SELECT v.Name AS Vendor, p.Name AS 'Product name',   
      v.CreditRating AS 'Rating',   
      v.ActiveFlag AS Availability  
    FROM Purchasing.Vendor v   
    INNER JOIN Purchasing.ProductVendor pv  
      ON v.BusinessEntityID = pv.BusinessEntityID   
    INNER JOIN Production.Product p  
      ON pv.ProductID = p.ProductID   
    ORDER BY v.Name ASC;  
GO  
ALTER PROCEDURE Purchasing.uspVendorAllInfo  
    @Product varchar(25)   
AS  
    SET NOCOUNT ON;  
    SELECT LEFT(v.Name, 25) AS Vendor, LEFT(p.Name, 25) AS 'Product name',   
    'Rating' = CASE v.CreditRating   
        WHEN 1 THEN 'Superior'  
        WHEN 2 THEN 'Excellent'  
        WHEN 3 THEN 'Above average'  
        WHEN 4 THEN 'Average'  
        WHEN 5 THEN 'Below average'  
        ELSE 'No rating'  
        END  
    , Availability = CASE v.ActiveFlag  
        WHEN 1 THEN 'Yes'  
        ELSE 'No'  
        END  
    FROM Purchasing.Vendor AS v   
    INNER JOIN Purchasing.ProductVendor AS pv  
      ON v.BusinessEntityID = pv.BusinessEntityID   
    INNER JOIN Production.Product AS p   
      ON pv.ProductID = p.ProductID   
    WHERE p.Name LIKE @Product  
    ORDER BY v.Name ASC;  
GO  
EXEC Purchasing.uspVendorAllInfo N'LL Crankarm';  
EXEC Purchasing.uspVendorAllInfo;

-- Passing values as constants.  
EXEC dbo.uspGetWhereUsedProductID 819, '20050225';  
GO  
-- Passing values as variables.  
DECLARE @ProductID int, @CheckDate datetime;  
SET @ProductID = 819;  
SET @CheckDate = '20050225';  
EXEC dbo.uspGetWhereUsedProductID @ProductID, @CheckDate;  
GO  
-- Try to use a function as a parameter value.  
-- This produces an error message.  
EXEC dbo.uspGetWhereUsedProductID 819,GETDATE()
GO  
-- Passing the function value as a variable.  
DECLARE @CheckDate datetime;  
SET @CheckDate = GETDATE()
EXEC dbo.uspGetWhereUsedProductID 819, @CheckDate;  
GO



GRANT EXECUTE ON OBJECT::HumanResources.uspUpdateEmployeeHireInfo  
    TO dd;  
GO 


-- Create a procedure that takes one input parameter and returns one output parameter and a return code.
CREATE PROCEDURE SampleProcedure @EmployeeIDParm INT,
         @MaxTotal INT OUTPUT
AS
-- Declare and initialize a variable to hold @@ERROR.
DECLARE @ErrorSave INT
SET @ErrorSave = 0

-- Do a SELECT using the input parameter.
SELECT FirstName, LastName, JobTitle
FROM HumanResources.vEmployee
WHERE BusinessEntityID = @EmployeeIDParm

-- Save any nonzero @@ERROR value.
IF (@@ERROR <> 0)
   SET @ErrorSave = @@ERROR

-- Set a value in the output parameter.
SELECT @MaxTotal = MAX(TotalDue)
FROM Sales.SalesOrderHeader;

IF (@@ERROR <> 0)
   SET @ErrorSave = @@ERROR

-- Returns 0 if neither SELECT statement had an error; otherwise, returns the last error.
RETURN @ErrorSave
GO


-- Declare the variables for the return code and output parameter.
DECLARE @ReturnCode INT
DECLARE @MaxTotalVariable INT

-- Execute the stored procedure and specify which variables
-- are to receive the output parameter and return code values.
EXEC @ReturnCode = SampleProcedure @EmployeeIDParm = 19,
   @MaxTotal = @MaxTotalVariable OUTPUT

-- Show the values returned.
PRINT ' '
PRINT 'Return code = ' + CAST(@ReturnCode AS CHAR(10))
PRINT 'Maximum Quantity = ' + CAST(@MaxTotalVariable AS CHAR(10))
GO

IF OBJECT_ID('Sales.uspGetEmployeeSalesYTD', 'P') IS NOT NULL  
   DROP PROCEDURE Sales.uspGetEmployeeSalesYTD;  
GO  
CREATE PROCEDURE Sales.uspGetEmployeeSalesYTD  
AS    
 
   SET NOCOUNT ON;  
   SELECT LastName, SalesYTD  
   FROM Sales.SalesPerson AS sp  
   JOIN HumanResources.vEmployee AS e ON e.BusinessEntityID = sp.BusinessEntityID  
   
RETURN  
GO  


ALTER PROCEDURE usp_GetErrorInfo  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO  
  
BEGIN TRY  
    -- Generate divide-by-zero error.  
    SELECT * FROM Sales;  
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
    EXECUTE usp_GetErrorInfo;  
END CATCH;   



Create TABLE Employee  
(  
EmpId INT identity(1,1),  
FirstName NVARCHAR(MAX) NOT NULL,  
LastName NVARCHAR(MAX) NOT NULL,  
Salary INT NOT NULL CHECK(Salary>20000),  
City NVARCHAR(MAX) NOT NULL  
)  
Update Employee set Salary=19000 Where EmpID=5  
IF @@ERROR = 547  
PRINT 'A check constraint violation occurred.'





BEGIN TRY   
Update Employee set Salary=19000 Where EmpID=5  
END TRY  
BEGIN CATCH  
PRINT @@ERROR  
SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_STATE() AS ErrorState, ERROR_MESSAGE() AS ErrorMsg,ERROR_PROCEDURE() AS ProcName,ERROR_SEVERITY() AS ErrorSeverity
END CATCH  
GO  

