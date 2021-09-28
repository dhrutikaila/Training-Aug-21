-- Using cursor implement the following task employee

/* Update the salary of the employee using following condition

Salary between 1000 and 10000 — 2000 hike

Salary between 10000 and 20000 — 3000 hike

Salary between 20000 and 25000 — 5000 hike */


        SET NOCOUNT ON
        DECLARE @id INT
        DECLARE myCursor CURSOR
        FOR
        SELECT EmployeeID FROM Employees
        OPEN myCursor
            FETCH NEXT FROM myCursor
            INTO @id
        WHILE @@FETCH_STATUS = 0
            BEGIN
            UPDATE Employees
            SET Salary = case
            WHEN Salary BETWEEN 20000 AND 25000 THEN Salary + 5000
            WHEN Salary BETWEEN 10000 AND 20000 THEN Salary + 3000
            WHEN Salary BETWEEN 1000 AND 10000 THEN Salary + 2000
            else Salary
            End
            WHERE EmployeeID =@id
            FETCH NEXT FROM myCursor INTO @id
            END
            
        CLOSE myCursor
        DEALLOCATE myCursor
        SET NOCOUNT OFF

-- we can do this query by simple update statement with case
    UPDATE Employees 
      SET Salary = case
	  WHEN Salary BETWEEN 20000 AND 25000 THEN Salary + 5000
	  WHEN Salary BETWEEN 10000 AND 20000 THEN Salary + 3000
	  WHEN Salary BETWEEN 1000 AND 10000 THEN Salary + 2000  
	  else Salary
	End


