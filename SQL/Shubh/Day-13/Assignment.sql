--Assignement

--1. Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.
CREATE FUNCTION ufnEmployees1 (@Salary DECIMAL)  
RETURNS DECIMAL   
AS   
	BEGIN
		RETURN @Salary*0.12
	END
GO
SELECT dbo.ufnEmployees1(100) AS 'PF'
GO

--2. Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
CREATE FUNCTION ufnEmployeesPT (@Salary INT)  
RETURNS VARCHAR(50)   
AS   
BEGIN
	RETURN CASE 
		WHEN @Salary < 5999 THEN 'Nil' 
		WHEN @Salary BETWEEN 6000 AND 8999 THEN '80 Rs/Month'
		WHEN @Salary BETWEEN 9000 AND 11999 THEN '150 Rs/Month'
		ELSE '200 Rs/Month'
		END
END		 
GO
SELECT DBO.ufnEmployeesPT(12001) AS 'PT'
GO

--3. Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
CREATE FUNCTION ufnEmployees (@JobTitle VARCHAR(20))  
RETURNS TABLE  
AS  
	RETURN   
	(  
		SELECT EmployeeID, CONCAT(FirstName,' ',LastName) AS 'EmployeeName', JobId AS 'JobTitle', DepartmentID
		FROM Employees
		WHERE JobId = @JobTitle
    )
GO
SELECT * FROM ufnEmployees ('SA_REP')
GO