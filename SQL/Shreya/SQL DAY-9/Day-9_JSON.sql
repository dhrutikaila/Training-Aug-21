--1.Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

Select Banking as 'Bank Dept',Insurance as 'Insurance Dept',Services as 'Services Dept' 
FROM Employee
GO

/*2.5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, 
need to fetch these result from json variable and select output in the json format*/

CREATE TABLE STUDENT 
(
ID INT ,
Name VARCHAR(20),
City VARCHAR(30),
DOB VARCHAR(20),
Standard INT
)

DECLARE @var nvarchar(max);
SET @var = N'[{
"StuDetails":{
"id" : 1,
"Name":"Shreya",
"Address":{
"city":"Ahmedabad"
},
"DOB":"17/08/2000",
"Standard":10 }
},

	
{"StuDetails":{
"id" : 2,
"Name":"Diya",
"Address":{
"city":"Gandhinagar"
},
"DOB":"15/05/2004",
"Standard":12}
 },
 

{"StuDetails":{
"id" : 3,
"Name":"Riya",
"Address":{
"city":"Ahmedabad"
},
"DOB":"11/10/1999",
"Standard":12 }
},


{"StuDetails":{
"id" : 4,
"Name":"Dharal",
"Address":{
"city":"Sola"
},
"DOB":"27/02/2000",
"Standard":10 }
},


{"StuDetails":{
"id" : 5,
"Name":"Dhyanvi",
"Address":{
"city":"Ahmedabad"
},
"DOB":"10/12/1999",
"Standard":12 }
}]';

INSERT INTO Student
SELECT * FROM OPENJSON(@var)
WITH
(
ID INT '$.StuDetails.id',
NAME VARCHAR(20) '$.StuDetails.Name',
city VARCHAR(30) '$.StuDetails.Address.city',
DOB VARCHAR(30) '$.StuDetails.DOB',
Standard INT '$.StuDetails.Standard'
)


SELECT * FROM STUDENT
SELECT * FROM STUDENT FOR JSON PATH



