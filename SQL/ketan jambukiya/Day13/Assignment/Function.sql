---Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

CREATE FUNCTION dbo.salary(@sal money)
RETURNS MONEY
AS
BEGIN
DECLARE @hello MONEY
SET @hello=@sal*.12
RETURN @hello
END

SELECT dbo.salary(5000)


----Create a scaler Function which will compute PT which will accept MontlyEarning

CREATE FUNCTION dbo.monthaly(@income int)
RETURNS INT
AS
BEGIN
IF (@income < 5999)
RETURN 0
ELSE IF (@income BETWEEN 6000 AND 8999)
RETURN 80
ELSE IF (@income BETWEEN 9000 AND 11999)
RETURN 150
ELSE IF (@income > 12000)
RETURN 200
RETURN NULL
END


SELECT dbo.monthaly(7000)


----Create a table valued function which will accept JobTitle which will return new table set based on jobtitle

CREATE FUNCTION dbo.Jobdetails(@titlename VARCHAR(30))
RETURNS TABLE
AS
RETURN(SELECT *  FROM JobHistory WHERE JobID=@titlename)



SELECT * FROM dbo.Jobdetails('AC_MGR')
