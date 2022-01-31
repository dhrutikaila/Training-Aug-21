/* Q1 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, 
need to fetch these result from json variable. 
and select output in the json format */

CREATE TABLE Student
(
fName varchar(40),
Curr_Address varchar(200),
City varchar(50),
DOB varchar(30),
Std int 
)

use db2

DECLARE @jsonData NVARCHAR(MAX)

SET @jsonData = '[
{"Name":"Prit","Address":"Shantadevi Road","City":"Navsari","DOB":"2000-12-19","Standard":12},
{"Name":"Man","Address":"Grid Road","City":"Navsari","DOB":"2004-12-31","Standard":11},
{"Name":"Tirth","Address":"abc Road","City":"Surat","DOB":"2008-08-30","Standard":10},
{"Name":"Krusha","Address":"def Road","City":"Gandhinagar","DOB":"2002-04-09","Standard":12},
{"Name":"Nikita","Address":"ghi Road","City":"Ahmedabad","DOB":"2003-09-01","Standard":9}
]'

INSERT INTO Student
SELECT * FROM OPENJSON(@jsonData)
WITH
(
fName varchar(40) '$.Name',
Curr_Address varchar(200) '$.Address',
City varchar(50) '$.City',
DOB varchar(30) '$.DOB',
Std int '$.Standard'
)


SELECT * FROM Student


SELECT * FROM Student FOR JSON PATH

/*

Output

[
{
"fName":"Prit",
"Curr_Address":"Shantadevi Road",
"City":"Navsari",
"DOB":"2000-12-19",
"Std":12
},
{
"fName":"Man",
"Curr_Address":"Grid Road",
"City":"Navsari",
"DOB":"2004-12-31",
"Std":11
},
{
"fName":"Tirth",
"Curr_Address":"abc Road",
"City":"Surat",
"DOB":"2008-08-30",
"Std":10
},
{
"fName":"Krusha",
"Curr_Address":"def Road",
"City":"Gandhinagar",
"DOB":"2002-04-09",
"Std":12
},
{
"fName":"Nikita",
"Curr_Address":"ghi Road",
"City":"Ahmedabad",
"DOB":"2003-09-01",
"Std":9
}
]

*/