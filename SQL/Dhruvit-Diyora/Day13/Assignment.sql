--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
CREATE FUNCTION ufnConvertPF(@Salary INT)  
RETURNS INT
AS
BEGIN
	RETURN @Salary*0.12
END
SELECT dbo.ufnConvertPF(10000)

--task-2-Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
--Monthly Earnings	Profession Tax Payable
--Below Rs. 5999	Nil
--Rs. 6000 to Rs. 8999	Rs. 80/month
--Rs. 9000 to Rs. 11999	Rs. 150/month
--Rs 12000 and above	Rs. 200/month
CREATE FUNCTION ufnCalculatePF(@Salary INT)  
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN CASE 
	WHEN @Salary BETWEEN 0 AND 5999 THEN 'Nil'
	WHEN @Salary BETWEEN 6000 AND 8999 THEN '80/month'
	WHEN @Salary BETWEEN 9000 AND 11999 THEN '150/month'
	ELSE '200/month' 
END
END
SELECT dbo.ufnCalculatePF(15000)
--task-3-Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
CREATE FUNCTION ufnJobTitle(@JobTitle VARCHAR(50))  
RETURNS @JobS TABLE
(
	JobTitle VARCHAR(50)
)
AS
BEGIN
	INSERT INTO @JobS VALUES (@JobTitle)
	RETURN  
END
SELECT * from dbo.ufnJobTitle('Senior Tool Designer')
