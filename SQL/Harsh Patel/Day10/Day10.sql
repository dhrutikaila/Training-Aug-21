--CURSOR

--Cursor is a database object which is used to retrive data row by row at a time

--Five Types of fetch 

--FIRST
--LAST
--NEXT
--PRIOR
--ABSOLUTE n
--RELATIVE n

--Declare cursor
--open cursor
--Fetch cursor
--Close cursor
--Deallocate cursor

--@@FETCH_STATUS will indicate if rows are successfully brought back from the cursor
--@@CURSOR_ROWS returns the number of qualifying rows currently in the last cursor opened on the connection.
--[, KEYSET, STATIC, or SCROLL]: All FETCH options are supported, [, FORWARD_ONLY or FAST_FORWARD]: Only NEXT FETCH option are supported,
--[, DYNAMIC SCROLL]: All FETCH options are supported except ABSOLUTE, [, READ_ONLY]: Prevents update or delete made through this cursor. 

SELECT * FROM EMP2


DECLARE cur_emp1 CURSOR
STATIC FOR SELECT * FROM EMP2
OPEN cur_emp1

FETCH LAST FROM cur_emp1
FETCH FIRST FROM cur_emp1
FETCH NEXT FROM cur_emp1
FETCH PRIOR FROM cur_emp1
FETCH ABSOLUTE 4 FROM cur_emp1
FETCH ABSOLUTE -4 FROM cur_emp1
FETCH RELATIVE  1 FROM cur_emp1
FETCH RELATIVE  -2 FROM cur_emp1

CLOSE cur_emp1
DEALLOCATE cur_emp1

--CURSOR Variable

DECLARE cur_emp1 CURSOR
STATIC FOR SELECT ID1,NAME FROM EMP2
OPEN cur_emp1

DECLARE @cur CURSOR
SET @cur=cur_emp1

DECLARE @ID INT, @NAME VARCHAR(20)
IF @@CURSOR_ROWS>0
BEGIN
	FETCH FIRST FROM @cur INTO @ID,@NAME
	PRINT 'ID =' + CAST(@ID AS VARCHAR(20)) + SPACE(2) +'NAME = ' + @NAME
END

CLOSE @cur
DEALLOCATE @cur

--Cursor example
	
	DECLARE cur CURSOR
	STATIC FOR SELECT ID1,NAME FROM EMP2
	OPEN cur
	DECLARE @ID1 INT,@NAME VARCHAR(20)
	IF(@@CURSOR_ROWS>0)
	BEGIN
	FETCH NEXT FROM cur INTO @ID1,@NAME
	WHILE @@FETCH_STATUS=0
	BEGIN
			PRINT 'ID= ' + CAST(@ID1 AS VARCHAR(20)) + SPACE(2) + 'NAME= '+@NAME 
			FETCH NEXT FROM cur INTO @ID1,@NAME
	
	END

	END

	CLOSE cur
	DEALLOCATE cur



--Assignment

--Using cursor implement the following task employee

--Update the salary of the employee using following condition

--Salary between 30000 and 40000 — 5000 hike

--Salary between 40000 and 55000 — 7000 hike

--Salary between 55000 and 65000 — 9000 hike

DECLARE cus CURSOR
DYNAMIC FOR SELECT Salary FROM Employees
OPEN cus


DECLARE @Salary INT
	FETCH NEXT FROM cus INTO @Salary
	WHILE @@FETCH_STATUS=0
BEGIN

			UPDATE Employees
			SET Salary=(CASE
			WHEN Salary between 30000 and 40000 THEN Salary+5000 

			WHEN Salary between 40000 and 55000 THEN Salary+7000 

			WHEN Salary between 55000 and 65000 THEN Salary+9000 
			ELSE Salary
			END)
			 WHERE CURRENT OF cus

			FETCH NEXT FROM cus INTO @Salary
END
	
CLOSE cus

DEALLOCATE cus

 

