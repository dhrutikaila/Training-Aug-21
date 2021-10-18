
--Using cursor implement the following task employee
--  Update the salary of the employee using following condition
--  Salary between 30000 and 40000 — 5000 hike
--  Salary between 40000 and 55000 — 7000 hike
--  Salary between 55000 and 65000 — 9000 hike

SET NOCOUNT ON
DECLARE  @ID INT,@Salary DECIMAL(8,2) 
DECLARE Employee_Salary CURSOR
STATIC FOR
SELECT EmployeeID,Salary FROM Employees
OPEN Employee_Salary
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM Employee_Salary INTO @ID,@Salary
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		UPDATE Employees SET Salary += 
		CASE 
		WHEN @Salary BETWEEN 30000 AND 40000 THEN 5000
		WHEN @Salary BETWEEN 40001 AND 55000 THEN 7000
		WHEN @Salary BETWEEN 55001 AND 65000 THEN 9000
		ELSE 0
		END 
		WHERE EmployeeID = @ID
		FETCH NEXT FROM Employee_Salary INTO @ID, @Salary
	END
END
CLOSE Employee_Salary
DEALLOCATE Employee_Salary
SET NOCOUNT OFF



SELECT * FROM Employees