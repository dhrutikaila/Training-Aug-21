Example Of JSON text

N'[
	{
		"name":"John",
		"skills":["SQL","C#","AZURE"]
	},
	{	
		"name":"Jane",
		"surname":"Doe"
	}

]'


--Modify Json Value



--SELECT @json
--DECLARE @Modifiedjson NVARCHAR(MAX)
--SET @Modifiedjson=ISJSON(@json)
--SELECT @Modifiedjson


DECLARE @json3 NVARCHAR(MAX)
SET @json3=
N'{"info":
	{
	"address":
	[
	{"town":"Ahmedabad"},
	{"town":"Pune"},
	{"town":"Bengalure"}]}}
'
--SET @json3=JSON_MODIFY(@json3,'$.info.address[1].town','London')
SET @json3 = JSON_MODIFY(@json3, '$.info.address[0].town', 'London');
SELECT json7=@json3



DECLARE @json NVARCHAR(MAX);
SET @json = N'[
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
]'



IF(ISJSON(@json))>0
BEGIN

	SELECT * FROM OPENJSON(@json)
	WITH
	(
		ID INT ' $.id',
		FirstName VARCHAR(20) '$.info.name',
		LastName VARCHAR(20) '$.info.surname',
		Age INT '$.age' ,
		Dob DATE '$.dob' 

	
	)
END
DECLARE @json2 NVARCHAR(MAX)
SET @json2=
N'[
	{
		"name":"John",
		"skills":["SQL","C#","AZURE"]
	},
	{	
		"name":"Jane",
		"surname":"Doe"
	}

]'

SELECT * FROM OPENJSON(@json2)
WITH
(
	Name NVARCHAR(MAX) ' $.name',
	Skills NVARCHAR(MAX)' $.skills' AS JSON,
	SurName NVARCHAR(MAX)' $.surname'
	
)
OUTER APPLY OPENJSON(skills)
WITH
(
	skills NVARCHAR(MAX) '$'	
)

DECLARE @json7 NVARCHAR(MAX);
SET @json7 = N'[  
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith", "skills": ["SQL", "C#", "Azure"]}, "dob": "2005-11-04T12:00:00"}  
]';

SELECT JSON_VALUE(@json7,'$.info.skills[1]')
SELECT *  
FROM OPENJSON(@json7)  
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',  
    age INT,
    dateOfBirth DATETIME2 '$.dob',
    skills NVARCHAR(MAX) '$.info.skills' AS JSON
  )
OUTER APPLY OPENJSON(skills)
  WITH (skill NVARCHAR(8) '$');