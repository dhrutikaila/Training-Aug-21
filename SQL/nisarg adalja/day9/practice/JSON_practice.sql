/* JSON is a popular Textual Data FROMat that used for exchanging data in modern web and mobile applications.
JSON is also used for storing unstructured data in log files or NoSQL databases such as Microsoft Azure Cosmos DB.*/
/* Many REst Web Services return results that are formatted as JSON text or accept data that formatted as JSON*/


/* OPENJSON */
Declare @json Nvarchar(MAX);
set @json =N'[
    {"id":1,"Name":"nisarg"},
    {"id":2,"Name":"Ridham"}
]';
SELECT * FROM openJSON(@json) with (
    Id INT '$.id',
    Name Nvarchar(50) '$.Name'
)

Declare @json Nvarchar(MAX);
set @json =N'[
    {"id":1,"Name":"nisarg"},
    {"id":2,"Name":"Ridham"}
]';
/*SELECT * FROM openJSON(@json) with (
    Id INT '$.id',
    Name Nvarchar(50) '$.Name'
)
*/
--SELECT FirstName,LastName,Salary,ManagerID,DepartmentID FROM Employees for json path;

/* ISJSON,JSON_VALUE,JSON_MODIFY,JSON_QUERY,OPENJSON */
/* FORJSON */

-- ISJSON fun
-- Tests whether a string contains valid JSON.


if (isjson(@json)>0)
begin
print('It is JSON');
end

SELECT FirstName
FROM Employees
WHERE ISJSON(FirstName) > 0 

CREATE TABLE info1(
id int primary key,
name varchar(40),
Salary nvarchar(max),
Address nvarchar(max),
city nvarchar(max),
)

Declare @json Nvarchar(MAX);
set @json =N'[
    {"id":7,"name":"Nisarg","data":{"Salary":40000,"address":"cccc","city":"Ahmedabad","hobbies": ["Cricket","FootBall","Programming"]}}
]';

set @json=JSON_MODIFY(@json,'$.name','Nisarg')
print @json;

insert INTO info SELECT * FROM openjson(@json) with (
	id Int '$.id',
	name varchar(50) '$.name',
	[data] Nvarchar(max) as json
	);

	SELECT * FROM info;

insert INTO info1 SELECT * FROM openjson(@json) with (
	id Int '$.id',
	name varchar(50) '$.name',
	salary Nvarchar(max) '$.data.Salary',
	address nvarchar(max) '$.data.address',
	city nvarchar(max) '$.data.city'
);
SELECT * FROM info1


--javascript object notation

--isjson


DECLARE @json NVARCHAR(MAX);
SET @json =  '{"info": {"address": [{"town": "Belgrade"}, {"town": "Paris"}, {"town":"Madrid"}]}}';
IF ISJSON(@json) > 0
	PRINT 'yes @json is valid json string'
ELSE
	PRINT 'no @json is not a valid json string'


DECLARE @json NVARCHAR(MAX);
SET @json =  '[{"firstname":"nisarg","lastname":"adalja"},{"firstname":"Deep}]';
IF ISJSON(@json) > 0
	PRINT 'yes @json is valid json string'
ELSE
	PRINT 'no @json is not a valid json string'




--json modify 

DECLARE @info NVARCHAR(MAX) = '{"name":"nisarg","skills":["c","c++","c#","Python","SQL"]}'
PRINT @info

--UPDATE name

SET @info = JSON_MODIFY(@info,'$.name','Nisarg')
set @info =JSON_MODIFY(@info,'$.skills[2]','Java')
PRINT @info


--insert surname
SET @info = JSON_MODIFY(@info,'$.surname','Adalja')
PRINT @info

--delete surname

SET @info = JSON_MODIFY(@info,'$.surname',NULL)
PRINT @info


--add skills
SET @info = JSON_MODIFY(@info,'append $.skills','Node.js')
PRINT @info



--increment a value in json 

DECLARE @counter NVARCHAR(100) = '{"Counter":1}'
PRINT @counter 

SET @counter = JSON_MODIFY(@counter,'$.Counter',CAST(JSON_VALUE(@counter,'$.Counter') AS INT)+1)
PRINT @counter


--modify a whole array
DECLARE @info NVARCHAR(100) = '{"name":"Nisarg","skills":["C#","SQL"]}'
PRINT @info

SET @info = JSON_MODIFY(@info,'$.skills',JSON_QUERY('["java","Python","SQL","Node.js"]'))
PRINT @info



--json value

DECLARE @jsoninfo NVARCHAR(100)
DECLARE @town NVARCHAR(100)

SET @jsoninfo = N'{"info":{"address":[{"city":"Ahmedabad"},{"city":"Gandhinagar"}]}}';

SET @town = JSON_VALUE(@jsoninfo,'$.info.address[0].city');
PRINT @town
SET @town = JSON_VALUE(@jsoninfo,'$.info.address[1].city');
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
