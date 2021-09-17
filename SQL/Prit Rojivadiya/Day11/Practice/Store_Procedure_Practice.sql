USE AdventureWorks2012

-- Store procedure to select employee data using their firstname and lastname

CREATE PROCEDURE EmployeeData
	@FirstName varchar(50),
	@LastName varchar(50)
AS
SET NOCOUNT ON
SELECT * FROM Person.Person
WHERE FirstName = @FirstName OR LastName = @LastName
GO


EXECUTE EmployeeData 'Prit', 'Smith'
EXEC EmployeeData 'Prit','Smith'
EXECUTE EmployeeData @LastName = 'Smith',@FirstName = 'Prit'
EXECUTE EmployeeData @FirstName = 'Prit',@LastName = 'Smith'
EXECUTE EmployeeData 'Prit', 'Smith' WITH RECOMPILE


-- Alter store procedure

ALTER PROCEDURE EmployeeData
	@FirstName varchar(50),
	@LastName varchar(50)
AS
SET NOCOUNT ON
SELECT * FROM Person.Person
WHERE FirstName = @FirstName OR LastName = @LastName
SET NOCOUNT OFF
GO



-- assigning default value to store procedure variable


ALTER PROCEDURE EmployeeData
	@FirstName varchar(50) = 'Prit',
	@LastName varchar(50) = 'Smith'
AS
SET NOCOUNT ON
SELECT * FROM Person.Person
WHERE FirstName = @FirstName OR LastName = @LastName
SET NOCOUNT OFF
GO

EXEC EmployeeData



-- system store procedure

EXEC sp_help EmployeeData
EXEC sp_helptext EmployeeData
SELECT OBJECT_DEFINITION (OBJECT_ID('EmployeeData'))
EXEC sp_rename 'EmployeeData', 'EmployeesData'
EXEC sp_rename 'EmployeesData', 'EmployeeData'
EXEC sp_databases
EXEC sp_tables
EXEC sp_columns Employee,Humanresources




-- using output in store procedure

CREATE PROCEDURE Humanresources.usp_vacationHours
@id int,
@VacationHours smallint OUTPUT
AS
SELECT @VacationHours = VacationHours FROM HumanResources.Employee
WHERE BusinessEntityID = @id

DECLARE @vHours smallint 
EXEC Humanresources.usp_vacationHours 1,@VacationHours = @vHours OUTPUT
PRINT @vHours




-- returning usign output parameter
 
IF OBJECT_ID('Sales.uspGetEmployeeSalesYTD', 'P') IS NOT NULL  
    DROP PROCEDURE Sales.uspGetEmployeeSalesYTD;  
GO  
CREATE PROCEDURE Sales.uspGetEmployeeSalesYTD  
@SalesPerson nvarchar(50),  
@SalesYTD money OUTPUT  
AS    
  
    SET NOCOUNT ON;  
    SELECT @SalesYTD = SalesYTD  
    FROM Sales.SalesPerson AS sp  
    JOIN HumanResources.vEmployee AS e ON e.BusinessEntityID = sp.BusinessEntityID  
    WHERE LastName = @SalesPerson;  
	RETURN
GO

DECLARE @SalesYTDbySalesPerson Money
EXECUTE Sales.uspGetEmployeeSalesYTD  'Blythe',@SalesYTD = @SalesYTDbySalesPerson OUTPUT
PRINT @SalesYTDbySalesPerson




-- Example of cursor output parameter

IF OBJECT_ID ( 'dbo.uspCurrencyCursor', 'P' ) IS NOT NULL  
    DROP PROCEDURE dbo.uspCurrencyCursor;  
GO  
CREATE PROCEDURE dbo.uspCurrencyCursor   
	@currencyCursor CURSOR VARYING OUTPUT 
AS  
    SET NOCOUNT ON;  
    SET @currencyCursor = CURSOR STATIC FORWARD_ONLY FOR
      SELECT CurrencyCode, Name  
      FROM Sales.Currency;  
    OPEN @CurrencyCursor;  
GO


DECLARE @Mycursor CURSOR
EXEC uspCurrencyCursor  @currencyCursor = @Mycursor OUTPUT
FETCH NEXT FROM @Mycursor
WHILE (@@FETCH_STATUS = 0)
BEGIN
	FETCH NEXT FROM @Mycursor
END
CLOSE @Mycursor
DEALLOCATE @Mycursor
GO



-- Returning multiple result sets

CREATE PROCEDURE MultipleDataSets
AS
SELECT * FROM Person.Person
SELECT * FROM HumanResources.Employee

EXEC MultipleDataSets

-- OR

CREATE PROCEDURE personData
AS
SELECT * FROM Person.Person

CREATE PROCEDURE EmployeeDatas
AS
SELECT * FROM HumanResources.Employee

CREATE PROCEDURE AllData
AS
EXEC personData
EXEC EmployeeDatas

EXEC AllData



-- Return JSON output from Store Procedure

USE db2

CREATE PROCEDURE jsaonData
AS
SELECT * FROM Employees FOR JSON PATH

EXEC jsaonData



-- With encryption

ALTER PROCEDURE jsonData
WITH ENCRYPTION
AS
SELECT * FROM Employees FOR JSON PATH

EXEC jsonData

EXEC sp_helptext jsonData



-- Store procedure returning value

CREATE PROCEDURE getEmpDetail 
@empId int,
@JobTitle varchar(50) OUTPUT,
@vacationHours smallint OUTPUT
AS
IF EXISTS(SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = @empId)
BEGIN

SELECT @JobTitle = JobTitle,@vacationHours = VacationHours FROM HumanResources.Employee
WHERE BusinessEntityID = @empId
RETURN 0

END


CREATE PROCEDURE getEmpData 
@empID int
AS
BEGIN
DECLARE @returnType int,@jTitle varchar(50),@vHours smallint
EXEC @returnType = getEmpDetail @empID,@jTitle OUTPUT,@vHours OUTPUT

IF(@returnType = 0)
BEGIN

	PRINT @jTitle
	PRINT @vHours

END
ELSE
PRINT 'No data found'
END

EXEC getEmpData 2