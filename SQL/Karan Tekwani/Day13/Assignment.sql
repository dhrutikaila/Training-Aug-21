/* Create a table valued function which will accept JobTitle which will return new table set 
based on jobtitle  */

ALTER FUNCTION Details (@JobTitle VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM HumanResources.Employee WHERE JobTitle=@JobTitle
)
GO

SELECT * FROM HumanResources.Employee
SELECT * FROM DBO.Details('Chief Executive Officer')


/*  1. Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. 
PF is 12% of the basic salary.   */

CREATE FUNCTION PF (@Salary int)
RETURNS float
AS
BEGIN
	RETURN (@Salary*0.12)
END
GO

SELECT 'Provident Fund' =DBO.PF(10000)

/*  2. Create a scaler Function which will compute PT which will accept MontlyEarning. */

ALTER FUNCTION ProvidentFund(@MontlyEarning int)
RETURNS float
AS
BEGIN
DECLARE @PF FLOAT
IF @MontlyEarning<5999 
	SET @PF=0

IF @MontlyEarning BETWEEN 6000 AND 8999
	SET @PF=80

IF @MontlyEarning BETWEEN 9000 AND 11999
	SET @PF=150

IF @MontlyEarning>=12000
	SET @PF=200

RETURN @PF
END
GO

DECLARE @FUND FLOAT
EXEC @FUND =DBO.ProvidentFund
	 @MontlyEarning=15000
PRINT @FUND