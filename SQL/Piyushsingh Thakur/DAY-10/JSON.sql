USE DAY14
--1) Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from 
--   employee table
SELECT *,
	CASE 
		WHEN Department='Banking' THEN 'Bank Department'
		WHEN Department='Insurance' THEN 'Insurance Department'
		WHEN Department='Services' THEN 'Services Department'
		ELSE Department
	END AS Department
	FROM Employee
GO



CREATE TABLE STUDENT
    (NAME VARCHAR(200),
    ADDRESS NVARCHAR(MAX),
    CITY VARCHAR(30),
    DOB VARCHAR(50),
    CLASS INT
    )

 

--2) 5 Students Name, Address, City, DOB, CLASS need to be inserted in the student table, need to fetch these result from json variable. 
--   and select output in the json format.
DECLARE @STUDENT NVARCHAR(MAX)
SELECT @STUDENT =   
  '[  
       {  
         "Name": "JAY",
		 "Address": "KHODIYAR NAGAR",
		 "City":"AHMEDABAD",
		 "DOB":"09-06-1999",
		 "CLASS":11
		 },


       {  
         "Name": "MIHIR",
		 "Address": "RANIP",
		 "City":"AHMEDABAD",
		 "DOB": "30-11-2000",
		 "CLASS":10
		 },


       {  
         "Name": "YASH",
		 "Address": "OGNAJ",
		 "City":"AHMEDABAD",
		 "DOB": "07-09-1999",
		 "CLASS":12
		 },


        {  
         "Name": "ABHAY",
		 "Address": "NIKOL",
		 "City":"AHMEDABAD",
		 "DOB": "05-07-2000",
		 "CLASS":9
		 },


        {  
         "Name": "PARTH",
		 "Address": "VASTRAL",
		 "City":"AHMEDABAD",
		 "DOB": "17-02-20000",
		 "CLASS":12
		 }
 ]'


INSERT INTO STUDENT    
SELECT * FROM OPENJSON (@STUDENT)  
WITH (   
              Name   VARCHAR(200) '$.Name' , 
              Address NVARCHAR(MAX) '$.Address',
              City VARCHAR(30)'$.City',  
              DOB VARCHAR(50) '$.DOB',  
              CLASS int '$.CLASS'  
     )

	 SELECT * FROM STUDENT

	