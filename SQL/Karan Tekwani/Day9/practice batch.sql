declare @count int
set @count=0

declare @id int
set @id=1

While (Select Subscribers_ID from Subscribers where Subscribers_ID=@id)<20
Begin
	if (select Subscription_Plan from Subscribers where Subscribers_ID=@id)=6
		set @count+=1
	else
		continue
set @id+=1
END
print @count

-----------------------------------------------------------
declare @avg int
set @avg= (select AVG(salary) from Employees)

declare @id1 int
set @id1=100

while (select EmployeeID from Employees where EmployeeID=@id1)>99
begin
		update Employees set Salary+=Salary*0.2 where EmployeeID=@id1 and Salary<@avg
	set @id1+=1
	print @avg
end

revert