/*Using cursor implement the following task employee

Update the salary of the employee using following condition

Salary between 30000 and 40000 — 5000 hike

Salary between 40000 and 55000 — 7000 hike

Salary between 55000 and 65000 — 9000 hike

Update the salary of the employee using following condition

Salary between 30000 and 40000 — 5000 hike

Salary between 40000 and 55000 — 7000 hike

Salary between 55000 and 65000 — 9000 hike*/

SET NOCOUNT ON
        DECLARE @id INT
        DECLARE Employee_Cursor CURSOR
        FOR
        SELECT EmployeeID FROM Employees
        OPEN Employee_Cursor
            FETCH NEXT FROM Employee_Cursor
            INTO @id
        WHILE @@FETCH_STATUS = 0
            BEGIN
            UPDATE Employees
            SET Salary = 
			CASE
            WHEN Salary BETWEEN 30000 AND 40000 THEN Salary + 5000
            WHEN Salary BETWEEN 40000 AND 55000 THEN Salary + 7000
            WHEN Salary BETWEEN 55000 AND 65000 THEN Salary + 9000
            ELSE Salary
            End
            WHERE EmployeeID =@id
            FETCH NEXT FROM Employee_Cursor INTO @id
            END
            
        CLOSE Employee_Cursor
        DEALLOCATE Employee_Cursor
        SET NOCOUNT OFF
	    UPDATE Employees 
        SET Salary = CASE
	    WHEN Salary BETWEEN 30000 AND 40000 THEN Salary + 5000
	    WHEN Salary BETWEEN 40000 AND 55000 THEN Salary + 7000
	    WHEN Salary BETWEEN 55000 AND 65000 THEN Salary + 9000  
	    ElSE Salary
	    END

  