--CREATE--EXECUTE--DROP sp
CREATE PROC spGetEmployees
AS
BEGIN
     SELECT * FROM Employees
END

spGetEmployees
EXECUTE spGetEmployees
EXEC spGetEmployees

DROP PROCEDURE spGetEmployees



--sp with parameters--
CREATE PROC spGetEmployeesBySalaryAndDepartment
@Salary MONEY,
@Department INT
AS
BEGIN
     SELECT * FROM Employees
	 WHERE Salary = @Salary
	   AND DepartmentID=@Department
END

spGetEmployeesBySalaryAndDepartment 9000,60
spGetEmployeesBySalaryAndDepartment @Department=60, @Salary=9000

DROP PROCEDURE spGetEmployeesBySalaryAndDepartment



--System sp--
sp_helptext spGetEmployeesBySalaryAndDepartment
sp_help spGetEmployeesBySalaryAndDepartment
sp_depends spGetEmployeesBySalaryAndDepartment


--ALTER sp--
ALTER PROC spGetEmployeesBySalaryAndDepartment
@Salary MONEY,
@Department INT
AS
BEGIN
     SELECT * FROM Employees
	 WHERE Salary = @Salary
	   AND DepartmentID=@Department
	ORDER BY DepartmentID
END


--Encrypted sp--
ALTER PROC spGetEmployeesBySalaryAndDepartment
@Salary MONEY,
@Department INT
WITH ENCRYPTION
AS
BEGIN
     SELECT * FROM Employees
	 WHERE Salary = @Salary
	   AND DepartmentID=@Department
	ORDER BY DepartmentID
END


--OUTPUT--
CREATE PROC spGetEmployeesWithOutput
@EmployeeCount INT OUTPUT,
@Department INT
AS
BEGIN
     SELECT @EmployeeCount=COUNT(*) FROM Employees
	 WHERE DepartmentID=@Department
END

DECLARE @CountOfEmployee INT
EXECUTE spGetEmployeesWithOutput @CountOfEmployee OUTPUT,60
IF(@CountOfEmployee IS NULL)
   PRINT 'Count is null '
ELSE
   PRINT @CountOfEmployee


--RETURN--
CREATE PROC spGetEmployeesWithReturn
@Department INT
AS
BEGIN
    RETURN( SELECT COUNT(*) FROM Employees
	        WHERE DepartmentID=@Department)
END


DECLARE @CountOfEmployees INT
EXECUTE @CountOfEmployees= spGetEmployeesWithReturn 60
PRINT @CountOfEmployees

--Advantages--
--Execution plan reusability
--Network TRaffic reduction