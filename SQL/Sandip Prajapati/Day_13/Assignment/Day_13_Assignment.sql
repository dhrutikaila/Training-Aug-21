---------------DAY-13---------------
USE SANDY
-------ASSIGNMENT
--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
CREATE FUNCTION PFCACULATOR(@BASICSALARY INT)
RETURNS INT
AS
BEGIN
DECLARE @PF INT
SET @PF = @BASICSALARY * 0.12
RETURN @PF
END;
GO
SELECT dbo.PFCACULATOR(40000)
--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
CREATE FUNCTION PTCALCULATOR(@MonthlyEarning Int)
RETURNS INT
AS
BEGIN
DECLARE @PT INT
SET @PT = (CASE
		WHEN @MonthlyEarning<5999 THEN 0
		WHEN @MonthlyEarning BETWEEN 6000 AND 8999 THEN 80 * 12
		WHEN @MonthlyEarning BETWEEN 9000 AND 11999 THEN 150 * 12
		ELSE 200 * 12
		END)
RETURN @PT
		
END;
GO

SELECT dbo.PTCALCULATOR(5000)

--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
CREATE FUNCTION JOBTITLEFUNCTION(@jobtitle varchar(50))
RETURNS TABLE 
AS
RETURN(
SELECT * FROM AdventureWorks2019.HumanResources.Employee WHERE JobTitle = @jobtitle
)

SELECT * FROM JOBTITLEFUNCTION('Senior Tool Designer')