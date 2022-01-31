USE AdventureWorks2019
GO

-- STORED PROCEDURE

CREATE PROCEDURE Person.ups_EmployeeDetails
		@FirstName NVARCHAR(50)
	,	@LastName NVARCHAR(50)
AS 
BEGIN
	SET NOCOUNT ON
	SELECT BusinessEntityID
		,	CONCAT(FirstName,SPACE(1),LastName) AS 'FullName'
		,PersonType
	FROM Person.Person
	WHERE FirstName = @FirstName 
		AND LastName = @LastName
	SET NOCOUNT OFF
END
GO

-- EXECUTE PROCEDURE

EXEC Person.ups_EmployeeDetails N'Terri', N'Duffy'
EXECUTE Person.ups_EmployeeDetails @FirstName = N'Terri', @LastName = N'Duffy'
GO


-- DROP PROCEDURE

DROP PROCEDURE Person.ups_EmployeeDetails
GO

-- RETURN and OUTPUT

SELECT * FROM Person.Person
SELECT * FROM HumanResources.Department
SELECT * FROM HumanResources.EmployeeDepartmentHistory
SELECT * FROM HumanResources.Employee
GO


CREATE PROCEDURE ups_EmployeeDepartment
		@BusinessEnitiyID INT
	,	@DepName VARCHAR(50) OUTPUT
	,	@ShiftID INT OUTPUT
AS 
BEGIN
	IF EXISTS(	SELECT * 
				FROM HumanResources.EmployeeDepartmentHistory 
				WHERE BusinessEntityID = @BusinessEnitiyID
			)
	BEGIN
		SELECT 	@DepName = D.Name 
			,	@ShiftID = EDH.ShiftID
		FROM HumanResources.EmployeeDepartmentHistory EDH
			INNER JOIN HumanResources.Department AS D
				ON EDH.DepartmentID = D.DepartmentID
		WHERE EDH.BusinessEntityID = @BusinessEnitiyID
		RETURN 0
	END
END
GO


CREATE PROCEDURE ups_EmployeeDetails
	@EmpId INT
AS
BEGIN
	DECLARE @DepName VARCHAR(50), @ShiftID INT, @ReturnValue INT
	EXEC @ReturnValue = ups_EmployeeDepartment @EmpId, @DepName OUTPUT, @ShiftID OUTPUT
	IF EXISTS(	SELECT *
				FROM HumanResources.EmployeeDepartmentHistory
				WHERE BusinessEntityID = @EmpId
			)
	BEGIN
		PRINT 'EmployeeID : ' + CONVERT(VARCHAR(4),@EmpId)
		PRINT 'Department Name: ' + @DepName
		PRINT 'Shift ID: ' + CONVERT(VARCHAR(4),@ShiftID)
		SELECT P.BusinessEntityID AS 'ID'
			,	CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
			,	E.JobTitle
		FROM Person.Person AS P
			INNER JOIN HumanResources.Employee AS E
				ON P.BusinessEntityID = E.BusinessEntityID
				WHERE P.BusinessEntityID = @EmpId
	END
	ELSE
	BEGIN
		PRINT 'NO Records found for '+ @EmpId
	END
END
GO

EXEC ups_EmployeeDetails 207
GO

DROP PROCEDURE ups_EmployeeDepartment
GO
DROP PROCEDURE ups_EmployeeDetails
GO


-- ALTER PROCEDURE

SELECT * 
FROM Person.Person
GO

ALTER PROCEDURE Person.ups_EmployeeDetails
		@FirstName NVARCHAR(50)
	,	@MiddleName NVARCHAR(50)
	,	@LastName NVARCHAR(50)
AS 
BEGIN
	SET NOCOUNT ON
	SELECT BusinessEntityID
		,	CONCAT(FirstName,SPACE(1),MiddleName,SPACE(1),LastName) AS 'FullName'
		,PersonType
	FROM Person.Person
	WHERE FirstName = @FirstName 
		AND LastName = @LastName
		AND MiddleName = @MiddleName
	SET NOCOUNT OFF
END
GO

EXEC Person.ups_EmployeeDetails @FirstName = N'Terri'
	,	@LastName = N'Duffy'
	,	@MiddleName = N'Lee'
GO

-- GET ALL PROCEDURES

SELECT name AS procedure_name   
    ,	SCHEMA_NAME(schema_id) AS schema_name  
    ,	type_desc  
    ,	create_date  
    ,	modify_date  
FROM SYS.procedures 
GO

-- RENAME PROCEDURE

EXEC sp_rename 'Person.ups_NewEmployeeDetails','ups_NewEmployeeDetails'
EXEC Person.ups_NewEmployeeDetails @FirstName = N'Terri'
	,	@LastName = N'Duffy'
	,	@MiddleName = N'Lee'
GO


USE Demo
GO
-- USING JSON

ALTER PROCEDURE usp_json
	@details NVARCHAR(MAX) 
AS 
BEGIN
	SET NOCOUNT ON
		INSERT INTO Faculty
		SELECT F_Name
		FROM OPENJSON(@details)
		WITH(
		F_Name NVARCHAR(50) N'$.F_Name'
		) AS JSON_Details
	SET NOCOUNT OFF
END
GO

DECLARE @jsonvalue NVARCHAR(MAX) 
SET @jsonvalue = '[
					{
					"F_ID":1,
					"F_Name":"Vinod"
					},
					{
					"F_ID":2,
					"F_Name":"Amit"
					},
					{
					"F_ID":3,
					"F_Name":"Sagar"
					},
					{
					"F_ID":4,
					"F_Name":"Niraj"
					}
				]'

EXEC usp_json @jsonvalue

DROP PROCEDURE usp_json

SELECT * FROM faculty FOR JSON PATH

