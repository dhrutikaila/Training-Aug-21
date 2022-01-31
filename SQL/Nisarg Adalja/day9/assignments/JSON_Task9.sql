/* 5 Students Name, Address, City, DOB, Standard need to be inserted in the student TABLE, need to fetch these result FROM json variable. and SELECT output in the json format*/

CREATE TABLE Students (
Name VARCHAR(30) NOT NULL,
Address VARCHAR(30) NOT NULL,
City VARCHAR(20) NOT NULL,
DOB DATE NOT NULL
)


DECLARE @studentData NVARCHAR(MAX) = 
N'[
	{
		"Name":"Nisarg",
		"Address":"c/5,
		Manglam Heights,
		Sola","City":"Ahmedabad",
		"DOB":"2000-02-26"
	},
	{
		"Name":"Deep",
		"Address":"Vyas Banglows,Ranip",
		"City":"Ahmedabad",
		"DOB":"2000-02-02"
	},
	{
		"Name":"Dhruvil",
		"Address":"A-35,Golden Tower,gota",
		"City":"Ahmedabad",
		"DOB":"2000-05-16"
	},
	{
		"Name":"Jenil",
		"Address":"ParmarEstate",
		"City":"Sanand",
		"DOB":"2000-05-05"
	},
	{
		"Name":"Ridham",
		"Address":"Malabar heigts,Gota",
		"City":"Ahemdabad",
		"DOB":"2000-10-05"
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