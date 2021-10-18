USE Practice_Exercise

--[1] Processing JSON
--		ISJSON

DECLARE @Json_Data NVARCHAR(MAX)

SET @Json_Data=
'{
"Name":"Deep",
"Department":"Dot Net",
"City":"Ahmedabad",
"Skill" : ["SSMS","C#",".NET"]
}'

IF(ISJSON(@Json_Data)=1)
BEGIN
PRINT('This is Valid Json Data')
SELECT * FROM OPENJSON(@Json_Data)
END
ELSE
PRINT('Somthing Wrong In Your Json Data..')
-----------------------------------------------------------

------------------- JSON_VALUE ---------------------------

DECLARE @jsonInfo NVARCHAR(MAX)

SET @jsonInfo=
'{  
     "info":
	 {    
       "type":1,  
       "address":
	   {    
         "town":"Bristol",  
         "county":"Avon",  
         "country":"England"  
       },  
       "tags":["Sport", "Water polo"]  
    },  
    "type":"Basic"  
 }'

PRINT JSON_VALUE(@jsonInfo,'$.info.address.town')

SELECT JSON_VALUE(@jsonInfo,'$.info.tags[0]') AS Activity

SELECT FirstName, LastName,
JSON_VALUE(@jsonInfo,'$.info.address.country') AS Town
FROM Person.Person

------------- JSON_QUERY -----------------------

SELECT JSON_QUERY(@jsonInfo,'$.info.address')

SELECT JSON_QUERY(@jsonInfo,'$.info.tags')

-- SELECT JSON_QUERY(@jsonInfo,'$.info.tags[0]') it's genrate error 

------------ JSON_MODIFY ------------------------

SELECT JSON_MODIFY(@jsonInfo,'$.info.town','London')

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'
PRINT @info

-- Multiple updates  
SET @info=JSON_MODIFY(JSON_MODIFY(JSON_MODIFY(@info,'$.name','Mike'),'$.surname','Smith'),'append $.skills','Azure')
PRINT @info


--------------------------------------------------------------
--JSON object that contains duplicate keys

DECLARE @json NVARCHAR(MAX)
SET @json=N'{"person":{"info":{"name":"John", "name":"Jack"}}}'

SELECT * FROM OPENJSON(@json,'$.person.info')

SELECT VALUE FROM OPENJSON(@json,'$.person.info')

SELECT JSON_VALUE(@json,'$.person.info') AS PERSON_NAME

SELECT JSON_QUERY(@json,'$.person.info') AS PERSONS_NAME
---------------------------------------------------------------------


-----------[2] Convert JSON collections to a rowset-------------------

------------------------------OPENJSON--------------------------------
DECLARE @json NVARCHAR(MAX) 

SET @json=
'[  
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

SELECT * INTO INFO FROM
(
SELECT *
FROM OPENJSON (@json)  
WITH (   
              Number   VARCHAR(20)   '$.Order.Number',  
              Date     DATETIME       '$.Order.Date',  
              Customer VARCHAR(20)   '$.AccountNumber',  
              Quantity INT            '$.Item.Quantity',
			  Price DECIMAL(9,4)      '$.Item.Price',
              [Order]  NVARCHAR(MAX)  AS JSON  
 ))TEMP
 


--[3] Convert SQL Server data to JSON or export JSON
--------------FOR JSON PATH------------------

 SELECT * FROM INFO FOR JSON PATH

--------------FOR JSON AUTO------------------

SELECT * FROM INFO FOR JSON AUTO

-------------WITHOUT_ARRAY_WRAPPER-----------

SELECT TOP 3 SalesOrderNumber, OrderDate, Status  
FROM Sales.SalesOrderHeader  
ORDER BY ModifiedDate  
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER

----------------------Dot-separated column names---------------------

SELECT TOP 5   
       BusinessEntityID As Id,  
       FirstName, LastName,  
       Title As 'Info.Title',  
       MiddleName As 'Info.MiddleName'  
   FROM Person.Person  
   FOR JSON PATH

--------------------------ROOT option--------------------------------
SELECT TOP 5   
       BusinessEntityID As Id,  
       FirstName, LastName,  
       Title As 'Info.Title',  
       MiddleName As 'Info.MiddleName'  
   FROM Person.Person  
   FOR JSON PATH, ROOT('info')

-----------------------FOR NULL VALUE---------------------------------

SELECT M.ProductModelID,M.Name as [ProductModel.Name],
ProductID, Size
FROM Production.Product P
INNER JOIN Production.ProductModel M ON P.ProductModelID = M.ProductModelID
WHERE M.ProductModelID= 33
FOR JSON Path, INCLUDE_NULL_VALUES


