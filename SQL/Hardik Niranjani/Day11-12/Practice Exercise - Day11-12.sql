-----------------------------------------------------------------------------------------------------

--Create Store Procedures
CREATE PROCEDURE spGetEmployees
AS 
BEGIN
	SELECT * FROM Employees
END

--1st Way
spGetEmployees

--2nd Way
EXEC spGetEmployees

--3rd Way
Execute spGetEmployees

-------------------------------------------------------------------------------------------------------

--Store Procedures with Parameters

CREATE PROCEDURE spGetManagerDetails
@Manager_Id INT
AS
BEGIN
	SELECT * FROM Employees
	WHERE EmployeeID = @Manager_Id
END

EXEC spGetManagerDetails 103

-----------------------------------------------------------------------------------------------------

--System Store Procedure

sp_helptext spGetManagerDetails

sp_help spGetManagerDetails

-----------------------------------------------------------------------------------------------------

--Alter Store Procedure

ALTER PROCEDURE spGetEmployees
AS 
BEGIN
	SELECT EmployeeID, FirstName, LastName,JobId,Salary,ManagerID FROM Employees
	ORDER BY Salary DESC
END

EXEC spGetEmployees

-----------------------------------------------------------------------------------------------------

--Drop Procedure

DROP PROCEDURE spGetEmployees


-----------------------------------------------------------------------------------------------------

--Encryption in Store Procedure

CREATE PROCEDURE spGetEmployeesDetails
AS 
BEGIN
	SELECT EmployeeID, FirstName, LastName,JobId,Salary,HireDate 
	FROM Employees
END

EXEC spGetEmployeesDetails

sp_helptext spGetEmployeesDetails  


ALTER PROCEDURE spGetEmployeesDetails
WITH ENCRYPTION
AS 
BEGIN
	SELECT EmployeeID, FirstName, LastName,JobId,Salary,HireDate 
	FROM Employees
END

-----------------------------------------------------------------------------------------------------

--Store Procedure with Output Parameters

CREATE PROCEDURE spGetEmployeeHireDate
@EmployeeCount INT OUTPUT
AS
BEGIN
	SELECT @EmployeeCount= COUNT(EmployeeID) 
	FROM Employees
	WHERE MONTH(HireDate) = 6
END  

DECLARE @TotalEmployee INT 
EXEC spGetEmployeeHireDate @TotalEmployee OUT
PRINT @TotalEmployee