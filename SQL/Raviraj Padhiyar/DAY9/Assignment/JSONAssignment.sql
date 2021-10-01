--5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format

CREATE TABLE Students (
Name VARCHAR(30) NOT NULL,
Address VARCHAR(30) NOT NULL,
City VARCHAR(20) NOT NULL,
DOB DATE NOT NULL
)


DECLARE @studentData NVARCHAR(MAX) = 
N'[
	{
		"Name":"Raviraj",
		"Address":"A-15,
		Manglam Heights,
		Sola","City":"Ahmedabad",
		"DOB":"2000-01-30"
	},
	{
		"Name":"Abhi",
		"Address":"Vyas Banglows,Ranip",
		"City":"Ahmedabad",
		"DOB":"2000-02-02"
	},
	{
		"Name":"Rahul",
		"Address":"A-35,Golden Tower,gota",
		"City":"Ahmedabad",
		"DOB":"2000-01-15"
	},
	{
		"Name":"Tushar",
		"Address":"ParmarEstate",
		"City":"Sanand",
		"DOB":"2000-01-12"
	},
	{
		"Name":"Nirmal",
		"Address":"Malabar heigts,Gota",
		"City":"Ahemdabad",
		"DOB":"2000-01-01"
	}
]'


INSERT INTO Students
SELECT 
	*
FROM OPENJSON(@studentData)
WITH (
	Name  NVARCHAR(10) '$.Name',
	Address NVARCHAR(20) '$.Address',
	City NVARCHAR(10) '$.City',
	DOB DATE '$.DOB' 
)


SELECT * FROM Students FOR JSON AUTO