create table temp
(
	FirstName nvarchar(max),
	LastName nvarchar(max),
	Department nvarchar(max),
	Skills nvarchar(max)
)

drop table temp
--1
declare @practice nvarchar(max)
set @practice='[{"FirstName": "Karan","LastName": "Tekwani","Department": ".Net","Skills":["HTML","CSS","SQL"]},
{"FirstName": "Vishwas","LastName": "Shivnani","Department": "php","Skills":["SQL"]}]'
insert into temp
select * from openjson(@practice)
with (FirstName nvarchar(max) '$.FirstName',LastName nvarchar(max) '$.LastName',Department nvarchar(max) '$.Department',Skills nvarchar(max) '$.Skills' as json)

select * from temp
--2
declare @practice nvarchar(max)
set @practice='{"FirstName": "Karan","LastName": "Tekwani","Department": ".Net","Skills":["HTML","CSS","SQL"]}'
select FirstName,LastName,Department,
JSON_QUERY(Skills,'$')Skills,
json_value(Skills,'$[0]')"Skill 1",
json_value(Skills,'$[1]')"Skill 2",
json_value(Skills,'$[2]')"Skill 3"
from temp

declare @practice nvarchar(max)
set @practice='[{"FirstName": "Karan","LastName": "Tekwani","Department": ".Net","Skills":["HTML","CSS","SQL"]},
{"FirstName": "Vishwas","LastName": "Shivnani","Department": "php","Skills":["SQL"]}]'
select FirstName,LastName,Department,
JSON_QUERY(Skills,'$')Skills,
json_value(Skills,'$[0]')"Skill 1",
json_value(Skills,'$[1]')"Skill 2",
json_value(Skills,'$[2]')"Skill 3"
from temp

select * from temp
--3
declare @practice nvarchar(max)
set @practice='{"FirstName": "Karan","LastName": "Tekwani","Department": ".Net","Skills":["HTML","CSS","SQL"]}'
select * from openjson(@practice)
with (FirstName nvarchar(max) '$.FirstName',LastName nvarchar(max) '$.LastName',Department nvarchar(max) '$.Department',Skills nvarchar(max) '$.Skills' as json)
outer apply openjson(Skills)
with (Skills varchar(50) '$')

declare @practice nvarchar(max)
set @practice='[{"FirstName": "Karan","LastName": "Tekwani","Department": ".Net","Skills":["HTML","CSS","SQL"]},
{"FirstName": "Vishwas","LastName": "Shivnani","Department": "php","Skills":["SQL"]}]'
select * from openjson(@practice)
with (FirstName nvarchar(max) '$.FirstName',LastName nvarchar(max) '$.LastName',Department nvarchar(max) '$.Department',Skills nvarchar(max) '$.Skills' as json)
outer apply openjson(Skills)
with (Skills varchar(50) '$')

--4
declare @json nvarchar(max)
print isjson(@json)

--5
create table practice
(
	Id nvarchar(max)
)
alter table practice 
add constraint chk_json check (isjson(Id)=1)


--6
DECLARE @info NVARCHAR(100)='{"name":"Rahul","skills":["C#","SQL"]}'
PRINT @info
SET @info=JSON_MODIFY(@info,'$.name','Sachin')
PRINT @info
SET @info=JSON_MODIFY(@info,'append $.skills','Azure')
PRINT @info

select * from Employees without_array_wrapper

--7
create table temp2
(
	FirstName nvarchar(max),
	LastName nvarchar(max),
	Department nvarchar(max)
)

create table temp3
(
	FirstName nvarchar(max),
	Skills nvarchar(max)
)

--8: Insert into 2 tables

declare @practice nvarchar(max)
set @practice='[{"FirstName": "Karan","LastName": "Tekwani","Department": ".Net","Skills":["HTML","CSS","SQL"]},
{"FirstName": "Vishwas","LastName": "Shivnani","Department": "php","Skills":["SQL"]}]'
insert into temp2 
select FirstName,LastName,Department from openjson(@practice)
with (FirstName nvarchar(max) '$.FirstName',LastName nvarchar(max) '$.LastName',Department nvarchar(max) '$.Department')
insert into temp3
select FirstName,SKill from openjson(@practice)
with (FirstName nvarchar(max) '$.FirstName', Skills nvarchar(max) '$.Skills' as json)
outer apply openjson(Skills)
with (SKill varchar(50) '$')


select * from temp2
select * from temp3
drop table temp2
drop table temp3