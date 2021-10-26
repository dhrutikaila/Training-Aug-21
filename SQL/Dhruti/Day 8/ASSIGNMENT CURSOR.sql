--ASSIGNMENT

--Using cursor implement the following task employee
--Update the salary of the employee using following condition
--Salary between 30000 and 40000 — 5000 hike
--Salary between 40000 and 55000 — 7000 hike
--Salary between 55000 and 65000 — 9000 hike

	    SET NOCOUNT ON
        DECLARE @id INT
        DECLARE myCursor CURSOR
        FOR
        SELECT EmployeeID FROM Employee
        OPEN myCursor
            FETCH NEXT FROM myCursor
            INTO @id
        WHILE @@FETCH_STATUS = 0
            BEGIN
            UPDATE Employee
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
    UPDATE Employee
      SET Salary = case
	  WHEN Salary BETWEEN 20000 AND 25000 THEN Salary + 5000
	  WHEN Salary BETWEEN 10000 AND 20000 THEN Salary + 3000
	  WHEN Salary BETWEEN 1000 AND 10000 THEN Salary + 2000  
	  else Salary
	End

