SELECT TOP 10 * FROM HumanResources.Employee FOR JSON PATH
SELECT TOP 10 * FROM HumanResources.Employee FOR JSON PATH,INCLUDE_NULL_VALUES
SELECT TOP 10 * FROM HumanResources.Employee FOR JSON PATH, ROOT('info')
SELECT TOP 10 * FROM HumanResources.Employee FOR JSON AUTO

SELECT 2015 as year, 12 as month, 15 as day  
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER


DECLARE @JSON nvarchar(max)
SET @JSON = '[
  {
    "name": "John",
    "skills": ["SQL", "C#", "Azure"]
  },
  {
    "name": "Jane",
    "surname": "Doe"
  }
]'

IF(ISJSON(@JSON) > 0)
	PRINT 'Valid Json'
ELSE
	PRINT 'Invalid Json'




--------------------------------------------------------------------------------------



DECLARE @jsonInfo NVARCHAR(MAX)

SET @jsonInfo=N'[  
	{
     "info":{    
       "type":1,  
       "address":{    
         "town":"Bristol",  
         "county":"Avon",  
         "country":"England"  
       },  
       "tags":["Sport", "Water polo"]  
    }
	},  
    {"type":"Basic"  }
 ]'

 SELECT JSON_VALUE(@jsonInfo,'$[0].info.type')
 SELECT JSON_VALUE(@jsonInfo,'$[0].info.address.country')
 SELECT JSON_VALUE(@jsonInfo,'$[1].type')





 ------------------------------------------------------------------------------




 
DECLARE @jsonInfo NVARCHAR(MAX)

SET @jsonInfo=N' {
     "info":{    
       "type":1,  
       "address":{    
         "town":"Bristol",  
         "county":"Avon",  
         "country":"England"  
       },  
       "tags":["Sport", "Water polo"]  
    }
	,  
	"type":"Basic"  
 }'


 SELECT JSON_VALUE(@jsonInfo,'$.info.type')
 SELECT JSON_VALUE(@jsonInfo,'$.info.address.country')
 SELECT JSON_VALUE(@jsonInfo,'$.type')





 -----------------------------------------------------------------------------




 
 
DECLARE @jsonInfo NVARCHAR(MAX)

SET @jsonInfo=N' {
     "info":{    
       "type":1,  
       "address":{    
         "town":"Bristol",  
         "county":"Avon",  
         "country":"England"  
       },  
       "tags":["Sport", "Water polo"]  
    }
	,  
	"type":"Basic"  
 }'



 SELECT JSON_QUERY(@jsonInfo,'$.info')
 SELECT JSON_QUERY(@jsonInfo,'$.info.type') -- it returns only object or array
 SELECT JSON_QUERY(@jsonInfo,'$.type')  -- it returns only object or array
 SELECT JSON_QUERY(@jsonInfo,'$.info.address')
 SELECT JSON_QUERY(@jsonInfo,'$.info.tags')





 ---------------------------------------------------------------------------





DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

PRINT @info

-- Update name  

SET @info=JSON_MODIFY(@info,'$.name','Mike')

PRINT @info

-- Insert surname  

SET @info=JSON_MODIFY(@info,'$.surname','Smith')

PRINT @info

-- Delete name  

SET @info=JSON_MODIFY(@info,'$.name',NULL)

PRINT @info

-- Add skill  

SET @info=JSON_MODIFY(@info,'append $.skills','Azure')

PRINT @info




---------------------------------------------------------------------------------




-- Rename value

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




--------------------------------------------------------------------------------


DECLARE @stats NVARCHAR(100)='{"click_count": 173}'

PRINT @stats

-- Increment value  

SET @stats = JSON_MODIFY(@stats,'$.click_count', CAST ( JSON_VALUE(@stats,'$.click_count') AS INT ) + 1 )

PRINT @stats



-----------------------------------------------------------------------------------



DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'

PRINT @info

-- Update skills array

SET @info=JSON_MODIFY(@info,'$.skills','["C#","T-SQL","Azure"]')

PRINT @info -- {"name":"John","skills":"[\"C#\",\"T-SQL\",\"Azure\"]"}
			-- to avoid this use json_query

SET @info=JSON_MODIFY(@info,'$.skills',JSON_QUERY('["C#","T-SQL","Azure"]'))

PRINT @info





----------------------------------------------------------------------------------


CREATE TABLE temp
(
id int,
Name varchar(40)
)


DECLARE @json1 NVARCHAR(MAX);
SET @json1 = N'[
{"id":1,"Name":"Prit"},
{"id":2,"Name":"Man"}
]'

--INSERT INTO temp
SELECT * FROM OPENJSON(@json1)
WITH
(
id int '$.id',
Name varchar(40) '$.Name'
)


SELECT * FROM temp



-------------------------------------------------------------------------------------




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



  -------------------------------------------------------------------------------------



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
  WITH (skill NVARCHAR(8) '$');