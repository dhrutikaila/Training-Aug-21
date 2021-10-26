
USE DB_BANK
GO

-- 1. Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.


CREATE FUNCTION PF_CAlC(@sal MONEY)
RETURNS MONEY
BEGIN
	RETURN (@sal*12)/100
END
GO

SELECT dbo.PF_CALC(12000)
GO


-- 2. Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.



CREATE FUNCTION TAX_CAlC(@amount MONEY)
RETURNS MONEY
BEGIN
	IF @amount <= 5999
		RETURN @amount
	IF @amount >=6000 OR @amount <= 8999
		RETURN @amount-(12*80)
	IF @amount >=9000 OR @amount <= 11999
		RETURN @amount-(12*150)
	IF @amount >= 12000
		RETURN @amount-(12*200)
	RETURN 0
END
GO


SELECT dbo.TAX_CAlC(8500)
GO


USE Assignment2
GO

-- 3. Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

CREATE FUNCTION TableJobTitle(@Jobtitle VARCHAR(30))
RETURNS TABLE
AS
	RETURN (SELECT * 
			FROM Employees 
			WHERE JobID = @Jobtitle
		)
GO 

SELECT * FROM Employees

SELECT * FROM dbo.TableJobTitle('IT_PROG')
SELECT dbo.TAX_CAlC(8500)

