--task-1-Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table
SELECT *,
    CASE
        WHEN Department='Banking' THEN 'Bank Dept'
        WHEN Department='Insurance' THEN 'Insurance Dept'
        WHEN Department='Services' THEN 'Services Dept'
        ELSE Department
    END AS Department
    FROM Employee
GO

--task-2- 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format
DECLARE @json NVARCHAR(MAX)
SET @json =   
  N'[  
       {  
         "Name": "Dhruvit",  
		 "Address": "Bhut Bangla,Shetan Gali,Andher Nagar, Smashan Ke Samne",
        "City":"Surat",
		"DOB":"2000-09-06",
        "Standard":1 
       },
       {  
         "Name": "Shubh",  
		 "Address": "Himalyan Valley Kingdom",
         "City":"Ahmedabad",  
		 "DOB": "1950-01-26",
		 "Standard":5 
		},
       {  
         "Name": "Hemanshu",  
		 "Address": "Royal Circus,Matunga",
         "City":"Vadodara",  
		 "DOB": "1950-01-26",
		 "Standard":2
		},
		{  
         "Name": "Niraj",  
		 "Address": "Kathiyavadi Khadki,Ahmedabad",
         "City":"Ahmedabad",  
		 "DOB": "1950-01-26",
		 "Standard":3
		},
		{  
         "Name": "Piyush",  
		 "Address": "Ram Bhavan,Ayodhya",
         "City":"Ahmedabad",  
		 "DOB": "1950-01-26",
		 "Standard":4 
		 }
 ]'  
 CREATE TABLE Student(
	NAME VARCHAR(200),
	ADDRESS NVARCHAR(MAX),
	CITY VARCHAR(30),
	DOB VARCHAR(50),
	Standard INT
)
INSERT INTO Student	
SELECT * FROM  
 OPENJSON ( @json )  
WITH (   
              Name   varchar(200) '$.Name' , 
			  Address NVARCHAR(MAX) '$.Address',
              City VARCHAR(50)     '$.City',  
              DOB VARCHAR(50) '$.DOB',  
              Standard int '$.Standard'  
 ) 

