
--Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ 
--from employee table

SELECT CASE Department
	   WHEN 'Banking' THEN 'Bank Dept'
	   WHEN 'Insurance' THEN 'Insurance Dept'
	   WHEN 'Services' THEN 'Services Dept'
	   END 
	   AS Departments
	   FROM Employee



--5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from 
--json variable. and select output in the json format

--Declare Json Data
DECLARE @StudentDetails NVARCHAR(MAX)
SET @StudentDetails = 
'[
  {
    "Name": "John Abraham",
    "ADDRESS": "1297 Via Cola di Rie",
    "City": "Roma",
    "DOB": "2000-07-05",
    "Standard": 2
  },
  {
    "Name": "Michael Clarke",
    "ADDRESS": "93091 Calle della Testa",
    "City": "Venice",
    "DOB": "1999-05-05",
    "Standard": 6
  },
  {
    "Name": "Roy Thomas",
    "ADDRESS": "2011 Interiors Blvd",
    "City": "Tokyo",
    "DOB": "2001-01-06",
    "Standard": 8
  },
  {
    "Name": "Phillip Mathew",
    "ADDRESS": "2004 Charade Rd",
    "City": "Hiroshima",
    "DOB": "1999-04-07",
    "Standard": 12
  },
  {
    "Name": "Jerry Pinto",
    "ADDRESS": "40-5-12 Laogianggen",
    "City": "Southlake",
    "DOB": "2000-02-08",
    "Standard": 10
  }
]'

SELECT ISJSON(@StudentDetails)

INSERT INTO Students
SELECT * FROM OPENJSON(@StudentDetails)
WITH
(
	Name VARCHAR(25) '$.Name',
	[Address] NVARCHAR(MAX) '$.ADDRESS',
	City VARCHAR(15) '$.City',
	DOB DATE '$.DOB',
	[Standard] INT '$.Standard'
)

SELECT * FROM Students FOR JSON PATH 



--Create Table
CREATE TABLE Students
(
    Name VARCHAR(40) NOT NULL,
    ADDRESS VARCHAR(70) NOT NULL,
    City VARCHAR(20) NOT NULL,
    DOB DATE NOT NULL,
    Standard TINYINT
)