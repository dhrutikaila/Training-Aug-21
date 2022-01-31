/*
1.CREATE a scaler Function to compute PF which will accept parameter basicsalary and compute PF. 
PF is 12% of the basic salary.
*/
CREATE FUNCTION CalcPF(@Salary Money)
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @PF DECIMAL(10,2) = @Salary*0.12
RETURN @PF
END

SELECT EmployeeID,FirstName,LastName,Salary,dbo.CalcPF(Salary) AS 'PF' FROM Employee

/*
2.CREATE a scalar Function which will compute PT which will accept MontlyEarning. Criteria as below.
Monthly Earnings	         Profession Tax Payable
Below Rs. 5999	                      Nil
Rs. 6000 to Rs. 8999	         Rs. 80/month
Rs. 9000 to Rs. 11999	         Rs. 150/month
Rs 12000 and above	             Rs. 200/month
*/
declare @month_6000_9000 INT
set @month_6000_9000= 80
declare @month_9000_12000 INT
set @month_9000_12000= 150
declare @month_12000 INT
set @month_12000= 200

CREATE FUNCTION CalcPT(@MonthlyEarning MONEY)
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @PT DECIMAL(10,2) 
SET @PT = CASE
	WHEN @MonthlyEarning <=5999 THEN NULL
	WHEN @MonthlyEarning BETWEEN 6000 AND 8999 THEN @month_6000_9000
	WHEN @MonthlyEarning BETWEEN 9000 AND 11999 THEN @month_9000_12000
	WHEN @MonthlyEarning >=12000 THEN @month_12000
END
RETURN @PT
END

SELECT FirstName,LastName,Salary,ISNULL(dbo.CalcPT(Salary),0) as 'PT/Month' FROM Employee


/*
3.CREATE a TABLE valued function which will accept JobTitle which will return new TABLE set based on jobtitle
*/
CREATE FUNCTION GetDetails(@JobTitle varchar(20))
RETURNS @JobDetails TABLE
(
	FirstName varchar(20),
	LastName varchar(20),
	Salary int,
	JobTitle varchar(20)
)
AS
BEGIN
INSERT INTO @JobDetails
SELECT FirstName,LastName,Salary,JobID FROM Employee WHERE JobID=@JobTitle
RETURN 
END

SELECT * FROM GetDetails('AD_VP')