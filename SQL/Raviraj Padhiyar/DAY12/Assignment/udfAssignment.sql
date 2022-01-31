USE SampleTable2

SELECT * FROM Employees

/*Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.*/


CREATE FUNCTION dbo.ufn_CompPF(@baseSalary INT)
RETURNS INT
AS
BEGIN
	RETURN @baseSalary*0.12;
END


SELECT EmployeeID,dbo.ufn_CompPF(Salary) AS PF FROM Employees

DROP FUNCTION dob.ufn_CompPf


/*Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
Monthly Earnings			Profession Tax Payable
Below Rs. 5999				Nil
Rs. 6000 to Rs. 8999		Rs. 80/month
Rs. 9000 to Rs. 11999		Rs. 150/month
Rs 12000 and above			Rs. 200/month
*/


CREATE FUNCTION dbo.ufn_CPT(@mSalary INT)
RETURNS INT
AS
BEGIN
	DECLARE @pt INT;
	IF (@mSalary <= 5999)
		SET @pt = 0;
	IF(@mSalary BETWEEN 6000 AND 8999)
		SET @pt = 80
	IF(@mSalary BETWEEN 9000 AND 11999)
		SET @pt = 150
	IF(@mSalary >= 12000)
		SET @pt = 200;

	RETURN @pt;
END

SELECT EmployeeID,Salary, dbo.ufn_CPT(Salary) AS PT FROM Employees



/*Create a table valued function which will accept JobTitle which will return new table set based on jobtitle*/

SELECT * FROM Employees

CREATE FUNCTION dbo.ufn_GetInfoJN(@jobTitle VARCHAR(20))
RETURNS TABLE
AS
RETURN (
	SELECT * FROM Employees
	WHERE JobId = @jobTitle
)

SELECT * FROM dbo.ufn_GetInfoJN('ST_CLERK')

--used ST_CLERK instead of senior tool designer