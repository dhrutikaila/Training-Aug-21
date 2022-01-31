/*
1.Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as 
‘Services Dept’ from employee table
*/
Select Banking as 'Bank Dept',Insurance as 'Insurance Dept',Services as 'Services Dept' 
FROM Employees
GO





/*
2.5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, 
need to fetch these result from json variable. and select output in the json format
*/
DECLARE @jsonINFO NVARCHAR(MAX)
SET @jsonINFO = N'{ "Students" : [
		{
		"Name":"Yash",
		"Address":"Naroda",
		"City":"Ahmedabad",
		"DOB":"20/10/1999",
		"Standard" : 5
		},
		{
		"Name":"Yagnik",
		"Address":"Motera",
		"City":"Ahmedabad",
		"DOB":"10/05/1996",
		"Standard" : 9
		},
		{
		"Name":"Zeal",
		"Address":"Panvel",
		"City":"Mumbai",
		"DOB":"10/10/2001",
		"Standard" :10
		},
		{
		"Name":"Shruti",
		"Address":"Shahibaug",
		"City":"Ahmedabad",
		"DOB":"04/08/2000",
		"Standard" :5
		},
		{
		"Name":"Mihir",
		"Address":"Isanpur",
		"City":"Ahmedabad",
		"DOB":"05/05/2002",
		"Standard" :8
		}]
}'

/*CHECK VALIDIDTY
IF ISJSON(@jsonINFO)=1
PRINT(1)
ELSE
PRINT(2)
*/

INSERT INTO Student 
SELECT * 
FROM OPENJSON(@jsonINFO,'$.Students')
WITH
(
	Name VARCHAR(10) '$.Name',
	Address VARCHAR(20) '$.Address',
	City VARCHAR(15) '$.City',
	DOB VARCHAR(10) '$.DOB',
	Standard CHAR(3) '$.Standard'
)

SELECT * FROM Student
SELECT * FROM Student FOR JSON PATH