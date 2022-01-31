use SampleDB

--Create a scaler Function to compute PF which will accept parameter basicsalary and 
	--compute PF. PF is 12% of the basic salary.
	CREATE FUNCTION udfComputePF(@BasicSalary MONEY)
	RETURNS FLOAT 
	AS 
	BEGIN 
		RETURN (SELECT @BasicSalary*0.12)
	END

	--Execute:
		DECLARE @PF FLOAT
		SET @PF = dbo.udfComputePF(20000)
		PRINT @PF

--Create a scaler Function which will compute PT which will accept MontlyEarning. 
	--Criteria as below.
	CREATE FUNCTION udfComputePT(@MontlyEarning MONEY)
	RETURNS VARCHAR(50)
	AS 
	BEGIN 
		IF @MontlyEarning < 5999
		 RETURN 'NIL'
		IF @MontlyEarning >=6000 AND @MontlyEarning <=8999
			RETURN 'Rs. 80/month'
		IF @MontlyEarning >=9000 AND @MontlyEarning <=11999
			RETURN 'Rs. 150/month'
		IF @MontlyEarning >=12000 
			RETURN 'Rs. 200/month'
		RETURN 'ENTER PROPER MonthlyEarning'
	END

	--Execute:
	DECLARE @PTVALUE VARCHAR(50)
	SET @PTVALUE = dbo.udfComputePT(6000)
	PRINT @PTVALUE

--Create a table valued function which will accept JobTitle which will return new 
	--table set based on jobtitle
	CREATE FUNCTION udfTBLFnBaseONJobTitle(@jobTitle VARCHAR(15))
	RETURNS @BaseOnJobTitleTBL TABLE
	(
		JOBTitle VARCHAR(15),
		FirstName VARCHAR(20),
		LastName VARCHAR(20)
	)
	AS
	BEGIN 
		WITH JOB_CTE(FirstName,LastName,JobId)
		AS
		(
			SELECT FirstName,LastName,JobId
			FROM Employees
			WHERE JobId = @jobTitle
		)
		INSERT INTO @BaseOnJobTitleTBL
		SELECT JobId,FirstName,LastName
		FROM JOB_CTE
		RETURN 
	END

	--EXECUTE:
		SELECT * FROM udfTBLFnBaseONJobTitle('AD_VP')