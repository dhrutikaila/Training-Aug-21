--1: Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

select * from Employee

select *,DEPARTMENT=
Case
	when DEPARTMENT='Banking' then 'Bank Dept.'
	when DEPARTMENT='Insurance' then 'Insurance Dept.'
	when DEPARTMENT='Services' then 'Services Dept.'
end
from Employee 

select * from Employee

--2: 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format

create table Student
(
	Name varchar(20),
	Address varchar(100),
	City varchar(100),
	DOB date,
	Standard varchar(20)
)

insert into Student values 
('Karan','Ahmedabad','Ahmedabad','2000/7/1','12'),
('Sahil','Ahmedabad','Ahmedabad','1999/4/10','11'),
('Vishwas','Ahmedabad','Ahmedabad','2001/10/15','10'),
('Neeraj','Ahmedabad','Ahmedabad','2002/3/17','9'),
('Sanskar','Ahmedabad','Ahmedabad','1998/8/22','8')

select * from Student

declare @student_json nvarchar(max)
set @student_json='[
{
"Name":"Karan",
"Address":"Ahmedabad",
"City":"Ahmedabad",
"DOB":"2000-07-01",
"Standard":"12"
},
{
"Name":"Sahil",
"Address":"Ahmedabad",
"City":"Ahmedabad",
"DOB":"1999-04-10",
"Standard":"11"
},
{
"Name":"Vishwas",
"Address":"Ahmedabad",
"City":"Ahmedabad",
"DOB":"2001-10-15",
"Standard":"10"
},
{
"Name":"Neeraj",
"Address":"Ahmedabad",
"City":"Ahmedabad",
"DOB":"2002-03-17",
"Standard":"9"
},
{
"Name":"Sanskar",
"Address":"Ahmedabad",
"City":"Ahmedabad",
"DOB":"1998-08-22",
"Standard":"8"
}
]'

select * from openjson(@student_json)
with (Name varchar(20) '$.Name', Address varchar(100) '$.Address',City varchar(100) '$.City',DOB date '$.DOB')
