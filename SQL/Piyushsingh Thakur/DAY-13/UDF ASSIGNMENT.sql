USE DAY11


--1)Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
CREATE FUNCTION PFCHECK(@Salary DECIMAL)
RETURNS DECIMAL
AS
BEGIN
DECLARE @Result INT
SET @Result=@Salary*0.12
--SELECT @Result=(SELECT Salary%12 FROM Employees WHERE EmployeeID=@EmpId AND Salary=@Salary)
RETURN @Result
END


SELECT dbo.PFCHECK(22000) AS PF

select * from Employees


--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
CREATE FUNCTION PT(@ME INT)
RETURNS INT
AS
BEGIN
DECLARE @Result INT
	 RETURN
	 CASE 
		WHEN @ME<5900 THEN 0
		WHEN @ME BETWEEN 6000 AND 8999 THEN 80
		WHEN @ME BETWEEN 9000 AND 11999 THEN 150
		WHEN @ME >1200 THEN 200
		ELSE 0
	END

END

SELECT dbo.PT(150000)


---------------------------------------------------

--3)Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
CREATE FUNCTION TITLE (@JobTitle VARCHAR(20))  
RETURNS TABLE  
AS  
	RETURN   
	(  
		SELECT EmployeeID, CONCAT(FirstName,' ',LastName) AS 'EmployeeName', JobId AS 'JobTitle', DepartmentID
		FROM Employees
		WHERE JobId = @JobTitle
    )

SELECT * FROM TITLE ('SA_REP')

SELECT * from TITLE('IT_PROG')
GO


