
--UDF ==================

--Scalar UDF ===========
CREATE FUNCTION CustomerAge(@Date Date)
RETURNS INT 
AS
BEGIN
DECLARE @Age INT

SET @Age = DATEDIFF(YEAR, @Date, GETDATE()) 

RETURN @Age
END

--Use Function
SELECT dbo.CustomerAge('2005/12/24') AS [Age]

--Use Function in Table
SELECT dbo.CustomerAge(JOINING_DATE) AS [Age] FROM Employee_Cursor

-- =======================================

-- Inline Table Value Function

CREATE FUNCTION Employees_JobId(@JobId VARCHAR(20))
RETURNS TABLE 
AS 
RETURN 
(
	SELECT * FROM Employees
	WHERE JobId = @JobId
)



UPDATE Employees_JobId('IT_PROG') SET FirstName = 'Mike' WHERE EmployeeID = 103

SELECT * FROM Employees_JobId('IT_PROG')
SELECT * FROM Employees WHERE EmployeeID = 103


----------------------------------------------------

--Use  Inline Table Value Function With Other Table 

SELECT * FROM Employees_JobId('SA_REP') AS e
		 JOIN Departments AS d
		 ON e.DepartmentID = d.DepartmentID

		

----------------------------------------------------

--Multi-Statement Table Value Function


CREATE FUNCTION Fn_EmployeeDetails()
RETURNS @Table Table (ID decimal(6,0), [NAME] VARCHAR(45),PhoneNumber VARCHAR(20),JobId VARCHAR(10), Salary DECIMAL(8,2))
AS 
BEGIN
		INSERT INTO @Table
		SELECT EmployeeID,[NAME] = FirstName+SPACE(1)+LastName,PhoneNumber, JobId, Salary  FROM Employees
RETURN
END

 
SELECT * FROM dbo.Fn_EmployeeDetails()

----------------------------------------------------

--DROP Function
DROP FUNCTION Employees_JobId