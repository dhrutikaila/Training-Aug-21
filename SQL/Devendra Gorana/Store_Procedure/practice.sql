--Store procedure 
--Create Store procedure
CREATE PROCEDURE SelectAllEmployee
AS
SELECT * FROM Employees


--Execute Store procedure
EXEC SelectAllEmployee

--Create store procedure with parameter
CREATE PROCEDURE SelectName
@FirstName nvarchar(50),
@LastName nvarchar(50)
AS
SELECT FirstName, LastName FROM Employees 
WHERE FirstName = @FirstName AND LastName = @LastName


EXECUTE  SelectName @FirstName = 'Devil', @LastName = 'King'


--Delete the the Store Procedure
DROP PROCEDURE SelectName 
EXECUTE SelectName

--Rename the store procedure
EXEC sp_rename 'SelectAllEmployee', 'AllEmployee'
EXECUTE AllEmployee

--Rcompile the store procedure
EXEC sp_recompile 'AllEmployee'
EXEC AllEmployee


CREATE PROCEDURE SelectAllEmployee
AS
SELECT * FROM Employees
RETURN

--Execute Store procedure
EXEC SelectAllEmployee

--view definition
EXEC sp_helptext 'AllEmployee'







