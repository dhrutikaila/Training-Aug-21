----------------DAY-10----------------
--Using cursor implement the following task employee

--Update the salary of the employee using following condition
SELECT Salary FROM Employees;
DECLARE sal_cursor CURSOR FOR
SELECT Salary FROM Employees
ORDER BY Salary;
OPEN sal_cursor;
DECLARE @salary INT;
FETCH NEXT FROM sal_cursor
INTO @salary;
WHILE @@FETCH_STATUS = 0
BEGIN
--Salary between 30000 and 40000 — 5000 hike
--Salary between 40000 and 55000 — 7000 hike
--Salary between 55000 and 65000 — 9000 hike
	UPDATE Employees
	SET Salary = CASE
	WHEN @salary> 30000 AND @salary<40000 THEN Salary+5000
	WHEN @salary> 40000 AND @salary< 55000 THEN Salary+7000
	WHEN @salary> 55000 AND @salary< 65000 THEN Salary+9000
	ELSE @salary
	END
	--IF @salary  BETWEEN 30000 AND 40000 THEN @salary +=5000;
	--ELSE IF @salary  BETWEEN 40000 AND 55000 THEN @salary +=7000;
	--ELSE IF @salary  BETWEEN 55000 AND 65000 THEN @salary +=9000;
	--ELSE @salary;
	--END IF;
	FETCH NEXT FROM sal_cursor
	INTO @salary;

END
CLOSE sal_cursor;
DEALLOCATE sal_cursor;

