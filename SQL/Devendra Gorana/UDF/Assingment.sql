--Assingment 1
--Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

ALTER FUNCTION PF_Cal (@BasicSalary int) 
RETURNS float 
AS
BEGIN 
	RETURN (@BasicSalary * 0.12)
END
Go

PRINT dbo.PF_Cal (1000)

----------------------------------------------------------------------------------------------
--Create function to calculate the pf of all employees in employee table
CREATE FUNCTION PF (@EmpID int)  
RETURNS int   
AS 
BEGIN  
DECLARE @salary int;  
SELECT @salary = (Salary * 0.12) FROM Employees 
WHERE EmployeeID = @EmpID 
RETURN @salary;
END
GO

SELECT FirstName, LastName, Salary, dbo.PF (EmployeeID) AS Pf FROM Employees

-----------------------------------------------------------------------------------------------------
--Assingment 2
--Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
/*
Monthly Earnings	Profession Tax Payable
Below Rs. 5999	Nil
Rs. 6000 to Rs. 8999	Rs. 80/month
Rs. 9000 to Rs. 11999	Rs. 150/month
Rs 12000 and above	Rs. 200/month
*/
CREATE FUNCTION PT_Cal(@MonthlyEarning Int)
RETURNS Int
AS 
BEGIN 
DECLARE @PT DECIMAL(10,2) 
SET @PT = CASE
	WHEN @MonthlyEarning <=5999 THEN NULL
	WHEN @MonthlyEarning BETWEEN 6000 AND 8999 THEN 80
	WHEN @MonthlyEarning BETWEEN 9000 AND 11999 THEN 150
	WHEN @MonthlyEarning >=12000 THEN 200
END
RETURN @PT
END

SELECT FirstName,LastName,Salary,ISNULL(dbo.PT_Cal(Salary),0) AS 'PT/Month' FROM Employees

--Assingment 3
--Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
CREATE FUNCTION JobDetail(@JobTitle varchar(30))
RETURNS @JobDetail TABLE
(
	FirstName varchar(20),
	LastName varchar(20),
	Salary int,
	JobTitle varchar(20)
)
AS
BEGIN
INSERT INTO @JobDetail
SELECT FirstName,LastName,Salary,JobId FROM Employees WHERE JobId=@JobTitle
RETURN 
END

SELECT * FROM dbo.JobDetail('IT_PROG')
