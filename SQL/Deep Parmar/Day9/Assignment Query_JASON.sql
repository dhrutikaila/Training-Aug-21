 --[1] Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ 
 --    and Services as ‘Services Dept’ from employee table

 SELECT CASE DEPARTMENT
			WHEN 'Banking' THEN 'Bank Dept'
			WHEN 'Insurance' THEN 'Insurance Dept'
			WHEN 'Services' THEN 'Services Dept'
			END 
		    FROM Employee


--[2] 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, 
--    need to fetch these result from json variable. and select output in the json format

 CREATE TABLE Students
(
    Name VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(80) NOT NULL,
    City VARCHAR(20) NOT NULL,
    DOB DATE NOT NULL,
    Standard TINYINT NOT NULL
)
-----------------------------
--Declare json variable
DECLARE @json nvarchar(max)

SET @json=
'[
  {
    "Name": "Deep Parmar",
    "ADDRESS": "I-401,ozone city",
    "City": "Surat",
    "DOB": "2005-01-14",
    "Standard": 12
  },
  {
    "Name": "Rahul Sharma",
    "ADDRESS": "F-402, Mansi park Society",
    "City": "Ahmedabad",
    "DOB": "2010-05-05",
    "Standard": 4
  },
  {
    "Name": "Rupesh Vasani",
    "ADDRESS": "D-406, Krishna Avenue",
    "City": "Rajkot",
    "DOB": "2001-01-06",
    "Standard": 12
  },
  {
    "Name": "Rutvik Patel",
    "ADDRESS": "G-608, Gokuldham Socity",
    "City": "Ahmedabad",
    "DOB": "2004-04-07",
    "Standard": 10
  },
  {
    "Name": "Dhruvesh Parmar",
    "ADDRESS": "A-309, NEW MANINAGER",
    "City": "Ahmedabad",
    "DOB": "2006-02-08",
    "Standard": 9
  }
]'

IF(ISJSON(@json)=1)
BEGIN
INSERT INTO Students
SELECT * FROM OPENJSON(@json)
WITH 
(
	[NAME] VARCHAR(25) '$.Name',
	[Address] VARCHAR(25) '$.ADDRESS',
	City VARCHAR(20) '$.City', 
    Date_Of_Birth DATE '$.DOB',
    [Standard] TINYINT '$.Standard' 
)
END
ELSE
PRINT 'Somthing Wrong in Your Json File.. '


SELECT * FROM Students FOR JSON PATH









