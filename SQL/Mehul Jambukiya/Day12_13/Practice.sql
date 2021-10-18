USE Practice

--UDF
--Create User-defined Functions
--Scalar Functions

/*
FUNCTION:CalculateSquare (@Num SMALLINT)
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	DECLARE @Square INT
	SELECT @Square = dbo.CalculateSquare(Number)

FUNCTION_RETURNS:
	Square of given number as INT
*/

CREATE FUNCTION CalculateSquare (@Num SMALLINT)
	RETURNS INT 
		AS
			BEGIN
				DECLARE @Result INT
				SET @Result = @Num * @Num
				RETURN @Result
			END

DECLARE @Square INT
SELECT @Square = dbo.CalculateSquare(5)
SELECT @Square


--USE SqlDay6

/*
FUNCTION:PFCalculation(@Id INT)
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT dbo.PFCalculation(EmployeeId)

FUNCTION_RETURNS:
	PF for given EmployeeId as MONEY
*/

CREATE FUNCTION PFCalculation(@Id INT)
	RETURNS MONEY 
		AS
			BEGIN
				DECLARE @PF MONEY
				SET @PF= (SELECT Salary*0.12 FROM Employees WHERE EmployeeID=@Id)
				RETURN @PF
			END

SELECT dbo.PFCalculation(100)

--USE SqlDay6

/*
FUNCTION:PTaxCalculate(@Id INT)
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT dbo.PTaxCalculate(EmployeeId)

FUNCTION_RETURNS:
	Prof.Tax for given EmployeeId as SMALLMONEY
*/

CREATE FUNCTION PTaxCalculate(@Id INT)
	RETURNS SMALLMONEY 
		AS
			BEGIN
				DECLARE @PT MONEY
				DECLARE @Salary MONEY
				SET @Salary = (SELECT Salary FROM Employees WHERE EmployeeID=@Id)
				IF(@Salary < 5999 )
					SET @PT = 0
				ELSE IF(@Salary BETWEEN 6000 AND 8999)
					SET @PT = 80
				ELSE IF(@Salary BETWEEN 9000 AND 11999)
					SET @PT = 150
				ELSE IF(@Salary > 12000)
					SET @PT = 200
				RETURN @PT
			END

SELECT dbo.PTaxCalculate(104)


--Table-Valued Functions
--INLINE

/*
FUNCTION:TableDemo()
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT * FROM dbo.TableDemo()

FUNCTION_RETURNS:
	Tabular data as TABLE
*/

CREATE FUNCTION TableDemo()
	RETURNS TABLE 
		AS
			RETURN 
				SELECT * FROM Demo4 WHERE Age>20

SELECT * FROM dbo.TableDemo()


/*
FUNCTION:TableDemo2(@Id INT)
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT * FROM TableDemo2(Id)

FUNCTION_RETURNS:
	Tabular data for given Id as TABLE
*/


CREATE FUNCTION TableDemo2(@Id INT)
	RETURNS TABLE 
		AS
			RETURN 
				SELECT * FROM Demo4  WHERE Id=@Id

SELECT * FROM TableDemo2(6)


--MultiStatement

/*
FUNCTION:MultiStatementTableDemo(@InputId INT)
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT * FROM MultiStatementTableDemo(Id)

FUNCTION_RETURNS:
	Tabular data for given Id as TABLE
*/

CREATE FUNCTION MultiStatementTableDemo(@InputId INT)
	RETURNS @RetTable TABLE 
		(
			Id INT,
			Name VARCHAR(20),
			Age SMALLINT
		)
		AS
			BEGIN
				INSERT INTO @RetTable
				SELECT Id,Name,Age FROM Demo4 WHERE Id=@InputId
				RETURN
			END


SELECT * FROM MultiStatementTableDemo(2)


--Drop Function

DROP FUNCTION TableDemo2

--Alter Function

ALTER FUNCTION TableDemo2(@Id INT)
	RETURNS TABLE 
		AS
			RETURN 
				SELECT * FROM Demo4  WHERE Id=@Id AND IsMarried=0

SELECT * FROM TableDemo2(2)
