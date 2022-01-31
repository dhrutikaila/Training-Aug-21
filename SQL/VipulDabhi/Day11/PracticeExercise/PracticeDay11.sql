
--Store Procedure

CREATE PROCEDURE SelectAllEmployee
AS
SELECT * FROM Employees

EXEC SelectAllEmployee

--Store Procedure With One parameter

CREATE PROCEDURE SalaryOfEmployee @Salary INT
AS
SELECT * FROM Employees WHERE Salary > @Salary

EXEC SalaryOfEmployee @Salary = 10000

--Stored Procedure With Multiple Parameters
ALTER PROCEDURE MultipleParaExamp @Salary INT,@DepartmentID INT,@EmployeeID INT OUTPUT
AS
BEGIN
SELECT @EmployeeID=EmployeeID FROM Employees WHERE Salary > @Salary AND DepartmentID = @DepartmentID
END

DECLARE @EmployeeID INT
EXEC MultipleParaExamp 5000 ,60,@EmployeeID out
SELECT @EmployeeID

--CREATE STORE PROCEDURE

USE AdventureWorks2012; 

IF OBJECT_ID ( 'Purchasing.uspVendorAllInfo', 'P' ) IS NOT NULL   
    DROP PROCEDURE Purchasing.uspVendorAllInfo;  
GO  
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

--UPDATE STORE PROCEDURE

USE AdventureWorks2012; 

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
--EXECUTE THE MODIFIED STORE PROCEDURE
EXEC Purchasing.uspVendorAllInfo N'LL Crankarm';  
GO  



--WITH ENCRYPTION

DROP PROCEDURE MultipleParaExamp1 

USE SQLtask

CREATE PROCEDURE MultipleParaExamp1 @Salary INT,@DepartmentID INT
WITH ENCRYPTION
AS
SELECT * FROM Employees WHERE Salary > @Salary AND DepartmentID = @DepartmentID FOR JSON AUTO

EXEC MultipleParaExamp1 @Salary =5000 ,@DepartmentID = 60 

sp_helptext MultipleParaExamp1


--Return JSON output from Store Procedure

USE AdventureWorks2012; 
GO 
IF OBJECT_ID('Sales.uspGetEmployeeSalesYTD', 'P') IS NOT NULL 
DROP PROCEDURE Sales.uspGetEmployeeSalesYTD;
 GO
 CREATE PROCEDURE Sales.uspGetEmployeeSalesYTD 
WITH ENCRYPTION
AS
 SET NOCOUNT ON;
 SELECT LastName, SalesYTD FROM Sales.SalesPerson AS sp JOIN HumanResources.vEmployee AS e
 ON e.BusinessEntityID = sp.BusinessEntityID FOR JSON AUTO 
RETURN
GO

EXEC  Sales.uspGetEmployeeSalesYTD


--Enter Json Value

ALTER PROCEDURE JsonInfo @EmployeeDetails NVARCHAR(MAX)
AS
BEGIN
	INSERT INTO EMP
	SELECT EmployeeID,FirstName,Salary FROM OPENJSON(@EmployeeDetails)
	WITH(
		EmployeeID INT '$.EmployeeID',
		FirstName VARCHAR(100) '$.FirstName',
		Salary MONEY '$.Salary'
	)
END

DECLARE @EmployeeDetails NVARCHAR(MAX) = N'[{"EmployeeID":100,"FirstName":"Steven","LastName":"King","Email":"not available","PhoneNumber":"515.123.4567","HireDate":"1987-06-17","JobId":"AD_PRES","Salary":32600.00,"CommissionPct":0.10,"ManagerID":0,"DepartmentID":90},{"EmployeeID":101,"FirstName":"Neena","LastName":"Kochhar","Email":"not available","PhoneNumber":"515.123.4568","HireDate":"1987-06-18","JobId":"AD_VP","Salary":19550.00,"CommissionPct":0.10,"ManagerID":100,"DepartmentID":90},{"EmployeeID":102,"FirstName":"Lex","LastName":"De Haan","Email":"not available","PhoneNumber":"515.123.4569","HireDate":"1987-06-19","JobId":"AD_VP","Salary":19550.00,"CommissionPct":0.10,"ManagerID":100,"DepartmentID":90},{"EmployeeID":103,"FirstName":"Alexander","LastName":"Hunold","Email":"not available","PhoneNumber":"590.423.4567","HireDate":"1987-06-20","JobId":"IT_PROG","Salary":9000.00,"CommissionPct":0.10,"ManagerID":102,"DepartmentID":60},{"EmployeeID":104,"FirstName":"Bruce","LastName":"Ernst","Email":"not available","PhoneNumber":"590.423.4568","HireDate":"1987-06-21","JobId":"IT_PROG","Salary":6000.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60},{"EmployeeID":105,"FirstName":"David","LastName":"Austin","Email":"not available","PhoneNumber":"590.423.4569","HireDate":"1987-06-22","JobId":"IT_PROG","Salary":8000.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60},{"EmployeeID":106,"FirstName":"Valli","LastName":"Pataballa","Email":"not available","PhoneNumber":"590.423.4560","HireDate":"1987-06-23","JobId":"IT_PROG","Salary":4800.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60},{"EmployeeID":107,"FirstName":"Diana","LastName":"Lorentz","Email":"not available","PhoneNumber":"590.423.5567","HireDate":"1987-06-24","JobId":"IT_PROG","Salary":4200.00,"CommissionPct":0.10,"ManagerID":103,"DepartmentID":60},{"EmployeeID":108,"FirstName":"Nancy","LastName":"Greenberg","Email":"not available","PhoneNumber":"515.999.4569","HireDate":"1987-06-25","JobId":"FI_MGR","Salary":12000.00,"CommissionPct":0.10,"ManagerID":101,"DepartmentID":60}]'
EXEC JsonInfo @EmployeeDetails
SELECT * FROM EMP

SELECT * FROM Employees FOR JSON PATH 
DROP TABLE EMP
CREATE TABLE EMP
(
	EmployeeID INT,
	FirstName VARCHAR(100),
	Salary MONEY
)


--Return ,Multiple result set

CREATE PROCEDURE MultipleResultSet @Salary INT,@DepartmentID INT
AS
SELECT * FROM Employees WHERE Salary > @Salary
SELECT EmployeeID,Firstname,Salary,DepartmentID FROM Employees WHERE DepartmentID = @DepartmentID

EXEC MultipleResultSet  10000,60



--Call a Procedure From Another procedure

CREATE PROCEDURE usp_Errordetails  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO  



ALTER PROCEDURE uspErrorHandling
AS 

	BEGIN TRY 
			
			EXEC MultipleResultSet

	END TRY

	BEGIN CATCH

			EXEC usp_Errordetails

	END CATCH

EXEC  uspErrorHandling