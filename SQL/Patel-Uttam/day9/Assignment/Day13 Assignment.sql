USE [Day13 (JSON)]


-- Assignment

/*

5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result
from json variable. and select output in the json format
*/



CREATE TABLE Student
(
Name varchar(20) Not Null, 
Address varchar(20) Not Null, 
City varchar(20) Not Null, 
DOB varchar(10) Not null, 
Standard int not null
);


INSERT iNTO Student VALUES
('Keyur','raj Society','Kadi','17-01-2000',5),
('Raj','raj Society','Kadi','03-02-2001',4),
('Kunj','raj Society','Kadi','24-05-2000',5),
('Rahul','raj Society','Kadi','2001-1995',10),
('Harsh','raj Society','Kadi','01-06-1998',7);



-- to JSON

SELECT * FROM Student FOR JSON PATH  --ROOT('Student')



-- JSON
DECLARE @json1 nvarchar(MAX)
SET @json1 = '[{"Name":"Keyur","Address":"raj Society","City":"Kadi","DOB":"17-01-2000","Standard":5},{"Name":"Raj","Address":"raj Society","City":"Kadi","DOB":"03-02-2001","Standard":4},{"Name":"Kunj","Address":"raj Society","City":"Kadi","DOB":"24-05-2000","Standard":5},{"Name":"Rahul","Address":"raj Society","City":"Kadi","DOB":"2001-1995","Standard":10},{"Name":"Harsh","Address":"raj Society","City":"Kadi","DOB":"01-06-1998","Standard":7}]'

-- Select from json 

SELECT * FROM OPENJSON(@json1)
WITH(
Name nvarchar(MAX) '$.Name' ,
Address nvarchar(MAX) '$.Address',
City nvarchar(MAX) '$.City' ,
DOB nvarchar(MAX) '$.DOB',
Standard nvarchar(MAX) '$.Standard'
)
