/*1. Update the salary of the employee using following condition
Salary between 30000 and 40000 — 5000 hike

Salary between 40000 and 55000 — 7000 hike

Salary between 55000 and 65000 — 9000 hike */

select * from Employees

drop table temp
select * into temp from Employees

select * from temp

declare salary_cursor cursor
for select * from temp
open salary_cursor 
fetch next from salary_cursor
while @@FETCH_STATUS=0
begin
	update temp 
	set Salary=
	Case
	When Salary between 30000 and 50000 then Salary+5000
	When Salary between 40000 and 55000 then Salary+7000
	When Salary between 55000 and 65000 then Salary+9000
	Else salary
	End
	Where current of salary_cursor
Fetch next from salary_cursor
End	
Close salary_cursor
Deallocate salary_cursor

-----We have use "for update of Salary" to ensure that only Salary Column to be changed.
declare salary_cursor cursor
for select * from temp for update of Salary
open salary_cursor 
fetch next from salary_cursor
while @@FETCH_STATUS=0
begin
	update temp 
	set Salary=
	Case
	When Salary between 30000 and 50000 then Salary+5000
	When Salary between 40000 and 55000 then Salary+7000
	When Salary between 55000 and 65000 then Salary+9000
	Else salary
	End
	Where current of salary_cursor
Fetch next from salary_cursor
End	
Close salary_cursor
Deallocate salary_cursor
