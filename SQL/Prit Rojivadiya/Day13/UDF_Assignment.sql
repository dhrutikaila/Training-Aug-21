-- Q1 Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

CREATE FUNCTION udf_calculatePF(@Salary int)
RETURNS decimal(10,2)
AS
BEGIN
	DECLARE @pf decimal
		SET @pf = @Salary * 0.12
	RETURN @pf
END

SELECT dbo.udf_calculatePF(30000) AS 'PF'



-- Q2 Create a scaler Function which will compute PT which will accept MontlyEarning

CREATE FUNCTION udf_computePT(@MonthlyEarning int)
RETURNS decimal(10,2)
AS
BEGIN
	DECLARE @PT decimal(10,2)
		IF @MonthlyEarning <= 5999
			SET @PT = Null
		ELSE IF @MonthlyEarning >= 6000 AND @MonthlyEarning <=8999
			SET @PT = 80
		ELSE IF @MonthlyEarning >= 9000 AND @MonthlyEarning <=11999
			SET @PT = 150
		ELSE
			SET @PT = 200
	RETURN @PT
END

SELECT dbo.udf_computePT(4000) as 'PT'
SELECT dbo.udf_computePT(7000) as 'PT'
SELECT dbo.udf_computePT(10000) as 'PT'
SELECT dbo.udf_computePT(14000) as 'PT'



-- Q3 Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

USE db2

CREATE FUNCTION udf_empDetail(@jobTitle varchar(20))
RETURNS @empDetails TABLE (
Emp_id int,
FirstName varchar(20),
LastName varchar(20),
HireDate date,
JobTitle varchar(20),
Salary int
)
AS
BEGIN
	IF EXISTS(SELECT * FROM Employees WHERE JobId = @jobTitle)
	BEGIN
		INSERT INTO @empDetails
		SELECT EmployeeID,FirstName,LastName,HireDate,JobId,Salary FROM Employees
		WHERE JobId = @jobTitle
	END
	RETURN
END

SELECT * FROM dbo.udf_empDetail('IT_PROG')