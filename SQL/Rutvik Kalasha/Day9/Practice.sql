--ISJSON EXAMPLE

DECLARE @data nvarchar(255);
SET @data = '{"Name": "Bob"}';
IF (ISJSON(@data) > 0)
    SELECT 'Valid JSON' AS 'Result';
ELSE
    SELECT 'Invalid JSON' AS 'Result';


--JSON_VALUE EXAMPLE
DECLARE @jsonString NVARCHAR(MAX) = '[
						{"Id" : 1 , "FirstName" : "Rutvik", "Department" : "DOTNET","Salary" : 15000},
						{"Id" : 2 , "FirstName" : "Darshan", "Department" : "IT","Salary" : 25000},
						{"Id" : 3 , "FirstName" : "Ankit", "Department" : "HR","Salary" : 55000}
						]'
--1
SELECT JSON_VALUE(@jsonString, '$[2].Department') AS Department
--2
PRINT JSON_VALUE(@jsonString, '$[2].Department') 

--JSON_QUERY AND JSON_MODIFY EXAMPLE

DECLARE @jsonString NVARCHAR(MAX) =

'{"country" : {

				"India":[{"state" : "Gujarat", "cities": ["Surat", "Ahmedabad", "Vadodara"]}, 
						 {"state": "Rajasthan", "cities" : ["Jaypur", "Udaypur"]}, 
					     {"state": "Maharastra", "cities" : ["Mumbai", "Pune", "Nasik"]}
						 ],

				"USA": [
						{"state": "Texas", "cities" : ["Austin", "Dallas", "Houston"]}, 
						{"state": "Florida", "cities": ["Miami", "Tampa", "Orlando"]}
					   ]
			   }                                  
}'

--1
PRINT JSON_QUERY(@jsonString, '$.country.India')

--2
SELECT JSON_QUERY(@jsonString, '$.country.India[0].cities')

--3
PRINT 'Before Modify : ' + JSON_QUERY(@jsonString, '$.country.India[0].cities')

SET @jsonString = JSON_MODIFY (@jsonString, '$.country.India[0].cities[2]','Rajkot')

PRINT 'After Modify : ' + JSON_QUERY(@jsonString, '$.country.India[0].cities')

--JSON EXAMPLE

DECLARE @json1 NVARCHAR(MAX),@json2 NVARCHAR(MAX)

SET @json1=N'{"name": "Rutvik", "surname":"Kalasha"}'

SET @json2=N'{"name": "Rutvik", "age":21}'

SELECT *
FROM OPENJSON(@json1)
UNION ALL
SELECT *
FROM OPENJSON(@json2)
WHERE [key] NOT IN (SELECT [key] FROM OPENJSON(@json1))

--FOR JSON AUTO
SELECT * FROM Employees FOR JSON AUTO

--NEW JSON EXAMPLE
DECLARE @json NVarChar(2048) = N'{
								"owner": null,
								"brand": "BMW",
								"year": 2020,
								"status": false,
								"color": [ "red", "white", "yellow" ],
 
  
								"Model": {
								"name": "BMW M4",
								"Fuel Type": "Petrol",
								"TransmissionType": "Automatic",
								"Turbo Charger": "true",
								"Number of Cylinder": 4
 
  }
}';
SELECT * FROM OpenJson(@json);

--1
SELECT * FROM OpenJson(@json)
WITH (CarOwner NVARCHAR(200) '$.owner',
CarBrand NVARCHAR(200) '$.brand',
CarModel INT '$.year',
CarPrice BIT '$.status',
CarColor NVARCHAR(MAX) '$.color' AS JSON,
CarColor NVARCHAR(MAX) '$.Model' AS JSON
)

--2
SELECT * FROM OpenJson(@json)
WITH (CarBrand VARCHAR(100) '$.brand',
CarModel INT '$.year',
CarPrice MONEY '$.price',
CarColor VARCHAR(100) '$.color',
CarOwner NVARCHAR(200) '$.owner'
)
 
