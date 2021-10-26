USE Day5_SQL


--1)Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table
SELECT 
CASE Department
WHEN 'Banking' THEN 'Bank Dept'
WHEN 'Insurance' THEN 'Insurance Dept'
WHEN 'Services' THEN 'Services Dept'
END AS 'Departments'
FROM Employee

SELECT * FROM Employee
SELECT * FROM incentives



--2)5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, 
-- need to fetch these result from json variable. and select output in the json format
USE Day9_SQL

CREATE TABLE Students
(
	Name VARCHAR(40) NOT NULL,
	ADDRESS VARCHAR(70) NOT NULL,
	City VARCHAR(20) NOT NULL,
	DOB DATE NOT NULL,
	Standard TINYINT 
)

DECLARE @StudentsJson NVARCHAR(MAX) =
'[{"Name":"Jay Shah","ADDRESS":"D\/406, Raj Apartment, Near Chhani Lake","City":"Vadodara","DOB":"2000-07-05","Standard":6},{"Name":"Raj Parikh","ADDRESS":"F\/402, Mansi park Society, Near Chandola Lake","City":"Ahmedabad","DOB":"1999-05-05","Standard":4},{"Name":"Hardik Vasani","ADDRESS":"D\/406, Krishna Avenue, Near Bus stand","City":"Rajkot","DOB":"2001-01-06","Standard":3},{"Name":"Dilip Shekhavat","ADDRESS":"G\/608, Ram Apartment Beside Isanpur Police Station","City":"Ahmedabad","DOB":"1999-04-07","Standard":10},{"Name":"Deep Parihar","ADDRESS":"A\/309, Ishvarnagar park Near Canal Garden","City":"Surat","DOB":"2000-02-08","Standard":3}]'

SELECT ISJSON(@StudentsJson)
SELECT JSON_VALUE(@StudentsJson,'$[1].DOB') AS DateOfBirth
SELECT JSON_VALUE(@StudentsJson,'$[0].Name') AS Name
SELECT JSON_QUERY(@StudentsJson,'$')
SELECT JSON_MODIFY(@StudentsJson,'$[3].DOB','1998/07/18')
SELECT JSON_VALUE((JSON_MODIFY(@StudentsJson, '$[3].DOB','1998/07/18')),'$[3].DOB') AS DateOfBirth


INSERT INTO Students 
SELECT * FROM OPENJSON(@StudentsJson)
WITH
(
	Name VARCHAR(40) '$.Name',
	Address VARCHAR(70) '$.ADDRESS',
	City VARCHAR(20) '$.City',
	DOB DATE '$.DOB',
	Standard TINYINT '$.Standard'
)


SELECT * FROM Students FOR JSON PATH
SELECT * FROM Students FOR JSON AUTO


