--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

		CREATE FUNCTION PFCALCLUATOR (@BasicSalary MONEY )
		RETURNS MONEY AS
		BEGIN
			DECLARE @PF MONEY
			SET @PF=(@BasicSalary*12)/100
			RETURN @PF
		END


		SELECT dbo.PFCALCLUATOR(22000) as [PF_MONEY_CUT]


--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.


		CREATE FUNCTION CALCUPT(@Earnings MONEY)
		RETURNS VARCHAR(30)
		AS
		BEGIN
			DECLARE @Payable_Tax varchar(30)
			IF @Earnings<5999
			   SET @Payable_Tax='NIL'
			ELSE IF @Earnings BETWEEN  6000 AND 8999
			   SET @Payable_Tax='Rs.80/month'
			ELSE IF @Earnings BETWEEN  9000 AND 11999
			   SET @Payable_Tax='Rs.150/month'
			ELSE IF  @Earnings>12000
			   SET @Payable_Tax='Rs.200/month'
			RETURN @Payable_Tax
		END

		SELECT dbo.CALCUPT(4000) as[Profession Tax Payable]


--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

		CREATE FUNCTION  Table_Set(@JobTitle VARCHAR(30))
		RETURNS TABLE
		AS   
		RETURN (SELECT * 
				FROM Employees 
				WHERE JobId=@JobTitle)


		SELECT * from  dbo.Table_Set('AD_PRES')