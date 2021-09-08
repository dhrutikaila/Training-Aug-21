USE Assignment2

-- CURSOR

SELECT * FROM Employees

DECLARE Employees_cursor SCROLL CURSOR 
FOR 
SELECT EmployeeID
	,	FirstName
	,	LastName
	,	Salary
FROM Employees



SET NOCOUNT ON
OPEN Employees_cursor
IF @@CURSOR_ROWS > 0
BEGIN
	DECLARE @empid INT
	DECLARE @firstname VARCHAR(30)
	DECLARE @lastname VARCHAR(30)
	DECLARE @salary DECIMAL(10,2)
	FETCH NEXT FROM Employees_cursor INTO @empid, @firstname, @lastname, @salary
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CONCAT(@empid,':',SPACE(1),@firstname,SPACE(1),@lastname,SPACE(2),'-',SPACE(1),@salary)
		FETCH NEXT FROM Employees_cursor INTO @empid, @firstname, @lastname, @salary
	END
END
CLOSE Employees_cursor

SET NOCOUNT OFF

DEALLOCATE Employees_cursor


-- CREATING CURSOR Using Variable

DECLARE Emp_cursor CURSOR
FOR 
SELECT EmployeeID FROM Employees

DECLARE @curemp CURSOR
DECLARE @empid INT

SET @curemp = Emp_cursor

OPEN @curemp
FETCH NEXT FROM @curemp INTO @empid
PRINT @empid
FETCH NEXT FROM @curemp INTO @empid
PRINT @empid
FETCH PRIOR FROM @curemp INTO @empid
PRINT @empid
FETCH FIRST FROM @curemp INTO @empid
PRINT @empid
FETCH LAST FROM @curemp INTO @empid
PRINT @empid
CLOSE @curemp


OPEN Employees_cursor

FETCH FIRST FROM Employees_cursor
FETCH LAST FROM Employees_cursor

FETCH NEXT FROM Employees_cursor
FETCH PRIOR FROM Employees_cursor

FETCH ABSOLUTE 2 FROM Employees_cursor

FETCH RELATIVE 2 FROM Employees_cursor
FETCH RELATIVE -2 FROM Employees_cursor

CLOSE Employees_cursor


-- Properties of cursor

-- FAST_FORWARD / FORWARD_ONLY   -- for NEXT ONLY

DECLARE Emp_next_cursor CURSOR
FORWARD_ONLY FOR 
SELECT EmployeeID FROM Employees

OPEN Emp_next_cursor

FETCH NEXT FROM Emp_next_cursor

CLOSE Emp_next_cursor

DEALLOCATE Emp_next_cursor

-- STATIC / SCROLL / KEYSET - All options

DECLARE Emp_static_cursor CURSOR
STATIC FOR 
SELECT EmployeeID FROM Employees

OPEN Emp_static_cursor

FETCH NEXT FROM Emp_static_cursor
FETCH LAST FROM Emp_static_cursor

FETCH NEXT FROM Emp_static_cursor
FETCH PRIOR FROM Emp_static_cursor

FETCH ABSOLUTE 2 FROM Emp_static_cursor

FETCH RELATIVE 2 FROM Emp_static_cursor
FETCH RELATIVE -2 FROM Emp_static_cursor

CLOSE Emp_static_cursor 

DEALLOCATE Emp_static_cursor

-- DYNAMIC/ DYNAMIC SCROLL -  All options except ABSOLUTE

DECLARE Emp_dynamic_cursor CURSOR
READ_ONLY DYNAMIC FOR 
SELECT EmployeeID FROM Employees

OPEN Emp_dynamic_cursor

FETCH NEXT FROM Emp_dynamic_cursor
FETCH LAST FROM Emp_dynamic_cursor

FETCH NEXT FROM Emp_dynamic_cursor
FETCH PRIOR FROM Emp_dynamic_cursor

FETCH RELATIVE 2 FROM Emp_dynamic_cursor
FETCH RELATIVE -2 FROM Emp_dynamic_cursor

CLOSE Emp_dynamic_cursor

DEALLOCATE Emp_dynamic_cursor


-- READ_ONLY to prevernt data modification


