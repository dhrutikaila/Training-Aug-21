--javascript object notation

--isjson

DECLARE @json NVARCHAR(MAX);
SET @json =  '{"info": {"address": [{"town": "Belgrade"}, {"town": "Paris"}, {"town":"Madrid"}]}}';
IF ISJSON(@json) > 0
	PRINT 'yes @json is valid json string'
ELSE
	PRINT 'no @json is not a valid json string'


DECLARE @json NVARCHAR(MAX);
SET @json =  '[{"hello":"world","hello":"brothr"},{unvalid text}]';
IF ISJSON(@json) > 0
	PRINT 'yes @json is valid json string'
ELSE
	PRINT 'no @json is not a valid json string'




--json modify 

DECLARE @info NVARCHAR(MAX) = '{"name":"raviraj","skills":["C#","SQL"]}'
PRINT @info

--update name

SET @info = JSON_MODIFY(@info,'$.name','Ravi')
PRINT @info


--insert surname
SET @info = JSON_MODIFY(@info,'$.surname','Raviraj')
PRINT @info

--delete surname

SET @info = JSON_MODIFY(@info,'$.surname',NULL)
PRINT @info


--add skills
SET @info = JSON_MODIFY(@info,'append $.skills','C++')
PRINT @info



--increment a value in json 

DECLARE @counter NVARCHAR(100) = '{"Counter":1}'
PRINT @counter 

SET @counter = JSON_MODIFY(@counter,'$.Counter',CAST(JSON_VALUE(@counter,'$.Counter') AS INT)+1)
PRINT @counter


--modify a whole array
DECLARE @info NVARCHAR(100) = '{"name":"Raviraj","skills":["C#","SQL"]}'
PRINT @info

SET @info = JSON_MODIFY(@info,'$.skills',JSON_QUERY('["c#","T_SQL",".NET"]'))
PRINT @info



--json value

DECLARE @jsoninfo NVARCHAR(100)
DECLARE @town NVARCHAR(100)

SET @jsoninfo = N'{"info":{"address":[{"town":"Paris"},{"town":"London"}]}}';

SET @town = JSON_VALUE(@jsoninfo,'$.info.address[0].town');
PRINT @town
SET @town = JSON_VALUE(@jsoninfo,'$.info.address[1].town');
PRINT @town


--openjson

DECLARE @json NVARCHAR(2048) = N'{
   "String_value": "John",
   "Integer_value": 45,
   "DoublePrecisionFloatingPoint_value": 2.3456,
   "BooleanTrue_value": true,
   "BooleanFalse_value": false,
   "Null_value": null,
   "Array_value": ["a","r","r","a","y"],
   "Object_value": {"obj":"ect"}
}';

SELECT * FROM OPENJSON(@json)



---we can also provide a json path

--for ex


DECLARE @json NVARCHAR(4000) = N'{"path": {"to":{"sub-object":["en-GB", "en-UK","de-AT","es-AR","sr-Cyrl"]}}}';

SELECT [key],value
FROM OPENJSON(@json,'$.path.to."sub-object"')

--WITH clause

DECLARE @json NVARCHAR(MAX) = N'[  
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
FROM OPENJSON (@json)
WITH (
	Number VARCHAR(200) '$.Order.Number',
	Date DATETIME '$.Order.Date',
	Customer VARCHAR(200) '$.AccountNumber',
	Quantity INT '$.Item.Quantity',
	[Order] NVARCHAR(MAX) AS JSON
)
