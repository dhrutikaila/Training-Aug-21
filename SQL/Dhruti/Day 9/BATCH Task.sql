
--ASSIGNMENT:

--1 Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

SELECT 'DEPT_NAME'= 
CASE DEPARTMENT
WHEN 'Banking' THEN 'Bank Dept' 
WHEN 'Insurance' THEN 'Insurance Dept'
WHEN 'Services' THEN 'Services Dept' 
END
FROM EMPOLYEES


--2 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format.

  CREATE TABLE STUDENTS(
  Stdid int,
  Std_info NVARCHAR(MAX)
  )
  ALTER TABLE STUDENTS ADD CONSTRAINT JSON_VALID CHECK (ISJSON( Std_info)=1)
 

DECLARE @DATA NVARCHAR(MAX);
SET @DATA = N'[ {"name": "John", "Address": "KALPTRU1", "city": "rajkot","dob": "2005-11-04","Standard":4},
{"name": "dhruti", "Address": "SHREEJI", "city": "abad","dob": "2000-11-02","Standard":10},
{"name": "kp", "Address": "SPARCH", "city": "abad","dob": "1999-8-08","Standard":10},
{"name": "avni", "Address": "KALPATRU", "city": "dharmpur","dob": "2002-4-15","Standard":10},
{"name": "MEET", "Address": "RAVIPARK", "city": "dharmpur","dob": "2002-4-15","Standard":5}
]';
insert into STUDENTS values(1,@DATA)
SELECT *
FROM OPENJSON(@DATA)
  WITH (
   name NVARCHAR(50) '$.name',
    Address NVARCHAR(50) '$.Address',
   Standard INT '$.Standard',
   city  NVARCHAR(50) '$.city',
    dateOfBirth DATE '$.dob'
  );
 
SELECT*FROM STUDENTS
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER 
