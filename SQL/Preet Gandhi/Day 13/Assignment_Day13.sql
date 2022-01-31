USE Day3_SQL

--1)Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-07>
-- Description:	<Description, ,>
--SELECT dbo.CountPF(Salary) AS 'PF' FROM Employees
-- =============================================
CREATE FUNCTION CountPF(@Salary INT)
RETURNS INT
AS
BEGIN
	DECLARE @PF INT
	SET @PF = @Salary * 0.12
	RETURN @PF
END
GO

SELECT EmployeeID,Salary,dbo.CountPF(Salary) AS 'PF' FROM Employees


--2)Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-07>
-- Description:	<Description, ,>
--SELECT Salary,dbo.CountPT(Salary) FROM Employees
-- =============================================

CREATE FUNCTION CountPT (@Salary INT)
RETURNS INT
AS
BEGIN
	RETURN 
	(CASE 
	WHEN @Salary <= 5999 THEN 0
	WHEN @Salary BETWEEN 6000 AND 8999 THEN 80
	WHEN @Salary BETWEEN 9000 AND 11999 THEN 150
	WHEN @Salary >=12000 THEN 200
	END
	)
END
GO

SELECT Salary,dbo.CountPT(Salary) FROM Employees


--3)Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-07>
-- Description:	<Description, ,>
--SELECT * FROM dbo.GetJobTitle('FI_ACCOUNT')
-- =============================================
CREATE FUNCTION GetJobTitle (@JobTitle VARCHAR(15))
RETURNS @Title TABLE
(
	JobTitle VARCHAR(20)
)
AS
BEGIN
	INSERT INTO @Title
	SELECT JobID FROM Employees WHERE JobId = @JobTitle
	RETURN
END
Go

SELECT * FROM dbo.GetJobTitle('FI_ACCOUNT')
