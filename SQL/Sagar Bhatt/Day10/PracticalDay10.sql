USE Day2

SELECT *
FROM Employees

--Cursor
/*	Update the salary of the employee using following conditions:
		Salary between 30000 and 40000 — 5000 hike
		Salary between 40000 and 55000 — 7000 hike
		Salary between 55000 and 65000 — 9000 hike
*/

SET NOCOUNT ON
DECLARE employees_salary_cursor CURSOR
SCROLL FOR
	SELECT Salary
	FROM Employees
OPEN employees_salary_cursor
IF (@@CURSOR_ROWS > 0)
BEGIN
	DECLARE @salary MONEY, @hike MONEY = 0
	FETCH FIRST FROM employees_salary_cursor INTO @salary
	
	WHILE @@FETCH_STATUS = 0
	BEGIN	
		IF(@salary>=3000 AND @salary<4000)
			SET @hike = 500
		IF(@salary>=4000 AND @salary<5500)
			SET @hike = 700
		IF(@salary>=5500 AND @salary<=6500)
			SET @hike = 900
		
		UPDATE Employees
		SET Salary += @hike
		OUTPUT INSERTED.EmployeeID AS 'Employee ID'
			,	DELETED.Salary AS 'Old Salary'
			,	INSERTED.Salary AS 'New Salary'	
		WHERE CURRENT OF employees_salary_cursor
		FETCH NEXT FROM employees_salary_cursor INTO @salary
		SET @hike = 0
	END

END
CLOSE employees_salary_cursor
DEALLOCATE employees_salary_cursor
SET NOCOUNT OFF

SELECT *
FROM Employees