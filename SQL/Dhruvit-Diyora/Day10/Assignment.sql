--1.Using cursor implement the following task employee.
--Update the salary of the employee using following condition
--Salary between 30000 and 40000 — 5000 hike,Salary between 40000 and 55000 — 7000 hike,Salary between 55000 and 65000 — 9000 hike
SET NOCOUNT ON
DECLARE @Id INT, @Name VARCHAR(50), @Salary INT

DECLARE Employee_Cursor CURSOR
DYNAMIC FOR
SELECT EmployeeId,FirstName,Salary FROM Employees 

OPEN Employee_Cursor
FETCH FROM Employee_Cursor INTO @Id,@Name,@Salary
WHILE @@FETCH_STATUS = 0 
BEGIN
-- do update operation
UPDATE Employees 
SET Salary= CASE 
                  WHEN @Salary BETWEEN 10000 AND 20000 THEN Salary + 5000
				  WHEN @Salary BETWEEN 20000 AND 25000 THEN Salary + 7000
				  WHEN @Salary BETWEEN 25000 AND 30000 THEN Salary + 9000
                  ELSE @Salary
                  END
WHERE CURRENT OF Employee_Cursor 
-- get next available row into variables
FETCH NEXT FROM Employee_Cursor INTO @Id,@Name,@Salary
END
CLOSE Employee_Cursor
Deallocate Employee_Cursor

--another way
SET NOCOUNT ON
DECLARE @Id INT, @Name VARCHAR(50), @Salary INT

DECLARE Employee_Cursor CURSOR
STATIC FOR
SELECT  EmployeeId,FirstName,Salary FROM Employees 
OPEN Employee_Cursor
IF @@CURSOR_ROWS > 0
BEGIN
FETCH FROM Employee_Cursor INTO @Id,@Name,@Salary
WHILE @@FETCH_STATUS = 0 
WHILE @Id<=15
BEGIN
	  SET @Id=@Id+1
	  SET @Salary = CASE 
                  WHEN @Salary BETWEEN 30000 AND 40000 THEN @Salary + 5000
				  WHEN @Salary BETWEEN 40000 AND 55000 THEN @Salary + 7000
				  WHEN @Salary BETWEEN 55000 AND 80000 THEN @Salary + 9000
                  ELSE @Salary
                  END
	 
BEGIN  
PRINT 'Id: '+ CONVERT(VARCHAR(20),@Id)+', Name:'+@Name+', Salary:'+CONVERT(VARCHAR(20),@Salary)
FETCH NEXT FROM Employee_Cursor INTO @Id,@Name,@Salary
END
END
END
