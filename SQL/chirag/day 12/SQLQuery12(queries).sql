use subqueries


--q1 Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

create function pfa(@salary int)

RETURNS DECIMAL(8,0)
as BEGIN


RETURN (@salary*.12)
end


select employeeid,firstname,dbo.pfa(salary) as pf from Employees
select avg(salary) from Employees

--q2Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below. 

drop function tax
create function taax(@salary int)
returns int

as begin 

	declare @PT int

	SET @PT = CASE
			when @salary <5000 then NULL
			when @salary between 5000 and 9000 then 80
			when @salary between 9001 and 12000 then 150
			when @salary >12000 then 200
			end
			return @pt
end


select salary,dbo.taax(salary) from Employees


		





---Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
drop function ta
create function job(@jobId varchar(50))
RETURNS TABLE 
AS
RETURN(select * from Employees where jobid=@jobId)




select * from job('FI_ACCOUNT')


