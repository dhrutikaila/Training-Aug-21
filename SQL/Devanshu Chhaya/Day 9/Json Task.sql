
CREATE TABLE STUDENT(
	Name NVARCHAR(MAX) ,
	Address NVARCHAR(MAX) ,
	City NVARCHAR(MAX) ,
	DOB DATETIME2 ,
	Standard INT
)

--- 5. Students Name, Address, City, DOB, Standard need to be inserted in the student table, 
--- need to fetch these result from json variable. and select output in the json format

DECLARE @Json NVARCHAR(MAX);

SET @Json='[
	{
	"Name":"Raj",
	"Address":"Near Big Bazar",
	"City":"Ahmedabad",
	"DOB":"2008-06-25",
	"Standard":"10"
	},
	{
	"Name":"Jay",
	"Address":"Station Road",
	"City":"Banglore",
	"DOB":"2007-08-22",
	"Standard":"9"
	},
	{
	"Name":"Nik",
	"Address":"Near Railway Station",
	"City":"Delhi",
	"DOB":"2007-04-23",
	"Standard":"9"
	},
	{
	"Name":"Rohit",
	"Address":"Kandivali",
	"City":"Mumbai",
	"DOB":"2010-02-02",
	"Standard":"7"
	},
	{
	"Name":"Virat",
	"Address":"Borivali",
	"City":"Mumbai",
	"DOB":"2012-04-03",
	"Standard":"4"
	}
]';

INSERT INTO Student
SELECT * 
FROM OPENJSON(@Json)
WITH
(
	Name NVARCHAR(MAX) '$.Name',
	Address NVARCHAR(MAX) '$.Address',
	City NVARCHAR(MAX) '$.City',
	DOB DATETIME2 '$.DOB',
	Standard INT '$.Standard'
);

SELECT * FROM STUDENT

SELECT * FROM STUDENT FOR JSON PATH