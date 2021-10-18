--Salary between 30000 and 40000 — 5000 hike

SET NOCOUNT ON 
DECLARE @salary INT
DECLARE SalaryUpdate_Cursor CURSOR 

FOR SELECT Salary FROM Employees  WHERE Salary between 30000 and 40000
OPEN SalaryUpdate_Cursor
FETCH NEXT FROM SalaryUpdate_Cursor INTO @salary
WHILE @@FETCH_STATUS=0
BEGIN
	
	UPDATE Employees SET Salary=salary+5000 WHERE CURRENT OF SalaryUpdate_Cursor 
	

FETCH NEXT FROM SalaryUpdate_Cursor INTO @salary
	
END
CLOSE SalaryUpdate_Cursor
DEALLOCATE SalaryUpdate_Cursor
SET NOCOUNT ON 

SELECT * FROM Employees

--Salary between 40000 and 55000 — 7000 hike

SET NOCOUNT ON 
DECLARE @salary INT
DECLARE SalaryUpdate_Cursor CURSOR 

FOR SELECT Salary FROM Employees  WHERE Salary between 40000 and 55000
OPEN SalaryUpdate_Cursor
FETCH NEXT FROM SalaryUpdate_Cursor INTO @salary
WHILE @@FETCH_STATUS=0
BEGIN
	
	UPDATE Employees SET Salary=salary+7000 WHERE CURRENT OF SalaryUpdate_Cursor 
	

FETCH NEXT FROM SalaryUpdate_Cursor INTO @salary
	
END
CLOSE SalaryUpdate_Cursor
DEALLOCATE SalaryUpdate_Cursor
SET NOCOUNT ON 

SELECT * FROM Employees



--Salary between 55000 and 65000 — 9000 hike

SET NOCOUNT ON 
DECLARE @Salary INT
DECLARE SalaryUpdate_Cursor CURSOR 

FOR SELECT Salary FROM Employees WHERE Salary between 40000 and 55000
OPEN SalaryUpdate_Cursor
FETCH NEXT FROM SalaryUpdate_Cursor INTO @salary
WHILE @@FETCH_STATUS=0
BEGIN
	
	UPDATE Employees SET Salary=salary+9000 WHERE CURRENT OF SalaryUpdate_Cursor 
	

FETCH NEXT FROM SalaryUpdate_Cursor INTO @salary
	
END
CLOSE SalaryUpdate_Cursor
DEALLOCATE SalaryUpdate_Cursor
SET NOCOUNT ON 

SELECT * FROM Employees




