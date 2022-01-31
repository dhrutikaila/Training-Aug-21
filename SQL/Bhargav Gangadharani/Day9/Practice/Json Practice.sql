-- Convert Json text into Tabular form--

Declare @json varchar(max)
Set @json =  N'[  
  {"id": 2, "info": {"name": "Raj", "surname": "Sharma"}, "age": 25},
  {"id": 5, "info": {"name": "Tushar", "surname": "Mehta", "skills": ["SQL", "C#", "Azure"]}, "dob": "2005-11-04T12:00:00"}  
]';
Select * from OPENJSON(@json) 
with ( 
		Id int '$.id',
		Name varchar(20) '$.info.name',
		Surname Varchar(20) '$.info.surname',
		Age int '$.age',
		DOB datetime '$.dob',
		Skills nvarchar(max) '$.info.skills' as json 
		)


-- Json_Value, Json_Query --

create table  Temp 
( 
	Id int,
	Name varchar(20),
	Surname varchar(20),
	age int, 
	DOB datetime,
	Skills nvarchar(max)
	)

Declare @json varchar(max)
Set @json =  N'[  
  {"id": 2, "info": {"name": "Raj", "surname": "Sharma"}, "age": 25},
  {"id": 5, "info": {"name": "Tushar", "surname": "Mehta", "skills": ["SQL", "C#", "Azure"]}, "dob": "2005-11-04T12:00:00"}  
]';


Insert into Temp
Select * from OPENJSON(@json) 
with ( 
		Id int '$.id',
		Name varchar(20) '$.info.name',
		Surname Varchar(20) '$.info.surname',
		Age int '$.age',
		DOB datetime '$.dob',
		Skills nvarchar(max) '$.info.skills' as json 
		)
		outer apply openjson(Skills)
		with(
			skills nvarchar(10) '$'
			)
Select Id, Name, Surname, Age, DOB, 
			JSON_VALUE(Skills, '$[0]')Skill1, 
			JSON_VALUE(Skills, '$[1]')Skill2, 
			JSON_VALUE(Skills, '$[2]')Skill3  
from temp

-- Json into sql table 

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
   
SELECT * FROM  
 OPENJSON ( @json )  
WITH (   
              Number   varchar(200) '$.Order.Number' ,  
              Date     datetime     '$.Order.Date',  
              Customer varchar(200) '$.AccountNumber',  
              Quantity int          '$.Item.Quantity'  
 )

 -- Json_modify 

 DECLARE @info NVARCHAR(100)='{"name":"Rahul","skills":["C#","SQL"]}'

PRINT @info

SET @info=JSON_MODIFY(@info,'$.name','Sachin')

PRINT @info

SET @info=JSON_MODIFY(@info,'append $.skills','Azure')

PRINT @info