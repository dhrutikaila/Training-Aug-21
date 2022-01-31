--Using cursor implement the following task employee

--Update the salary of the employee using following condition

--Salary between 3000 and 4000 — 500 hike

--Salary between 4000 and 5500 — 700 hike

--Salary between 5500 and 6500 — 900 hike


DECLARE Employees_salary_cursor CURSOR
SCROLL FOR
SELECT Salary
FROM Employees



OPEN Employees_salary_cursor

IF @@CURSOR_ROWS > 0
BEGIN
	DECLARE @salary DECIMAL(10,2)
	DECLARE @hike DECIMAL(10,2) = 0.00

	FETCH FIRST FROM Employees_salary_cursor INTO @salary
	SET NOCOUNT ON
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
		WHERE CURRENT OF Employees_salary_cursor

		FETCH NEXT FROM Employees_salary_cursor INTO @salary
		SET @hike = 0.00

	END
	SET NOCOUNT OFF
END

CLOSE Employees_salary_cursor

DEALLOCATE Employees_salary_cursor

SELECT * FROM Employees

