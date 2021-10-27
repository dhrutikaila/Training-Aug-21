DECLARE @salary DECIMAL(8,2);
---declare cursor
DECLARE update_salary CURSOR 
DYNAMIC FOR
  SELECT Salary
  FROM Employees 

--OPEN CURSOR
OPEN update_salary ;

--loop through cursor

FETCH NEXT FROM update_salary INTO @salary;
WHILE @@FETCH_STATUS=0
	BEGIN
	
	UPDATE Employees SET Salary=
	(
	CASE 
	WHEN Salary BETWEEN 30000 and 40000 THEN Salary+5000
	WHEN Salary BETWEEN 40000 and 55000  THEN Salary+7000
	WHEN Salary BETWEEN 55000 and 65000 THEN Salary+9000
	ELSE Salary
	END
	)
	WHERE CURRENT OF update_salary
	
	FETCH NEXT FROM update_salary INTO @salary
	END

CLOSE update_salary
DEALLOCATE update_salary


SELECT * FROM Employees




