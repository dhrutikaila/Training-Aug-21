------------------Day-9------------------
---------Assignment---------
--Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table
SELECT CASE DepartmentName 
WHEN 'BANKING' THEN 'BANK DEPT'
WHEN 'INSURANCE' THEN 'INSURANCE DEPT'
WHEN 'SERVICES' THEN 'SERVICES DEPT'
ELSE DepartmentName
END
FROM Departments

--5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format
declare @students nvarchar(max)
set @students = '{"students":[
   {"name":"John", "address": {
        "streetAddress": "6",
        "postalCode": "794221"
    },"city":"Agra","DOB":"1999-4-2","Stardard":12},
   {"name":"Steve", "address": {
        "streetAddress": "16",
        "postalCode": "194221"
    },"city":"Delhi","DOB":"2000-4-3","Stardard":12},
   {"name":"Peter","address": {
        "streetAddress": "26",
        "postalCode": "694221"
    },  "city":"Chennai","DOB":"2000-2-12","Stardard":12},
   {"name":"Chaitanya", "address": {
        "streetAddress": "126",
        "postalCode": "394221"
    },"city":"Bangalore","DOB":"1999-6-25","Stardard":12},
	{"name":"Aaditya", "address": {
        "streetAddress": "12",
        "postalCode": "294221"
    },"city":"Ahmedabad","DOB":"1999-7-5","Stardard":12}
]}'

SELECT *  FROM OPENJSON(@students,'$.students')
WITH
(
Name Varchar(25) '$.name',
streetAddress int '$.address.streetAddress',
PostalCode int '$.address.postalCode',
City Varchar(30) '$.city',
DOB date '$.DOB',
Standard int
)
FOR JSON PATH

------OR
declare @students nvarchar(max)
set @students = '{"students":[
   {"name":"John", "address": {
        "streetAddress": "6",
        "postalCode": "794221"
    },"city":"Agra","DOB":"1999-4-2","Stardard":12},
   {"name":"Steve", "address": {
        "streetAddress": "16",
        "postalCode": "194221"
    },"city":"Delhi","DOB":"2000-4-3","Stardard":12},
   {"name":"Peter","address": {
        "streetAddress": "26",
        "postalCode": "694221"
    },  "city":"Chennai","DOB":"2000-2-12","Stardard":12},
   {"name":"Chaitanya", "address": {
        "streetAddress": "126",
        "postalCode": "394221"
    },"city":"Bangalore","DOB":"1999-6-25","Stardard":12},
	{"name":"Aaditya", "address": {
        "streetAddress": "12",
        "postalCode": "294221"
    },"city":"Ahmedabad","DOB":"1999-7-5","Stardard":12}
]}'

SELECT * INTO STUDENTTABLE FROM OPENJSON(@students,'$.students')
WITH
(
Name Varchar(25) '$.name',
streetAddress int '$.address.streetAddress',
PostalCode int '$.address.postalCode',
City Varchar(30) '$.city',
DOB date '$.DOB',
Standard int
)

SELECT * FROM STUDENTTABLE FOR JSON AUTO