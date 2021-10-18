/* Using cursor implement the following task employee
Update the salary of the employee using following condition
Salary between 30000 and 40000 — 5000 hike
Salary between 40000 and 55000 — 7000 hike
Salary between 55000 and 65000 — 9000 hike */


DECLARE @salary int
DECLARE update_salary_cursor CURSOR FOR
SELECT Salary FROM Employee
OPEN update_salary_cursor

FETCH NEXT FROM update_salary_cursor into @salary

WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @salary >= 30000 AND @salary < 40000
			UPDATE Employee SET Salary = @salary + 5000 WHERE CURRENT OF update_salary_cursor
		IF @salary >= 40000 AND @salary < 55000
			UPDATE Employee SET Salary = @salary + 7000 WHERE CURRENT OF update_salary_cursor
		IF @salary >= 55000 AND @salary <= 65000
			UPDATE Employee SET Salary = @salary + 9000 WHERE CURRENT OF update_salary_cursor

		FETCH NEXT FROM update_salary_cursor into @salary
	END

CLOSE update_salary_cursor
DEALLOCATE update_salary_cursor


SELECT * FROM Employee





------------------------------------------------------------------------------------




DECLARE update_salary_cursor CURSOR FOR
SELECT Salary FROM Employee
OPEN update_salary_cursor

FETCH NEXT FROM update_salary_cursor

WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Employee SET salary =

		CASE 
		WHEN salary BETWEEN 30000 AND 40000 THEN salary + 5000 
		WHEN salary BETWEEN 40000 AND 55000 THEN salary + 7000 
		WHEN salary BETWEEN 55000 AND 65000 THEN salary + 9000
		ELSE Salary
		END
		WHERE CURRENT OF update_salary_cursor

		FETCH NEXT FROM update_salary_cursor
	END

CLOSE update_salary_cursor
DEALLOCATE update_salary_cursor


SELECT * FROM Employee