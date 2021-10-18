--Creating a stored procedure with an output parameter
USE SampleDB
CREATE TABLE Employee (EmpID int identity(1,1),EmpName varchar(50))

CREATE PROCEDURE SP_with_outputparamaters
(@Ename varchar(50),
@EId int output)
AS
BEGIN
SET NOCOUNT ON
 
INSERT INTO Employee (EmpName) VALUES (@Ename)
 
SELECT @EId= SCOPE_IDENTITY()
 
END
--Execute:
declare @EmpID INT
EXEC SP_with_outputparamaters 'Andrew', @EmpID OUTPUT
SELECT @EmpID

--Creating an encrypted stored procedure
   --We can hide the source code in the stored procedure by 
   --creating the procedure with the �ENCRYPTION� option.
USE SampleDB
CREATE PROCEDURE GetEmployees
WITH ENCRYPTION
AS
BEGIN
SET NOCOUNT ON 
 
SELECT EmployeeID,FirstName from Employees
END

EXECUTE GetEmployees

--Modifying the stored procedure
USE SampleDB
ALTER PROCEDURE GetEmployees
WITH ENCRYPTION
AS
BEGIN
SET NOCOUNT ON 
 
SELECT EmployeeID,FirstName,LastName from Employees
END


--Creating a temporary procedure
  --1.Local
  CREATE PROCEDURE #Temp
	AS
	BEGIN
	PRINT 'Local temp procedure'
	END
	--Execute
	exec #Temp

  --2.Global
  CREATE PROCEDURE ##TEMP
	AS
	BEGIN
	PRINT 'Global temp procedure'
	END
	--Execute
	exec ##Temp


--Delete SP:
   --SYNTAX : DROP  PROCEDURE SP_NAME
DROP PROCEDURE ##TEMP

--Return JSON output from Store Procedure
USE SampleDB

CREATE PROCEDURE GetEmpIncentiveJSONform
AS 
BEGIN 
	SELECT E.EmployeeID AS EmpId ,E.FirstName AS EmpFirstName,
	I.IncentiveAmount AS EmpIncentiveAmount
	FROM Employees E
	INNER JOIN Incentives I ON E.EmployeeID=I.EmployeeId 
	FOR JSON PATH
END
GO
--Execute:
EXEC GetEmpIncentiveJSONform

--INPUT JSON from Store Procedure
USE SampleDB

CREATE PROCEDURE spTakeJsonFromInput
@JSON NVARCHAR(MAX)
AS
BEGIN 
SELECT * FROM OPENJSON(@JSON)
	WITH(
	Name VARCHAR(20) '$.name',
	Surname VARCHAR(20) '$.surname',
	Age INT '$.age',
	Skills VARCHAR(30) '$.skills[0]'
	)
END

--EXECUTE:
DECLARE @jsondata NVARCHAR(MAX)
SET @jsondata='[{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]},
				{"name":"Krupal","surname":"thakkar","age":20,"skills":["c","C+","MVC"]}]';
EXECUTE spTakeJsonFromInput @JSON = @jsondata
	
