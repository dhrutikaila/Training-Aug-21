CREATE FUNCTION Addition(@Num1 INT,@Num2 INT)
RETURNS INT
AS
BEGIN
DECLARE @Result INT
SET @Result=@Num1+@Num2
RETURN @Result
END


SELECT dbo.Addition(5,7) AS 'SUM'
--------------------------------------------------------------------

SELECT * FROM Employees


CREATE FUNCTION FULLNAME (@EmpID INT)
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @FName VARCHAR(50)
SELECT @FName=CONCAT(FirstName,' ',LastName) FROM Employees WHERE EmployeeID=@EmpID
RETURN @FName
END


SELECT dbo.FULLNAME(114)

SELECT firstname ,dbo.FULLNAME(134) FROM Employees
-----------------------------------------------------



CREATE FUNCTION EMPDETAIL (@EmpID INT)
RETURNS table
AS
RETURN 
 SELECT * FROM Employees WHERE EmployeeID=@EmpID

 SELECT * FROM EMPDETAIL(145)

 drop function EMPDETAIL



-----------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION EMPINFO(@EmpId INT)
RETURNS TABLE
AS
RETURN SELECT * FROM Employees WHERE EmployeeID=@EmpId


SELECT * FROM EMPINFO(125)


--------------------------------------------------------------------------------------
ALTER FUNCTION EMPDATA(@EmpId INT)
RETURNS @Detail TABLE (EMPID INT,EMAILID VARCHAR,DEPID INT)
AS
BEGIN 
	INSERT INTO @Detail
	SELECT EmployeeID,Email,DepartmentID FROM Employees WHERE EmployeeID=@EmpId
	RETURN
END


SELECT * FROM DBO.EMPDATA(157)


-----------------------------------------------------------------------------------------------
CREATE FUNCTION LOCDATA(@LOCId INT)
RETURNS @Detail TABLE (LOCID INT,ADDRESS VARCHAR,POSTCODE INT,STATEPRO VARCHAR ,COUNTRYID VARCHAR)
AS
BEGIN 
	INSERT INTO @Detail
	SELECT * FROM Locations WHERE LocationID=@LOCId
	RETURN
END

--------------------------------------------------------------

SELECT * FROM Departments
CREATE FUNCTION DEPDATA(@DepId INT)
RETURNS @Table TABLE (DepartmentID int, DepartmentName varchar,ManagerID int,LocationID int)
AS
BEGIN
	INSERT INTO @Table
	SELECT * FROM Departments WHERE DepartmentID=@DepId
	RETURN
END