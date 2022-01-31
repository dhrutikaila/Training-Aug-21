--Using cursor implement the following task employee
--Update the salary of the employee using following condition
----------------------------------------------------------------
--Salary between 30000 and 40000 — 5000 hike

UPDATE Employees SET Salary = 35000 WHERE EmployeeID = 202

DECLARE @Salary INT 
DECLARE @Hike INT 
SET @Hike = 5000

DECLARE Update_Salary CURSOR 
FOR SELECT Salary FROM Employees WHERE Salary BETWEEN 30000 AND 40000
FOR UPDATE OF Salary 

OPEN Update_Salary 

FETCH NEXT FROM Update_Salary INTO @Salary  
WHILE @@FETCH_STATUS = 0 
BEGIN 
SET @Salary = @Salary + @Hike 

UPDATE Employees 
SET Salary = @Salary 
WHERE CURRENT OF Update_Salary 
FETCH NEXT FROM Update_Salary INTO @Salary 
END 

CLOSE Update_Salary 
DEALLOCATE Update_Salary 


----------------------------------------------------------------
--Salary between 40000 and 55000 — 7000 hike
DECLARE @Salary INT 
DECLARE @Hike INT 
SET @Hike = 7000

DECLARE Update_Salary CURSOR 
FOR SELECT Salary FROM Employees WHERE Salary BETWEEN 40000 AND 55000
FOR UPDATE OF Salary 

OPEN Update_Salary 

FETCH NEXT FROM Update_Salary INTO @Salary  
WHILE @@FETCH_STATUS = 0 
BEGIN 
SET @Salary = @Salary + @Hike 

UPDATE Employees 
SET Salary = @Salary 
WHERE CURRENT OF Update_Salary 
FETCH NEXT FROM Update_Salary INTO @Salary 
END 

CLOSE Update_Salary 
DEALLOCATE Update_Salary 


--------------------------------------------------------------------
--Salary between 55000 and 65000 — 9000 hike
DECLARE @Salary INT 
DECLARE @Hike INT 
SET @Hike = 9000

DECLARE Update_Salary CURSOR 
FOR SELECT Salary FROM Employees WHERE Salary BETWEEN 55000 AND 65000
FOR UPDATE OF Salary 

OPEN Update_Salary 

FETCH NEXT FROM Update_Salary INTO @Salary  
WHILE @@FETCH_STATUS = 0 
BEGIN 
SET @Salary = @Salary + @Hike 

UPDATE Employees 
SET Salary = @Salary 
WHERE CURRENT OF Update_Salary 
FETCH NEXT FROM Update_Salary INTO @Salary 
END 

CLOSE Update_Salary 
DEALLOCATE Update_Salary 

---------------------------------------------------------------------------
SELECT * FROM Employees