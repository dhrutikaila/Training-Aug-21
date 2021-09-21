-- Json Assignment --
-- 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format

create table Student
(
	Name varchar(20),
	Address varchar(100),
	City varchar(100),
	DOB date,
	Std int 
)


Select * from Student FOR JSON PATH


DECLARE @json NVARCHAR(MAX)
SET @json = '[
		{
			"Name": "Joel",
			"Address": "Chankheda",
			"City": "Ahmedabad",
			"DOB": "1999/12/24",
			"Std": "11"
		},
		{
			"Name": "Shrey",
			"Address": "Adalaj",
			"City": "Ahmedabad",
			"DOB": "1990/08/12",
			"Std": "12"
		},
		{
			"Name": "Rohan",
			"Address": "lal Darwaja",
			"City": "Ahmedabad",
			"DOB": "1990/05/25",
			"Std": "10"
		},
		{
			"Name": "Kunal",
			"Address": "Thaltej",
			"City": "Ahmedabad",
			"DOB": "2000/01/21",
			"Std": "9"
		},
		{
			"Name": "Ravi",
			"Address": "Maninagar",
			"City": "Ahmedabad",
			"DOB": "1998/02/13",
			"Std": "12"
		}
	]'

insert into Student
SELECT * FROM OPENJSON(@json)
WITH(
	Name VARCHAR(10) '$.Name',
	Address VARCHAR(20) '$.Address',
	City VARCHAR(10) '$.City',
	DateOfBirth date '$.DOB',
	Standard int '$.Std'
)
