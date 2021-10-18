---5 Students Name, Address, City, DOB, Standard need to be INSERTed in the student table, need to fetch these result FROM json variable. and SELECT output in the json format



use Subqueries

SELECT * FROM student for JSON PATH

DECLARE @json NVARCHAR(max)
SET @json='[{"id":1,"name":"chirag","city":"ahnedabad","standard":10,"dob":"1998-01-01"},
			{"id":2,"name":"meet","city":"surat","standard":12,"dob":"1999-09-09"},
			{"id":3,"name":"jay","city":"rajkote","standard":11,"dob":"1995-10-11"}]'


INSERT into demostudent 
	SELECT id,name,city,standard,dob FROM OPENJSON(@json)
	WITH
	(
	id int '$.id',
	name varchar(35) '$.name',
	city varchar(35) '$.city',
	standard int  '$.standard',
	dob date '$.dob'
	)


