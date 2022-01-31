-- cursor
DECLARE emp CURSOR  
    FOR SELECT * FROM HumanResources.Employee  
OPEN emp  
FETCH NEXT FROM emp
Deallocate emp


-- Cursor with fetch status
DECLARE Employee_Cursor CURSOR FOR  
SELECT BusinessEntityID, JobTitle  
FROM HumanResources.Employee
OPEN Employee_Cursor
FETCH NEXT FROM Employee_Cursor 
WHILE @@FETCH_STATUS = 0  
   BEGIN  
      FETCH NEXT FROM Employee_Cursor
   END;  
CLOSE Employee_Cursor
DEALLOCATE Employee_Cursor
GO  

--local cursor
Declare Emp_cursor cursor local -- create cursor locally
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor


--global cursor
Declare Emp_cursor cursor global -- creates cursor globally
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor


-- Fetch Type
Declare Emp_cursor cursor Scroll
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor -- will fetch next row
fetch prior from Emp_cursor -- will fetch previous row
fetch first from Emp_cursor -- will fetch first row
fetch last from Emp_cursor -- will fetch last row
fetch absolute 10 from Emp_cursor -- will fetch 10th row 
fetch relative 10 from Emp_cursor -- will fetch 10th row from current fetch
Close Emp_cursor
Deallocate Emp_cursor

--forward-only cursor
Declare Emp_cursor cursor forward_only
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor
fetch next from Emp_cursor
fetch prior from Emp_cursor -- won't execute( Forward only cursor )
Close Emp_cursor
Deallocate Emp_cursor


--scroll  cursor
Declare Emp_cursor cursor scroll
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor
fetch prior from Emp_cursor
fetch last from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor


--STATIC  cursor
Declare Emp_cursor cursor static
for select * from TempEmployee
Open Emp_cursor
fetch next from Emp_cursor
	update TempEmployee set Vacationhours+=20 where current of Emp_cursor -- will throw error
Close Emp_cursor
Deallocate Emp_cursor

select * into TempEmployee from HumanResources.Employee

update TempEmployee set Vacationhours+=20 


--Dynamic  cursor

Declare Emp_cursor cursor Dynamic
for select * from TempEmployee
Open Emp_cursor
fetch first from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor

update TempEmployee set Vacationhours+=20 


--keyset  cursor
Declare Emp_cursor cursor keyset
for select * from TempEmployee
Open Emp_cursor
fetch first from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor

select * from TempEmployee
delete from TempEmployee where BusinessEntityID=1


--FAST_FORWARD  cursor
Declare Emp_cursor cursor FAST_FORWARD
for select * from TempEmployee
Open Emp_cursor
fetch next from Emp_cursor
	update TempEmployee set Vacationhours+=20 where current of Emp_cursor -- will throw error
Close Emp_cursor
Deallocate Emp_cursor


--READ_ONLY  cursor
Declare Emp_cursor cursor READ_ONLY
for select * from TempEmployee
Open Emp_cursor
fetch next from Emp_cursor
	update TempEmployee set Vacationhours+=20 where current of Emp_cursor -- will throw error
Close Emp_cursor
Deallocate Emp_cursor


--SCROLL_LOCKS  cursor
Declare Emp_cursor cursor SCROLL_LOCKS
for select * from TempEmployee
Open Emp_cursor
fetch next from Emp_cursor
fetch last from Emp_cursor -- will throw error
Close Emp_cursor
Deallocate Emp_cursor



