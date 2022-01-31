--1

CREATE PROCEDURE spGetEmployee
AS
BEGIN
SELECT FirstName,Salary FROM Employees
END

EXEC spGetEmployee;

sp_helptext spGetEmployee;

--2

CREATE PROCEDURE spGetEmployeeById
@id INT
AS
BEGIN
SELECT * FROM Employees WHERE EmployeeId = @id
END

EXEC spGetEmployee(101)

--3

CREATE PROCEDURE spGetEmployeeById
@id INT
@Name VARCHAR(50)
AS
BEGIN
SELECT * FROM Employees WHERE EmployeeId = @id AND Name = @Name
END

EXEC spGetEmployee 101,'Neena';

--4 The text for object 'spGetEmployee' is encrypted.

ALTER PROCEDURE spGetEmployee
WITH ENCRYPTION
AS
BEGIN
SELECT FirstName,Salary FROM Employees
END

EXEC spGetEmployee;
sp_helptext spGetEmployee;