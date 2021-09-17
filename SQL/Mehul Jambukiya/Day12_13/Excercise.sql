USE SqlDay6

/*1.Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. 
PF is 12% of the basic salary.*/


/*
FUNCTION:ComputePF(@BasicSalary MONEY)
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT dbo.ComputePF(Salary)

FUNCTION_RETURNS:
	PF for given Salary as MONEY
*/


CREATE FUNCTION ComputePF(@BasicSalary MONEY)
	RETURNS MONEY 
		AS
			BEGIN
				RETURN (@BasicSalary * 0.12)
			END

SELECT dbo.ComputePF(20000)

/*2.Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
Monthly Earnings			Profession Tax Payable
Below Rs. 5999						Nil
Rs. 6000 to Rs. 8999			Rs. 80/month
Rs. 9000 to Rs. 11999			Rs. 150/month
Rs 12000 and above				Rs. 200/month*/


/*
FUNCTION:ComputePTax(@MonthlyEarning MONEY)
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT dbo.ComputePTax(Salary)

FUNCTION_RETURNS:
	Prof.Tax for given Salary as SMALLMONEY
*/


CREATE FUNCTION ComputePTax(@MonthlyEarning MONEY)
	RETURNS SMALLMONEY 
		AS
			BEGIN
				DECLARE @PT SMALLMONEY
				IF(@MonthlyEarning BETWEEN 0 AND 5999)
					SET @PT = 0
				ELSE IF(@MonthlyEarning BETWEEN 6000 AND 8999)
					SET @PT = 80
				ELSE IF(@MonthlyEarning BETWEEN 9000 AND 11999)
					SET @PT = 150
				ELSE IF(@MonthlyEarning > 12000)
					SET @PT = 200
				RETURN @PT
			END

SELECT dbo.ComputePTax(20000)

/*3.Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
Jobtitle	
Senior Tool Designer*/

/*
FUNCTION:TableForJobTitle(@Jobtitle VARCHAR(40))
AUTHOR:Mehul Jambukiya        CREATED ON:07/09/2021
FUNCTION_CALL: 
	SELECT * FROM TableForJobTitle(Jobtitle)

FUNCTION_RETURNS:
	Tabular data for given jobtitle as TABLE
*/


CREATE FUNCTION TableForJobTitle(@Jobtitle VARCHAR(40))
RETURNS @RetTable TABLE
	(
		JobTitle VARCHAR(40)
	)
	AS
		BEGIN
			INSERT INTO @RetTable VALUES (@Jobtitle)
			RETURN
		END

SELECT * FROM TableForJobTitle('Senior Tool Designer')
SELECT * FROM TableForJobTitle('IT Programmer')