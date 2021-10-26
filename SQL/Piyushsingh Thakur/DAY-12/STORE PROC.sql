use [DAY11]

SELECT * FROM Employees

CREATE PROC FirstProcedure
AS
BEGIN
SELECT  * FROM Employees WHERE JobId='AD_VP'
END


ALTER PROC FirstProcedure
AS
BEGIN
SELECT  * FROM Employees WHERE JobId='AD_VP'
SELECT  * FROM Employees WHERE JobId='IT_PROG'

END

DROP PROC FirstProcedure

FirstProcedure

EXECUTE FirstProcedure

EXEC FirstProcedure





CREATE PROC SecondProcedure
AS
BEGIN
SELECT  * FROM Employees WHERE JobId='AD_PRES'
END



SecondProcedure

EXECUTE SecondProcedure

EXEC SecondProcedure


ALTER PROC SecondProcedure
AS
BEGIN
SELECT  * FROM Employees WHERE JobId='AD_PRES'
SELECT  * FROM Employees WHERE JobId='ST_MAN'
SELECT  * FROM Employees WHERE JobId='SA_REP'

END


------------------------------------------------------------------------------------------

CREATE PROC EMPDEP
@EmpId INT
AS
BEGIN
	SELECT * FROM Employees WHERE EmployeeID=@EmpId
END

EMPDEP 106 ,'IT_PROG'
EMPDEP


ALTER PROC EMPDEP
@EmpId INT,
@JobId VARCHAR(10)

AS
BEGIN
	SELECT * FROM Employees WHERE EmployeeID=@EmpId
	SELECT * FROM Employees WHERE JobId=@JobId
END

ALTER PROC EMPDEP
@EmpId INT = 111,
@JobId VARCHAR(10)='AD_PRES'

AS
BEGIN
	SELECT * FROM Employees WHERE EmployeeID=@EmpId
	SELECT * FROM Employees WHERE JobId=@JobId
END


CREATE PROC SUMOFTWO
@Num1 INT =1,
@Num2 INT =2,
@Result INT  OUTPUT
AS
BEGIN
SET
	@Result=@Num1+@Num2
END

DECLARE @Ans INT
EXEC SUMOFTWO @Ans OUTPUT
SELECT @Ans




ALTER PROC SUMOFTWO
@Num1 INT =1,
@Num2 INT =2,
@Result INT  OUTPUT
WITH ENCRYPTION
AS
BEGIN
SET
	@Result=@Num1+@Num2
END

DECLARE @Ans INT
EXEC SUMOFTWO @Ans OUTPUT
SELECT @Ans

------------------------------------------------------------------------------------------------------------------
SP_HELPTEXT SUMOFTWO

SP_HELPTEXT EMPDEP

SP_HELPTEXT SecondProcedure



-------------------------------------------------------------------------------------------------------------------

 
CREATE PROCEDURE jsontrail 
@JsonOutput NVARCHAR(MAX) OUTPUT
AS
 
BEGIN
 
SET @JsonOutput = (SELECT TOP (1) * FROM Employees
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
 
END
  

DECLARE @json AS NVARCHAR(MAX)
EXEC jsontrail @jsonOutput = @json OUTPUT
 
SELECT @json