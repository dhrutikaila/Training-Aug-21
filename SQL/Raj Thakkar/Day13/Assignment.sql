--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary
CREATE FUNCTION udfComputePF(@BasicSalary MONEY)
RETURNS DECIMAL(8,2)
AS
BEGIN
      RETURN @BasicSalary*0.12
END

SELECT dbo.udfComputePF(50000) AS PF

--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.

--Monthly Earnings	Profession Tax Payable
--Below Rs. 5999	Nil
--Rs. 6000 to Rs. 8999	Rs. 80/month
--Rs. 9000 to Rs. 11999	Rs. 150/month
--Rs 12000 and above	Rs. 200/month
CREATE FUNCTION udfComputePT(@MonthlyEarning MONEY)
RETURNS MONEY
AS
BEGIN
          RETURN CASE WHEN @MonthlyEarning<6000 THEN NULL
	                  WHEN @MonthlyEarning BETWEEN 6000 AND 8999 THEN 80
					  WHEN @MonthlyEarning BETWEEN 9000 AND 11999 THEN 150
					  WHEN @MonthlyEarning>11999 THEN 200
				 END
END

SELECT ('Rs. '+CAST(dbo.udfComputePT(10000) AS nvarchar(10))+'/month') AS 'Profession Tax Payable'

--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

--Jobtitle	
--Senior Tool Designer
ALTER FUNCTION udfCreateNewTable(@JobTitle VARCHAR(30))
RETURNS @SeniorToolDesigner TABLE
        (
		  EmployeeId INT,
		  FirstName VARCHAR(30),
		  LastName VARCHAR(30),
		  Salary MONEY,
		  JobTitle VARCHAR(30),
		  DepartmentId INT
		)
AS
BEGIN
        INSERT INTO @SeniorToolDesigner
		SELECT EmployeeID
		     , FirstName
			 , LastName
			 , Salary
			 , JobId
			 , DepartmentID
	    FROM Employees 
		WHERE JobId=@JobTitle
RETURN
END

SELECT * FROM udfCreateNewTable('IT_PROG')
