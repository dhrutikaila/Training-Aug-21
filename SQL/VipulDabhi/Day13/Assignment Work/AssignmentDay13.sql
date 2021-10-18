--!**!Assignment Query!**!

--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

CREATE FUNCTION fn_ComputePF
( @BasicSalary INT)
RETURNS float
AS
BEGIN

		DECLARE @Salary FLOAT
		SET @Salary = (@BasicSalary - (@BasicSalary *0.12))
		
		RETURN @Salary
END

SELECT dbo.fn_ComputePF(20000)

--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
CREATE FUNCTION fn_Taxx(@Salary INT)
RETURNS INT
AS
BEGIN
DECLARE @PT INT
	
	SET @PT = CASE
		WHEN @Salary < 5000 THEN NULL
		WHEN @Salary BETWEEN 5000 AND 9000 THEN 80
		WHEN @Salary BETWEEN 9001 AND 12000 THEN 150
		WHEN @Salary > 12000 THEN 200 
		END
RETURN @PT 
END

SELECT dbo.fn_Taxx( 20110)


--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
CREATE FUNCTION fn_TableBasedOnJobTitle
(@JobTitle VARCHAR(50))
RETURNS TABLE
AS
	 
	 RETURN(SELECT * FROM Employees WHERE JobId = @JobTitle)


