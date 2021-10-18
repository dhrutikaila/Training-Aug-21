-- CURSOR
USE NewEmpDB
--methods
   --WITHOUT CURSOR VARIABLE 
   --Prior means previous
   DECLARE MyCursor CURSOR SCROLL
   FOR SELECT * FROM Employee
   OPEN MyCursor
   FETCH FIRST FROM MyCursor
   FETCH LAST FROM MyCursor
   FETCH PRIOR FROM MyCursor
   CLOSE MyCursor
   DEALLOCATE MyCursor

   --First
   DECLARE MyCursor CURSOR SCROLL
   FOR SELECT * FROM Employee
   OPEN MyCursor
   FETCH FIRST FROM MyCursor
   CLOSE MyCursor
   DEALLOCATE MyCursor

   --Last
   DECLARE MyCursor CURSOR SCROLL
   FOR SELECT * FROM Employee
   OPEN MyCursor
   FETCH LAST FROM MyCursor
   CLOSE MyCursor
   DEALLOCATE MyCursor
   
   --Next
   DECLARE MyCursor CURSOR SCROLL
   FOR SELECT * FROM Employee
   OPEN MyCursor
   FETCH FIRST FROM MyCursor
   FETCH NEXT FROM MyCursor
   CLOSE MyCursor
   DEALLOCATE MyCursor

   --Absolute n
   DECLARE MyCursor CURSOR SCROLL
   FOR SELECT * FROM Employee
   OPEN MyCursor
   FETCH FIRST FROM MyCursor
   FETCH ABSOLUTE 4 FROM MyCursor
   CLOSE MyCursor
   DEALLOCATE MyCursor

   --Relative n
   DECLARE MyCursor CURSOR SCROLL
   FOR SELECT * FROM Employee
   OPEN MyCursor
   FETCH FIRST FROM MyCursor
   FETCH ABSOLUTE 4 FROM MyCursor
   FETCH RELATIVE -1 FROM MyCursor
   CLOSE MyCursor
   DEALLOCATE MyCursor
-------------------------------------
 --WITHOUT CURSOR VARIABLE 

	DECLARE @TempSalary MONEY
	DECLARE @TempId INT
	-- Declare cursor
	DECLARE CUR_EMP CURSOR 
	STATIC FOR
	SELECT EMPLOYEE_ID,SALARY 
	FROM Employee
	-- Open
	OPEN CUR_EMP
	IF @@CURSOR_ROWS>0
	BEGIN
	-- Fetch
	FETCH NEXT FROM CUR_EMP INTO @TempId,@TempSalary

	WHILE @@FETCH_STATUS = 0
	BEGIN  
		PRINT 'EmployeeId : '+CAST(@TempId AS VARCHAR(10))+' EmployeeSalary : '+CAST(@TempSalary AS VARCHAR(15))

 		FETCH NEXT FROM CUR_EMP INTO @TempId,@TempSalary
	END 
	END
	CLOSE CUR_EMP  
	-- Deallocate
	DEALLOCATE CUR_EMP 
	---------------------------------------

