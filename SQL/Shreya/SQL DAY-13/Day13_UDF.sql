--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

CREATE FUNCTION fun_calPF(@salary MONEY)
RETURNS DECIMAL(8,2)
AS
BEGIN
DECLARE @pf DECIMAL(8,2) = @salary * 012
RETURN @pf
END

SELECT FirstName,LastName,Salary , PF = dbo.fun_calPF(Salary) FROM Employees

/*Create a scalar Function which will compute PT which will accept MontlyEarning. Criteria as below.
Monthly Earnings				Profession Tax Payable
Below Rs. 5999					Nil
Rs. 6000 to Rs. 8999			Rs. 80/month
Rs. 9000 to Rs. 11999			Rs. 150/month
Rs 12000 and above				Rs. 200/month
*/

CREATE FUNCTION fun_calPT(@monthlyEarning MONEY)
RETURNS DECIMAL(8,2)
AS
BEGIN
DECLARE @pt DECIMAL(8,2)
SET @pt =
CASE 
WHEN @monthlyEarning <= 5999 THEN NULL
WHEN @monthlyEarning BETWEEN 6000 AND 8999 THEN 80
WHEN @monthlyEarning BETWEEN 9000 AND 11999 THEN 150
WHEN @monthlyEarning > = 12000 THEN 200
END
RETURN @pt
END

SELECT FirstName,LastName,Salary ,PT=dbo.fun_calPT(Salary) FROM Employees
SELECT FirstName,LastName,Salary ,PT=ISNULL(dbo.fun_calPT(Salary),0) FROM Employees
--2ND WAY

ALTER FUNCTION fun_calculatePT(@monthlyEarning MONEY)
RETURNS DECIMAL(8,2)
AS
BEGIN
DECLARE @pt DECIMAL(8,2)
		IF @monthlyEarning <= 5999
		SET @pt= NULL
		ELSE IF @monthlyEarning BETWEEN 6000  AND  8999
		SET @pt=80
		ELSE IF @monthlyEarning BETWEEN 9000 AND 11999
		SET @pt=150
		ELSE IF @monthlyEarning >= 12000
		SET @pt=200
		ELSE 
		SET @pt=0.00
		RETURN @pt
END

SELECT FirstName,LastName,Salary ,PT=dbo.fun_calculatePT(Salary) FROM Employees

/*Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
Jobtitle	
Senior Tool Designer	*/

CREATE FUNCTION GetJobdetails(@jobTitle varchar(10))
RETURNS @jobDetails TABLE
(
 FirstName VARCHAR(20),
 LastName VARCHAR(25),
 HireDate DATE,
 JobTitle VARCHAR(10)
)AS 
BEGIN
INSERT INTO @jobDetails
SELECT FirstName,LastName,HireDate,JobId FROM Employees WHERE JobId=@jobTitle
RETURN 

END



SELECT * FROM GetJobDetails('AD_VP')


