USE rxweb_day3

--- Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary. ---

CREATE FUNCTION dbo.GET_PF(@Salary INT)
RETURNS float
AS 
BEGIN 
	RETURN (@Salary * 0.12)
END 

SELECT dbo.GET_PF(Salary) AS PF FROM Employees


---	Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below. ---
ALTER FUNCTION dbo.GET_PT(@Salary INT)
RETURNS INT 
AS
BEGIN
	RETURN (CASE  WHEN @Salary < 5999 THEN 0
				  WHEN  @Salary  BETWEEN 6000 AND 8999 THEN 80
				  WHEN  @Salary  BETWEEN 9000 AND 11999 THEN 150
				  WHEN  @Salary  > 12000 THEN 200
				  END
		)
END 
GO

SELECT dbo.GET_PT(6800)
---Create a table valued function which will accept JobTitle which will return new table set based on jobtitle ---

CREATE FUNCTION Get_Job_Title (@JobTitle VARCHAR(15))
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

SELECT * FROM dbo.Get_Job_Title('IT_PROG')

SELECT * FROM Employees
