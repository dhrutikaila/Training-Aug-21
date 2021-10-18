/*
 Query 1

UPDATE the salary of the employee using following condition

Salary between 30000 and 40000 — 5000 hike

Salary between 40000 and 55000 — 7000 hike

Salary between 55000 and 65000 — 9000 hike
*/

DECLARE DefaultCursor CURSOR
FOR
SELECT EmployeeID,FirstName FROM Employees
 FOR UPDATE of [Salary]
OPEN DefaultCursor
FETCH NEXT FROM DefaultCursor
while @@FETCH_STATUS=0
begin
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1) 
UPDATE Employees set Salary=Salary+5000 where Salary between 3000 and 4000;

UPDATE Employees set Salary=Salary+7000 where Salary between 4000 and 5500;

UPDATE Employees set Salary=Salary+9000 where Salary between 5500 and 6500;
FETCH NEXT FROM DefaultCursor 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
close DefaultCursor
deallocate DefaultCursor
SELECT * FROM Employees


