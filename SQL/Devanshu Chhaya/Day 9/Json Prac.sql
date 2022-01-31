--ISJSON

DECLARE @json NVARCHAR(MAX)
SET @json =   
  N'[  
       {  
         "Order": {  
           "Number":"SO43659",  
           "Date":"2011-05-31T00:00:00"  
         },  
         "AccountNumber":"AW29825",  
         "Item": {  
           "Price":2024.9940,  
           "Quantity":1  
         }  
       },  
       {  
         "Order": {  
           "Number":"SO43661",  
           "Date":"2011-06-01T00:00:00"  
         },  
         "AccountNumber":"AW73565",  
         "Item": {  
           "Price":2024.9940,  
           "Quantity":3  
           }
      }  
 ]'  

IF (ISJSON(@json)>0)   
SELECT * 
FROM OPENJSON(@json)
WITH
(	
	Number NVARCHAR(MAX) '$.Order.Number',
	Date DATETIME '$.Order.Date',
	AccountNumber NVARCHAR(MAX) '$.AccountNumber',
	Price DECIMAL (8,3) '$.Item.Price',
	Quantity INT '$.Item.Quantity'
)


--JSON_VALUE


------ JSON_VALUE 

USE AdventureWorks2012


DECLARE @jsonInfo NVARCHAR(MAX)
DECLARE @town1 NVARCHAR(32)
DECLARE @town2 NVARCHAR(32)


SET @jsonInfo=N'{"info":{"address":[{"town":"Paris"},{"town":"London"}]}}';

SET @town1=JSON_VALUE(@jsonInfo,'$.info.address[0].town'); -- Paris
SET @town2=JSON_VALUE(@jsonInfo,'$.info.address[1].town'); -- London

PRINT @town1
PRINT @town2

--JSON_QUERY
--JSON_MODIFY


-- Update name  

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

SET @info=JSON_MODIFY(@info,'$.name','Mike')

PRINT @info

-- Insert surname  

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

SET @info=JSON_MODIFY(@info,'$.surname','Smith')

PRINT @info

-- Delete name  

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

SET @info=JSON_MODIFY(@info,'$.name',NULL)

PRINT @info

-- Add skill  

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

SET @info=JSON_MODIFY(@info,'append $.skills','Azure')

PRINT @info


-- Multiple updates  


DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

PRINT @info

SET @info=JSON_MODIFY(JSON_MODIFY(JSON_MODIFY(@info,'$.name','Mike'),'$.surname','Smith'),'append $.skills','Azure')

PRINT @info


---- Rename Key

DECLARE @product NVARCHAR(100)='{"price":49.99}'

PRINT @product


-- Rename property  

SET @product=
 JSON_MODIFY(
  JSON_MODIFY(@product,'$.Price',CAST(JSON_VALUE(@product,'$.price') AS NUMERIC(4,2))),
  '$.price',
  NULL
 )

PRINT @product

---- Increment a Value

DECLARE @stats NVARCHAR(100)='{"click_count": 173}'

PRINT @stats

SET @stats=JSON_MODIFY(@stats,'$.click_count',
 CAST(JSON_VALUE(@stats,'$.click_count') AS INT)+1)

PRINT @stats

--- Modify a Object

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

PRINT @info

SET @info=JSON_MODIFY(@info,'$.skills',JSON_QUERY('["C#","T-SQL","Azure"]'))

PRINT @info


----- export json

---- JSON AUTO
select * from SalesLT.Address for JSON AUTO

use [AdventureWorksLT2017]
SELECT S.AddressID ,S.AddressLine1,S.City,C.AddressType,C.CustomerID,C.ModifiedDate 
FROM SalesLT.Address S 
	JOIN SalesLT.CustomerAddress C ON S.AddressID=C.AddressID 
	FOR JSON AUTO

SELECT C.AddressType,S.AddressID ,S.AddressLine1,S.City,C.CustomerID,C.ModifiedDate 
	FROM SalesLT.Address S 
	JOIN SalesLT.CustomerAddress C ON S.AddressID=C.AddressID 
	FOR JSON AUTO

SELECT S.AddressID ,S.AddressLine1,S.City,C.AddressType 
	FROM SalesLT.Address S 
	JOIN SalesLT.CustomerAddress C ON S.AddressID=C.AddressID 
	FOR JSON AUTO,
	WITHOUT_ARRAY_WRAPPER

---- JSON PATH

use [AdventureWorksLT2017]
SELECT S.AddressID ,S.AddressLine1,S.City,C.AddressType,C.CustomerID,C.ModifiedDate 
	FROM SalesLT.Address S 
	JOIN SalesLT.CustomerAddress C ON S.AddressID=C.AddressID 
	FOR JSON PATH

SELECT S.AddressID AS [S.AddressID],
		S.AddressLine1 AS [S.AddressLine1],
		S.City AS [S.City],
		C.AddressType,C.CustomerID,C.ModifiedDate 
	FROM SalesLT.Address S 
	JOIN SalesLT.CustomerAddress C ON S.AddressID=C.AddressID 
	FOR JSON PATH

SELECT S.AddressID ,S.AddressLine1,S.City,
	(SELECT S.AddressID ,S.AddressLine1,S.City,C.AddressType,C.CustomerID,C.ModifiedDate 
		FROM SalesLT.Address S 
		JOIN SalesLT.CustomerAddress C ON S.AddressID=C.AddressID 
		FOR JSON PATH) Cust
	FROM SalesLT.Address S 
	JOIN SalesLT.CustomerAddress C ON S.AddressID=C.AddressID 
	FOR JSON PATH



SELECT * FROM SalesLT.Address
SELECT * FROM SalesLT.CustomerAddress



----- convert json collection to rawset


ALTER DATABASE AdventureWorks2012 SET COMPATIBILITY_LEVEL = 130


--------- Use OPENJSON with an Default Schema


DECLARE @json NVARCHAR(MAX)

SET @json='[{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]},
			{"name":"David","surname":"Smith","age":21,"skills":["SQL"]}]'

SELECT * FROM OPENJSON(@json)


--------- Use OPENJSON with an Explicit Schema

DECLARE @json NVARCHAR(MAX)
SET @json =   
  N'[  
       {  
         "Order": {  
           "Number":"SO43659",  
           "Date":"2011-05-31T00:00:00"  
         },  
         "AccountNumber":"AW29825",  
         "Item": {  
           "Price":2024.9940,  
           "Quantity":1  
         }  
       },  
       {  
         "Order": {  
           "Number":"SO43661",  
           "Date":"2011-06-01T00:00:00"  
         },  
         "AccountNumber":"AW73565",  
         "Item": {  
           "Price":2024.9940,  
           "Quantity":3  
         }  
      }  
 ]'  
   
SELECT * 
FROM OPENJSON(@json)
WITH
(	
	Number NVARCHAR(MAX) '$.Order.Number',
	Date DATETIME '$.Order.Date',
	AccountNumber NVARCHAR(MAX) '$.AccountNumber',
	Price DECIMAL (8,3) '$.Item.Price',
	Quantity INT '$.Item.Quantity'
)



DECLARE @json NVARCHAR(MAX) =
N'{"someObject":   
    {"someArray":  
      [  
          {"k1": 11, "k2": null, "k3": "text"},  
          {"k1": 21, "k2": "text2", "k4": { "data": "text4" }},  
          {"k1": 31, "k2": 32},  
          {"k1": 41, "k2": null, "k4": { "data": false }}     
       ]  
    }  
 }'  
   
SELECT * FROM  
 OPENJSON(@json, N'lax $.someObject.someArray')  
WITH ( k1 int,   
        k2 varchar(100),  
        col3 varchar(6) N'$.k3',  
        col4 varchar(10) N'lax $.k4.data',  
        col5 nvarchar(MAX) N'lax $.k4' AS JSON, 
        array_element nvarchar(MAX) N'$' AS JSON  
 )


 DECLARE @json NVARCHAR(MAX);
SET @json = N'[
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
]';

SELECT *
FROM OPENJSON(@json)
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',
    age INT,
    dateOfBirth DATETIME2 '$.dob'
  );


  DECLARE @json NVARCHAR(MAX);
SET @json = N'[  
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith", "skills": ["SQL", "C#", "Azure"]}, "dob": "2005-11-04T12:00:00"}  
]';

SELECT *  
FROM OPENJSON(@json)  
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',  
    age INT,
    dateOfBirth DATETIME2 '$.dob',
    skills NVARCHAR(MAX) '$.info.skills' AS JSON
  )

  OUTER APPLY OPENJSON(skills)
	WITH (Skill NVARCHAR(8) '$');


