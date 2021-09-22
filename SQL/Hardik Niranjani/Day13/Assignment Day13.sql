
--(1)
--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. 
--PF is 12% of the basic salary.


CREATE FUNCTION Fn_PF_Calculate(@basicsalary INT)
RETURNS INT
AS
BEGIN
DECLARE @Result INT 
SET @Result = 0
SET @Result +=  @basicsalary*0.12

RETURN @Result
END

SELECT dbo.Fn_PF_Calculate(25000) AS [PF]



--(2)
--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.

CREATE FUNCTION Fn_Profession_Tax(@Earning INT)
RETURNS INT 
AS 
BEGIN
DECLARE @PT INT
SET @PT = 0
SET @PT += CASE
			WHEN @Earning <=5999 THEN  0
			WHEN @Earning>=6000 AND @Earning<=8999 THEN 80
			WHEN @Earning>=9000 AND @Earning<=11999 THEN 150
			WHEN @Earning>=12000 THEN 200
			END
RETURN @PT
END

SELECT dbo.Fn_Profession_Tax(499) AS [Profession_Tax]
SELECT dbo.Fn_Profession_Tax(5682) AS [Profession_Tax]
SELECT dbo.Fn_Profession_Tax(7682) AS [Profession_Tax]
SELECT dbo.Fn_Profession_Tax(10420) AS [Profession_Tax]
SELECT dbo.Fn_Profession_Tax(15680) AS [Profession_Tax]




--(3)
--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle



CREATE FUNCTION Fn_JobIdTable(@JobTitle VARCHAR(10))
RETURNS @Table Table (ID decimal(6,0), [NAME] VARCHAR(45),PhoneNumber VARCHAR(20),JobId VARCHAR(10),Salary DECIMAL(8,2))
AS
BEGIN
		INSERT INTO @Table
		SELECT EmployeeID,[NAME] = FirstName+SPACE(1)+LastName,PhoneNumber, JobId, Salary  
		FROM Employees
		WHERE JobId = @JobTitle

RETURN
END



SELECT * FROM Fn_JobIdTable('SH_CLERK')