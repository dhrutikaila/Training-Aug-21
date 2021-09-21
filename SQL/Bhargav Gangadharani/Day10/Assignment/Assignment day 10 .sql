-- Assignment :
--Using cursor implement the following task employee , Update the salary of the employee using following condition
--Salary between 30000 and 40000 — 5000 hike
--Salary between 40000 and 55000 — 7000 hike
--Salary between 55000 and 65000 — 9000 hike

select * into temp from Employees

SET NOCOUNT ON
DECLARE Sal_Cursor CURSOR  FOR
SELECT * FROM temp FOR UPDATE OF Salary
OPEN Sal_Cursor
FETCH NEXT FROM Sal_Cursor
WHILE @@FETCH_STATUS = 0
   BEGIN
      UPDATE temp
        SET Salary = CASE
                WHEN Salary >= 30000 AND Salary < 40000 THEN Salary+5000
                WHEN Salary >= 40000 AND Salary < 55000 THEN Salary+7000
                WHEN Salary >= 55000 AND Salary < 65000 THEN Salary+9000
                ELSE Salary
            END
        WHERE CURRENT OF Sal_Cursor
      FETCH NEXT FROM Sal_Cursor;
   END;
CLOSE Sal_Cursor;
DEALLOCATE Sal_Cursor;
SET NOCOUNT OFF
  