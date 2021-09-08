select * from HumanResources.Employee

select BusinessEntityID,VacationHours from HumanResources.Employee

--Rank
select rank() over(order by vacationhours desc)Rank, BusinessEntityID,VacationHours
from HumanResources.Employee

--dense_rank
select dense_rank() over(order by vacationhours desc)Rank, BusinessEntityID,VacationHours
from HumanResources.Employee

select dense_rank() over(order by (Datediff(year,Hiredate,GEtdate())) desc)'Highest Experience',Experience=Datediff(year,Hiredate,GEtdate()), BusinessEntityID,VacationHours
from HumanResources.Employee

--row_number
select row_number() over(order by vacationhours desc)Rank, BusinessEntityID,VacationHours
from HumanResources.Employee

--ntile
select ntile(5) over(order by vacationhours asc)Rank, BusinessEntityID,VacationHours
from HumanResources.Employee

--partition
select ntile(5) over(partition by Jobtitle  order by vacationhours asc)Rank, Jobtitle,VacationHours
from HumanResources.Employee

select ntile(5) over(order by vacationhours asc)Rank, Jobtitle,VacationHours
from HumanResources.Employee

--Aggregate Function
select rank() over(order by vacationhours desc)Rank,VacationHours
from HumanResources.Employee
select rank() over(order by vacationhours desc)Rank,VacationHours
from HumanResources.Employee group by (VacationHours)

SELECT count(Rank), VacationHours FROM (select rank() over(order by vacationhours desc)Rank, VacationHours
from HumanResources.Employee)temp group by (VacationHours)

select * from HumanResources.Employee













