-- @@CURSOR_ROWS 

USE AdventureWorks2012;  
GO  
SELECT @@CURSOR_ROWS;  
DECLARE Name_Cursor CURSOR FOR  
SELECT LastName ,@@CURSOR_ROWS FROM Person.Person;  
OPEN Name_Cursor;  
FETCH NEXT FROM Name_Cursor;  
SELECT @@CURSOR_ROWS;  
CLOSE Name_Cursor;  
DEALLOCATE Name_Cursor;  
GO


------------------------------------------------------------------------------------------


-- @@FETCH_STATUS

DECLARE Employee_Cursor CURSOR FOR  
SELECT BusinessEntityID, JobTitle  
FROM AdventureWorks2012.HumanResources.Employee;  
OPEN Employee_Cursor;  
FETCH NEXT FROM Employee_Cursor;  
WHILE @@FETCH_STATUS = 0  
   BEGIN  
      FETCH NEXT FROM Employee_Cursor;  
   END;  
CLOSE Employee_Cursor;  
DEALLOCATE Employee_Cursor;  
GO



-------------------------------------------------------------------------------



-- cursor status

CREATE TABLE #TMP  
(  
   ii INT  
)  
GO  
  
INSERT INTO #TMP(ii) VALUES(1)  
INSERT INTO #TMP(ii) VALUES(2)  
INSERT INTO #TMP(ii) VALUES(3)  
  
GO  
  
--Create a cursor.  
DECLARE cur CURSOR  
FOR SELECT * FROM #TMP  
  
--Display the status of the cursor before and after opening  
--closing the cursor.  
  
SELECT CURSOR_STATUS('global','cur') AS 'After declare'  
OPEN cur  
SELECT CURSOR_STATUS('global','cur') AS 'After Open'  
CLOSE cur  
SELECT CURSOR_STATUS('global','cur') AS 'After Close'  
  
--Remove the cursor.  
DEALLOCATE cur  
  
--Drop the table.  
DROP TABLE #TMP




-----------------------------------------------------------------------------------



USE AdventureWorks2012
GO

DECLARE Location_cur CURSOR FOR
SELECT LocationID,Name,CostRate FROM Production.Location
OPEN Location_cur
FETCH NEXT FROM Location_cur
WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM Location_cur
	END
CLOSE Location_cur
DEALLOCATE Location_cur
GO



---------------------------------------------------------------------------------------


USE Demo

DECLARE @empId int, @empName varchar(30), @salary int
DECLARE emp_cur CURSOR STATIC FOR
SELECT Emp_id,First_Name,Salary FROM Employee
OPEN emp_cur
IF @@CURSOR_ROWS > 0
BEGIN
FETCH NEXT FROM emp_cur into @empID,@empName,@salary
WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT 'ID: ' + CONVERT(varchar(30),@empId) + ' Name: ' + @empName + ' Salary: ' + CONVERT(varchar(30),@salary)
		FETCH NEXT FROM emp_cur into @empID,@empName,@salary
	END
END
CLOSE emp_cur
DEALLOCATE emp_cur



--  OR 



DECLARE @empId int, @empName varchar(30), @salary int
DECLARE emp_cur CURSOR FOR
SELECT Emp_id,First_Name,Salary FROM Employee
OPEN emp_cur
FETCH NEXT FROM emp_cur into @empID,@empName,@salary
WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT 'ID: ' + CONVERT(varchar(30),@empId) + ' Name: ' + @empName + ' Salary: ' + CONVERT(varchar(30),@salary)
		FETCH NEXT FROM emp_cur into @empID,@empName,@salary
	END
CLOSE emp_cur
DEALLOCATE emp_cur



-------------------------------------------------------------------------------------------------



-- Scroll cursor

USE AdventureWorks2012

DECLARE perspn_cursor SCROLL CURSOR FOR
SELECT BusinessEntityID,FirstName,LastName,Title FROM Person.Person
OPEN perspn_cursor

FETCH NEXT FROM perspn_cursor
FETCH LAST FROM perspn_cursor
FETCH PRIOR FROM perspn_cursor
FETCH FIRST FROM perspn_cursor
FETCH ABSOLUTE 3 FROM perspn_cursor
FETCH RELATIVE 2 FROM perspn_cursor
FETCH RELATIVE -3 FROM perspn_cursor

CLOSE perspn_cursor
DEALLOCATE perspn_cursor



--------------------------------------------------------------------------------------


use Demo

DECLARE emp_cur INSENSITIVE CURSOR FOR
SELECT Emp_id,First_Name,Last_Name FROM Employee
OPEN emp_cur -- run upto here befor updating
FETCH NEXT FROM emp_cur
WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM emp_cur
	END
CLOSE emp_cur
DEALLOCATE emp_cur

UPDATE Employee
SET First_Name = 'Prit' WHERE Emp_id = 1



------------------------------------------------------------------------------------------


use Demo

DECLARE emp_cur CURSOR FOR
SELECT Emp_id,First_Name,Last_Name FROM Employee
OPEN emp_cur -- run upto here befor updating
FETCH NEXT FROM emp_cur
WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM emp_cur
	END
CLOSE emp_cur
DEALLOCATE emp_cur

UPDATE Employee
SET First_Name = 'John' WHERE Emp_id = 1



------------------------------------------------------------------------------



use Demo

DECLARE emp_cur CURSOR FOR
SELECT Emp_id,First_Name,Last_Name FROM Employee
OPEN emp_cur 
FETCH NEXT FROM emp_cur
FETCH PRIOR FROM emp_cur  -- throws error because by default it is forward only
CLOSE emp_cur
DEALLOCATE emp_cur



---------------------------------------------------------------------------



USE Demo

DECLARE emp_cur CURSOR FOR 
SELECT Emp_id,First_Name,Last_Name FROM Employee WHERE Emp_id < 4
FOR UPDATE OF Last_Name -- Only column with Last_Name can be updated 
OPEN emp_cur 
FETCH NEXT FROM emp_cur
UPDATE Employee SET First_Name = 'John' WHERE CURRENT OF emp_cur  -- throws error
WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM emp_cur
	END
CLOSE emp_cur
DEALLOCATE emp_cur

SELECT * FROM Employee


--------------------------------------------------------------------------------



USE Demo

DECLARE emp_cur CURSOR FOR 
SELECT Emp_id,First_Name,Last_Name FROM Employee
FOR READ ONLY
OPEN emp_cur 
FETCH NEXT FROM emp_cur
WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Employee SET First_Name = 'John' WHERE CURRENT OF emp_cur  -- throw error because cursor is read only
		FETCH NEXT FROM emp_cur
	END
CLOSE emp_cur
DEALLOCATE emp_cur




-----------------------------------------------------------------------------------------------




use Demo

DECLARE emp_cur CURSOR STATIC FOR
SELECT Emp_id,First_Name,Last_Name FROM Employee
OPEN emp_cur -- run upto here befor updating
FETCH NEXT FROM emp_cur
WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM emp_cur
	END
CLOSE emp_cur
DEALLOCATE emp_cur

UPDATE Employee
SET First_Name = 'John' WHERE Emp_id = 1



-------------------------------------------------------------------------------------------------



use Demo

DECLARE emp_cur CURSOR FAST_FORWARD FOR
SELECT Emp_id,First_Name,Last_Name FROM Employee
OPEN emp_cur 
FETCH NEXT FROM emp_cur
WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM emp_cur
	END
CLOSE emp_cur
DEALLOCATE emp_cur



------------------------------------------------------------------------------------------------


use Demo

DECLARE emp_cur CURSOR SCROLL_LOCKS FOR
SELECT Emp_id,First_Name,Last_Name FROM Employee
OPEN emp_cur 
FETCH NEXT FROM emp_cur
WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Employee SET Salary = Salary + 1 WHERE CURRENT OF emp_cur
		FETCH NEXT FROM emp_cur
	END
CLOSE emp_cur
DEALLOCATE emp_cur

SELECT * FROM Employee


-------------------------------------------------------------------------------------------


USE Demo

DECLARE @a varchar(5)
DECLARE cur CURSOR TYPE_WARNING FOR
SELECT Emp_id,First_Name FROM Employee
OPEN cur
SET @a = 1
SELECT @a + ' Hello'
CLOSE cur
DEALLOCATE cur