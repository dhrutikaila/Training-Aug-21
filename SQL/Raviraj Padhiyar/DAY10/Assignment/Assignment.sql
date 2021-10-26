--Using cursor implement the following task employee

--Update the salary of the employee using following condition

--Salary between 30000 and 40000 — 5000 hike

--Salary between 40000 and 55000 — 7000 hike

--Salary between 55000 and 65000 — 9000 hike



SET NOCOUNT ON
DECLARE Salary_Cursor CURSOR  FOR
SELECT Salary FROM Employees 
FOR UPDATE OF Salary

OPEN Salary_Cursor
FETCH NEXT FROM Salary_Cursor

WHILE @@FETCH_STATUS = 0
   BEGIN
      UPDATE Employees
        SET Salary = CASE
                WHEN Salary >= 4000 AND Salary < 8000 THEN Salary+2000
                WHEN Salary >= 8000 AND Salary < 15000 THEN Salary+3000
                WHEN Salary >= 15000 AND Salary < 30000 THEN Salary+5000
                ELSE Salary
            END
      FETCH NEXT FROM Salary_Cursor;
   END;
CLOSE Salary_Cursor;
DEALLOCATE Salary_Cursor;