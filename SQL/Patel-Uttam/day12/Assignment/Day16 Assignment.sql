 USE [Day16 (Function)]


 -- Assignment

/*
	--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
	--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
	--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

*/

-----------------------------------------------------------------------------------------------

	--CREATE TABLE Employee_Salary_Tax
	--(
	--EmpID int Primary Key Identity(1,1),
	--Monthly_Salary int NOT NULL CONSTRAINT CK_month_salary CHECK(Monthly_Salary > 0),   
	--PF int NULL,
	--Payable_Tax int NULL 
	--);

--INSERT INTO Employee_Salary_Tax(Monthly_Salary)
--VALUES	(10000),(5999),(5000),(6000),(12500),(6500),(8999),(9999),(9000)

-----------------------------------------------------------------------------------------------




--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
-----------------------------------------------------------------------------------------------
	CREATE FUNCTION PF_count(@salary int)
	RETURNS int
	AS
	BEGIN
		DECLARE @return_PF int
		SELECT @return_PF = (Monthly_Salary * 0.12) FROM Employee_Salary_Tax WHERE Monthly_Salary = @salary
		RETURN @return_PF
	END
	GO

	-- Function Call
	DECLARE @select_salary int
	SET @select_salary = 12500   --(Replace '?' with salary)
	UPDATE Employee_Salary_Tax SET PF= dbo.PF_count(@select_salary) WHERE Monthly_Salary = @select_salary
	PRINT @select_salary
	GO
	-- SELECT * FROM Employee_Salary_Tax
-----------------------------------------------------------------------------------------------






--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
-----------------------------------------------------------------------------------------------
	CREATE FUNCTION Tax_count(@salary int)
	RETURNS int
	AS
	BEGIN
		DECLARE @return_TAX int
		
		IF (@salary) BETWEEN 1 AND 5999
		BEGIN
		SET @return_TAX = NULL
		END
		
		ELSE IF (@salary) BETWEEN 6000 AND 8999
		BEGIN
		SET @return_TAX = 80		
		END
		
		ELSE IF(@salary) BETWEEN 9000 AND 11999
		BEGIN
		SET @return_TAX = 150
		END
		
		ELSE IF(@salary) >= 12000
		BEGIN
		SET @return_TAX = 200
		END

		RETURN @return_TAX
	END
	GO

	-- Function Call
	DECLARE @select_salary int
	SET @select_salary = 16500   --(Replace '?' with salary)
	UPDATE Employee_Salary_Tax SET Payable_Tax = dbo.Tax_count(@select_salary) WHERE Monthly_Salary = @select_salary
	PRINT dbo.Tax_count(@select_salary)
	GO
	-- SELECT * FROM Employee_Salary_Tax
-----------------------------------------------------------------------------------------------



--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
-----------------------------------------------------------------------------------------------
CREATE FUNCTION Jobtitle_in_table(@jobtitle varchar(20))
RETURNS 
@jobtitle_table TABLE
(
	JobTitle varchar(20)
)
AS
BEGIN
	INSERT into @jobtitle_table
	SELECT JobId FROM [Day6 (SELECT)].dbo.Employees WHERE JobId = @jobtitle

RETURN
END

GO

-- Function Call

	SELECT DISTINCT JobTitle FROM  dbo.Jobtitle_in_table('PU_CLERK')

-----------------------------------------------------------------------------------------------