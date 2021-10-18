--Assignment:

--1.Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
	
	CREATE FUNCTION ufn_ComputePF (@Basicsalary DECIMAL(8,2))
	RETURNS DECIMAL(8,2) 
	AS
	BEGIN
		RETURN (@Basicsalary * 0.12)
	END

	SELECT EmployeeID,EmployeeName=(FirstName+SPACE(1)+LastName),Salary,dbo.ufn_ComputePF(Salary) AS PF FROM Employees

--2.Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
--Monthly Earnings			Profession Tax Payable
--Below Rs. 5999			Nil
--Rs. 6000 to Rs. 8999		Rs. 80/month
--Rs. 9000 to Rs. 11999		Rs. 150/month
--Rs 12000 and above		Rs. 200/month

	CREATE FUNCTION ufn_ComputePT(@MonthlyEarning INT)
	RETURNS VARCHAR(5)
	AS
	BEGIN
		RETURN
		CASE 
		WHEN @MonthlyEarning < 5999 THEN 'Nil'
		WHEN @MonthlyEarning >= 6000 AND @MonthlyEarning<= 8999 THEN '80'
		WHEN @MonthlyEarning >= 9000 AND @MonthlyEarning<= 11999 THEN '150'
		WHEN @MonthlyEarning > 12000  THEN '200'
		END
	END

	SELECT dbo.ufn_ComputePT(6500) AS Profession_Tax_Payable

--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
--Jobtitle	
--Senior Tool Designer

	CREATE FUNCTION ufn_jobs(@JobTitle VARCHAR(35)) 
	RETURNS TABLE
	AS
	RETURN(SELECT * FROM jobs WHERE job_title=@JobTitle)

	SELECT * FROM dbo.ufn_jobs('Senior Tool Designer')

	


