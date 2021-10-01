--what is stored procedure
--A stored procedure in SQL Server is a group of one or more Transact-SQL statements or a reference to a Microsoft .NET Framework common runtime language (CLR) method.

--or

--a privously written SQL statment which has been stored or saved into to the database.


--SQL Server stored procedure is a batch of statements grouped as a logical unit and stored in the database.


--Benefits of using a stored procedure

--it can be easily modfied
--reduce network traffic
--reusable
--security
--performance

use testDB

--creating a simple stored Procedure

CREATE PROCEDURE GetProductDesc
AS
BEGIN
SET NOCOUNT ON

SELECT P.ProductID,P.ProductName,PD.ProductDescription  
FROM Product P
	INNER JOIN ProductDescription PD ON P.ProductID=PD.ProductID

END	


EXEC GetProductDesc




--another example

USE AdventureWorks2019

CREATE PROCEDURE HumanResources.upsGetEmployee --we can use PROC instead of PROCEDURE
	@LastName NVARCHAR(20),
	@FirstName NVARCHAR(20)
	--parameters
AS
	SET NOCOUNT ON;
	SELECT FirstName,LastName,Department
	FROM HumanResources.vEmployeeDepartmentHistory
	WHERE FirstName = @FirstName AND LastName = @LastName
	AND EndDate IS NULL;
GO

EXEC HumanResources.upsGetEmployee 'Ackerman','Pilar';
EXEC HumanResources.upsGetEmployee 'Bryan','Walton';



--minimal stored procedure

CREATE PROC what_db_is_this
AS
SELECT DB_NAME() AS ThisDB;

EXEC what_db_is_this

DROP  PROC what_db_is_this


--

CREATE PROCEDURE HumanResources.upsGetAllEmployee
AS
	SET NOCOUNT ON;
	SELECT LastName,FirstName,JobTitle,Department
	FROM HumanResources.vEmployeeDepartment;
Go

SELECT * FROM HumanResources.vEmployeeDepartment;


EXEC HumanResources.upsGetAllEmployee
GO

USE AdventureWorks2019

--------------------------------------------------------------------------------------

--returning more than one TABLE

CREATE PROCEDURE dbo.uspMultipleResults
AS
BEGIN
SET NOCOUNT ON;
SELECT TOP(10) BusinessEntityID,Lastname,FirstName FROM Person.Person
SELECT TOP(10) CustomerID,AccountNumber FROM Sales.Customer;
END
GO

EXEC dbo.uspMultipleResults



-----------------------------------------------------------------------------------------------

--pasing parameters

--check stored procedure in DB and if exists then drop it
IF OBJECT_ID ( 'HumanResources.uspGetEmployees', 'P' ) IS NOT NULL
    DROP PROCEDURE HumanResources.uspGetEmployees;


CREATE PROCEDURE HumanResources.uspGetEmployees
	@Lastname NVARCHAR(20),
	@FirstName NVARCHAR(20)
AS

	SET NOCOUNT ON;
	SELECT FirstName,LastName,JobTitle,Department
	FROM HumanResources.vEmployeeDepartment
	WHERE FirstName = @FirstName AND LastName = @LastName
GO

EXEC HumanResources.uspGetEmployees'Duffy','Terri'


--using defult parameters

DROP PROC GetProductDesc_withDefaultparameters

CREATE PROCEDURE GetProductDesc_withDefaultparameters
(@PID INT =320)
AS
BEGIN
SET NOCOUNT ON
 
SELECT P.ProductID,P.Name,PD.Description  FROM 
Production.Product P
	INNER JOIN Production.ProductDescription PD 
		ON P.ProductID=PD.ProductDescriptionID
WHERE P.ProductID=@PID
 
END

EXEC GetProductDesc_withDefaultparameters


SELECT * FROM Production.ProductDescription
SELECT * FROM Production.Product



--output parameters
USE testDB

CREATE TABLE Employee (EmpID int identity(1,1),EmpName varchar(500))

CREATE PROC	ins_NewEmp_with_outputParameters
@Ename varchar(20),
@Eid int Output
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Employee (EmpName) VALUES (@Ename)

SELECT @Eid = SCOPE_IDENTITY()

END

--

declare @EmpID INT
 
EXEC ins_NewEmp_with_outputParameters 'Andrew', @EmpID OUTPUT
 
SELECT @EmpID


-------------------------------------------------------------------------------------------

--modify proc

DROP PROC GetProductDesc_withDefaultparameters

USE AdventureWorks2019

ALTER PROCEDURE GetProductDesc_withDefaultparameters
(@PID INT =375)
AS
BEGIN
SET NOCOUNT ON
 
SELECT P.ProductID,P.Name,PD.Description  FROM 
Production.Product P
	INNER JOIN Production.ProductDescription PD ON P.ProductID=PD.ProductDescriptionID
WHERE P.ProductID=@PID
 
END

EXEC GetProductDesc_withDefaultparameters

--Renaming the stored procedure

sp_rename 'GetProductDesc_withDefaultparameters','GetProDescWithDefaultPar'


--bultin stored Procedure



--sp_table return tabels of tables from the current databases
EXEC sp_tables


--
EXEC sp_columns @table_name = N'Department',  
   @table_owner = N'HumanResources'




EXEC sp_tables   
   @table_name = '%',  
   @table_owner = 'Person',  
   @table_qualifier = 'AdventureWorks2019'; 



--------------------------------------------------------------------------------------------------



USE testDB
--ecryption
CREATE PROCEDURE GetEmployees
WITH Encryption
AS 
BEGIN
SET NOCOUNT ON;
SELECT EmpID,EmpName FROM Employee
END

EXEC GetEmployees

sp_helptext 'GetEmployees'


--------------------------------------------------------------------------------------------------



--Creating a temporary procedure

--local
CREATE PROCEDURE #Temp
AS
BEGIN
PRINT 'Local temp procedure'
END


--global
CREATE PROCEDURE ##TEMP
AS
BEGIN
PRINT 'Global temp procedure'
END

--------------------------------------------------------------------------------------------------


--return
--Returning Data Using Result Sets



CREATE TABLE SampleDepartments (
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    DepartmentName VARCHAR(25) NOT NULL,
    RecordDate DATETIME ,
	AverageSalary MONEY
)
GO
INSERT INTO SampleDepartments
    (DepartmentName,RecordDate, AverageSalary)
VALUES
    ('Human Resource' , '2012-01-01 12:00:21.000','15000' ),
    ('Online Sales','2005-01-01 13:12:16.000','18000'),
    ( 'Information Technology','2016-07-01 11:01:12.000','20000')



CREATE  PROC GetDepartmentInfo
@DepartmentName VARCHAR(25)
AS
BEGIN
SELECT DepartmentName , RecordDate ,AverageSalary
FROM SampleDepartments WHERE DepartmentName=@DepartmentName
END

DECLARE @returns_value int
EXEC @returns_value = GetDepartmentInfo @DepartmentName = 'Human Resource'
SELECT 'Return value' = @returns_value
GO



--------------------------------------------------------------------------------------------------



USE AdventureWorks2019

IF OBJECT_ID('Sales.uspGetEmployeeSalesYTD', 'P') IS NOT NULL  
    DROP PROCEDURE Sales.uspGetEmployeeSalesYTD;  
GO  


CREATE PROCEDURE Sales.uspGetEmployeeSalesYTD  
@SalesPerson nvarchar(50),  
@SalesYTD money OUTPUT  
AS    
BEGIN
    SET NOCOUNT ON;  
    SELECT @SalesYTD = SalesYTD  
    FROM Sales.SalesPerson AS sp  
    JOIN HumanResources.vEmployee AS e ON e.BusinessEntityID = sp.BusinessEntityID  
    WHERE LastName = @SalesPerson;  
END
RETURN     
GO

DECLARE @SalesYTDBySalesPerson money;
EXEC Sales.uspGetEmployeeSalesYTD
	N'Blythe',@salesYTD =  @SalesYTDBySalesPerson OUTPUT

SELECT 'Year-to-date sales for this employee is ' = @SalesYTDBySalesPerson



--------------------------------------------------------------------------------------------------

--Returning Data Using a Return Code


IF OBJECT_ID('Sales.usp_GetSalesYTD', 'P') IS NOT NULL  
    DROP PROCEDURE Sales.usp_GetSalesYTD;  
GO 


CREATE PROCEDURE Sales.usp_GetSalesYTD  
@SalesPerson nvarchar(50) = NULL,  -- NULL default value  
@SalesYTD money = NULL OUTPUT  
AS    
  
-- Validate the @SalesPerson parameter.  
IF @SalesPerson IS NULL  
   BEGIN  
       PRINT 'ERROR: You must specify a last name for the sales person.'  
       RETURN(1)  
   END  
ELSE  
   BEGIN  
   -- Make sure the value is valid.  
   IF (SELECT COUNT(*) FROM HumanResources.vEmployee  
          WHERE LastName = @SalesPerson) = 0  
      RETURN(2)  
   END  



-- Get the sales for the specified name and   
-- assign it to the output parameter.  
SELECT @SalesYTD = SalesYTD   
FROM Sales.SalesPerson AS sp  
JOIN HumanResources.vEmployee AS e ON e.BusinessEntityID = sp.BusinessEntityID  
WHERE LastName = @SalesPerson;  


-- Check for SQL Server errors.  
IF @@ERROR <> 0   
   BEGIN  
      RETURN(3)  
   END  
ELSE  
   BEGIN  
   -- Check to see if the ytd_sales value is NULL.  
     IF @SalesYTD IS NULL  
       RETURN(4)   
     ELSE  
      -- SUCCESS!!  
        RETURN(0)  
   END  
-- Run the stored procedure without specifying an input value.  
EXEC Sales.usp_GetSalesYTD;  
GO  
-- Run the stored procedure with an input value.  
DECLARE @SalesYTDForSalesPerson money, @ret_code int;  
-- Execute the procedure specifying a last name for the input parameter  
-- and saving the output value in the variable @SalesYTD  
EXECUTE Sales.usp_GetSalesYTD  
    N'Blythe', @SalesYTD = @SalesYTDForSalesPerson OUTPUT;  
PRINT N'Year-to-date sales for this employee is ' +  
    CONVERT(varchar(10), @SalesYTDForSalesPerson);

=======

DECLARE @SalesYTDForSalesPerson money, @ret_code int;

EXECUTE @ret_code = Sales.usp_GetSalesYTD  
    N'Blythe', @SalesYTD = @SalesYTDForSalesPerson OUTPUT;  



	--  Check the return codes.  
IF @ret_code = 0  
BEGIN  
   PRINT 'Procedure executed successfully'  
   -- Display the value returned by the procedure.  
   PRINT 'Year-to-date sales for this employee is ' + CONVERT(varchar(10),@SalesYTDForSalesPerson)  
END  
ELSE IF @ret_code = 1  
   PRINT 'ERROR: You must specify a last name for the sales person.'  
ELSE IF @ret_code = 2   
   PRINT 'ERROR: You must enter a valid last name for the sales person.'  
ELSE IF @ret_code = 3  
   PRINT 'ERROR: An error occurred getting sales value.'  
ELSE IF @ret_code = 4  
   PRINT 'ERROR: No sales recorded for this employee.'     
GO  
  


----------------------------------------------------------------------------------


/* using json with the SP */


USE testDB


/*a prcodure which will take json as paramter and create a table from the json data*/

CREATE PROCEDURE dbo.[uspGetInfoFromJson]
@userData NVARCHAR(MAX)=NULL
AS
BEGIN
	IF @userData IS NULL
	BEGIN
       PRINT 'ERROR: You must provide a json string.'  
       RETURN(1)  
	END


SET NOCOUNT ON
SELECT * FROM OPENJSON(@userData)
WITH (
	userName VARCHAR(10) '$.name',
	userSurname VARCHAR(10) '$.surname',
	userPhoneNumber VARCHAR(10) '$.PhoneNumber'
)
RETURN (0);
END

EXEC dbo.uspGetInfoFromJson N'[{"name":"raviraj","surname":"padhiayr","PhoneNumber":"9265914306"},{"name":"sagar","surname":"patel","PhoneNumber":"6581523545"}]'




