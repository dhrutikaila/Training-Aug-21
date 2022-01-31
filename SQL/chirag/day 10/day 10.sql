--UPDATE Salary between 30000 and 40000 � 7000 hike



SET NOCOUNT ON 
DECLARE @salary decimal(8,2)
DECLARE UPDATE_cursor CURSOR 

FOR SELECT Salary FROM Employees  where Salary between 30000 and 40000
OPEN UPDATE_cursor
FETCH NEXT FROM UPDATE_cursor INTO @salary
WHILE @@FETCH_STATUS=0
BEGIN
	
	UPDATE Employees SET Salary=salary+5000 WHERE CURRENT OF UPDATE_cursor 
	

FETCH NEXT FROM UPDATE_cursor INTO @salary
	
END
CLOSE UPDATE_cursor
DEALLOCATE UPDATE_cursor
SET NOCOUNT ON 


SELECT * from Employees where Salary>20000



--UPDATE Salary between 40000 and 55000 � 7000 hike




SET NOCOUNT ON 
DECLARE @salary decimal(8,2)
DECLARE UPDATE_cursor CURSOR 

FOR SELECT Salary FROM Employees  where Salary between 40000 and 55000
OPEN UPDATE_cursor
FETCH NEXT FROM UPDATE_cursor INTO @salary
WHILE @@FETCH_STATUS=0
BEGIN
	
	UPDATE Employees SET Salary=salary+7000 WHERE CURRENT OF UPDATE_cursor 
	

FETCH NEXT FROM UPDATE_cursor INTO @salary
	
END
CLOSE UPDATE_cursor
DEALLOCATE UPDATE_cursor
SET NOCOUNT ON 



--UPDATE Salary between 55000 and 65000 � 9000 hike

SET NOCOUNT ON 
DECLARE @salary decimal(8,2)
DECLARE UPDATE_cursor CURSOR 

FOR SELECT Salary FROM Employees  where Salary between 40000 and 55000
OPEN UPDATE_cursor
FETCH NEXT FROM UPDATE_cursor INTO @salary
WHILE @@FETCH_STATUS=0
BEGIN
	
	UPDATE Employees SET Salary=salary+9000 WHERE CURRENT OF UPDATE_cursor 
	

FETCH NEXT FROM UPDATE_cursor INTO @salary
	
END
CLOSE UPDATE_cursor
DEALLOCATE UPDATE_cursor
SET NOCOUNT ON 
