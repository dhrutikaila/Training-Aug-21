--CREATRE PROCEDURE 
USE Practice
GO 
CREATE PROCEDURE uspGetEmployeesTest2
	@LastName nvarchar(50),
	@FirstName nvarchar(50)
AS
	SET NOCOUNT ON;
	SELECT FirstName,LastName,DepartmentID
	FROM Employees
	WHERE FirstName=@FirstName AND LastName = @LastName
	
GO

EXEC uspGetEmployeesTest2 N'King',N'Steven'

--ALTER PROCEDURE 
ALTER PROCEDURE uspGetEmployeesTest2
	@EmployeeID INT
AS
	SET NOCOUNT ON;
	SELECT (e.FirstName + ' ' + e.LastName) AS EmployeeName,(e1.FirstName + ' ' + e1.LastName) AS ManagerName,
	DepartmentName AS EmployeeDepartment
	FROM Employees e JOIN Employees e1
	ON E.ManagerID = e1.EmployeeID
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	WHERE e.EmployeeID = @EmployeeID
GO

EXEC uspGetEmployeesTest2 102

--DELETING PROCEDURE
DROP PROCEDURE uspGetEmployeesTest2


--RUN PROCEDURE AUTOMATICALLY
USE AdventureWorks2012;  
GO  
EXEC sp_procoption @ProcName = '<procedure name>'   
    , @OptionName = 'startup'   
    , @OptionValue = 'on';  

--STOP RUNNING PROCEDURE AUTOMATICALLY
USE AdventureWorks2012;  
GO  
EXEC sp_procoption @ProcName = '<procedure name>'   
    , @OptionValue = 'off';  


--OUTPUT PRACTICE
CREATE PROCEDURE tmpproc 
	@cnt INT OUT
AS
BEGIN
	SELECT Count(*) FROM Employees
END

DECLARE @cn INT 
EXEC tmpproc @cnt=@cn


CREATE TABLE Emp2
(
	FirstName varchar(20),
	LastName varchar(20)
)


--INSERTING DATA INTO TABLE USING STORED PROCEDURE
USE ELECTION
CREATE PROCEDURE inst
	@FName varchar(20),
	@Lname varchar(20),
	@StatementType nvarchar(20) = ''
AS
	IF @StatementType='Insert'
	BEGIN
		INSERT INTO PEOPLE VALUES(@FName,@Lname)
	END
	IF @StatementType='Update'
	BEGIN
		UPDATE VOTER SET FirstName=@Lname,LastName=@Lname WHERE FirstName='Chitrank'
	END
	IF @StatementType='Select'
	BEGIN
		SELECT * FROM VOTER
	END

EXEC inst 'Chitrank','Umarania','UPDATE'


	


