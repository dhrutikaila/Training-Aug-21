--1.Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. 
--PF is 12% of the basic salary.

CREATE FUNCTION CalcPF(@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @PF DECIMAL(10,2) = @Salary*0.12
RETURN @PF
END

SELECT dbo.calcPF(20000)


--2.Create a scalar Function which will compute PT which will accept MontlyEarning. Criteria as below.
--Monthly Earnings	         Profession Tax Payable
--Below Rs. 5999	                      Nil
--Rs. 6000 to Rs. 8999	         Rs. 80/month
--Rs. 9000 to Rs. 11999	         Rs. 150/month
--Rs 12000 and above	             Rs. 200/month

CREATE FUNCTION CalcPT(@MonthlyEarning  DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @PT DECIMAL(10,2) 
SET @PT = CASE
	WHEN @MonthlyEarning <=5999 THEN NULL
	WHEN @MonthlyEarning BETWEEN 6000 AND 8999 THEN 80
	WHEN @MonthlyEarning BETWEEN 9000 AND 11999 THEN 150
	WHEN @MonthlyEarning >=12000 THEN 200
END
RETURN @PT
END

SELECT dbo.calcPT(4000)


--3.Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

CREATE FUNCTION TableJobTitle(@Jobtitle VARCHAR(30))
RETURNS TABLE
AS
	RETURN (SELECT * 
			FROM Employees 
			WHERE JobID = @Jobtitle
			)
 

END


SELECT * FROM dbo.TableJobTitle('IT_PROG')

SELECT * FROM GetDetails('AD_VP')