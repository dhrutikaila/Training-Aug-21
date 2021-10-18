--CREATE SCALAR FUNCTION
CREATE FUNCTION udfCalculateAge(@DOB DATE)
RETURNS INT
AS 
BEGIN
DECLARE @Age INT

SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -
                 CASE
				    WHEN (MONTH(@DOB)>MONTH(GETDATE())) OR
					     (MONTH(@DOB)=MONTH(GETDATE())) AND
						 (DAY(@DOB)> DAY(GETDATE()))
			    	THEN 1
				    ELSE 0
                 END
RETURN @Age
END

SELECT dbo.udfCalculateAge('10/08/1999')


--INLINE TABLE VALUED FUNCTION
CREATE FUNCTION udfEmployeesByManager(@Manager INT)
RETURNS TABLE
AS
RETURN (SELECT * FROM Employees
        WHERE ManagerID = @Manager)

SELECT * FROM  udfEmployeesByManager(100) E
JOIN Departments D
ON D.DepartmentID=E.DepartmentID

--Multi Statement Table Valued Function
CREATE FUNCTION udfEmployeesByManagerMSTVF(@Manager INT)
RETURNS @Table TABLE (ID INT, Name NVARCHAR(20),Manager NVARCHAR(20))
AS
BEGIN
       INSERT INTO @Table
	   SELECT EmployeeID,FirstName,ManagerID FROM Employees
        WHERE ManagerID = @Manager

		RETURN
END

SELECT * FROM udfEmployeesByManagerMSTVF(100)


--Inline Table valued functions are updatable
UPDATE dbo.udfEmployeesByManager(100)
SET FirstName='Neen'
WHERE EmployeeID=101

--Multi statment table valued functions can not be updated
UPDATE dbo.udfEmployeesByManagerMSTVF(100)
SET Name='Neen'
WHERE ID=101