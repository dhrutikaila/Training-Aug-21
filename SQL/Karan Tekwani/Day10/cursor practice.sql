use day6_sql_file
select * into temp from employees


--different types of fetch
declare practice cursor scroll
for select * from temp
open practice
fetch next from practice
fetch last from practice
fetch prior from practice
fetch absolute 5 from practice
fetch relative 5 from practice
close practice
deallocate practice

--local cursor
declare practice cursor local
for select * from temp
open practice
fetch next from practice
close practice
deallocate practice

--global cursor
declare practice cursor global
for select * from temp
open practice
fetch next from practice
close practice
deallocate practice

--forward-only cursor
declare practice cursor forward_only
for select * from temp
open practice
fetch next from practice
fetch next from practice
fetch prior from practice
close practice
deallocate practice

--scroll  cursor
declare practice cursor scroll
for select * from temp
open practice
fetch next from practice
fetch next from practice
fetch prior from practice
close practice
deallocate practice

--STATIC  cursor
declare practice cursor static
for select * from temp
open practice
fetch next from practice
	update temp set Salary+=5000 where current of practice
close practice
deallocate practice

--Dynamic  cursor
declare practice cursor Dynamic
for select * from temp
open practice
fetch first from practice
close practice
deallocate practice


declare practice1 cursor 
for select * from temp
open practice1
fetch next from practice1
	update temp set Salary+=5000 where current of practice1
close practice
deallocate practice1


--keyset  cursor
declare practice cursor keyset
for select * from temp
open practice
fetch first from practice
close practice
deallocate practice

select * from temp
delete from temp where EmployeeID=100

--FAST_FORWARD  cursor
declare practice cursor FAST_FORWARD
for select * from temp
open practice
fetch next from practice
	update temp set Salary+=5000 where current of practice
close practice
deallocate practice


--READ_ONLY  cursor
declare practice cursor READ_ONLY
for select * from temp
open practice
fetch next from practice
	update temp set Salary+=5000 where current of practice
close practice
deallocate practice


--READ_ONLY  cursor
declare practice cursor SCROLL_LOCKS
for select * from temp
open practice
fetch last from practice
close practice
deallocate practice