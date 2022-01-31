----create trigger for update
create trigger triggerupdate on  dbo.employees
for update

as begin
 insert into new
 select * from  deleted
 select * from  inserted
 

end


update employees  set FirstName='A' where EmployeeID=145


select * into new from Employees where EmployeeID=105



select * from new

--create trigger for delete


create trigger triggerdelete on  dbo.employees
after delete
as begin
 insert into new
 select * from  deleted
 select * from  inserted
 
end

delete from employees where employeeID=500

select * from new
