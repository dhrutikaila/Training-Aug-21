--Declare Json data 
DECLARE @json NVARCHAR(MAX)
SET @json = '[
  {
    "id": 2,
    "info": {
      "name": "John",
      "surname": "Smith"
    },
    "age": 25
  },
  {
    "id": 5,
    "info": {
      "name": "Jane",
      "surname": "Smith",
      "skills": ["SQL", "C#", "Azure"]
    },
    "dob": "2005-11-04T12:00:00"
  }
]'


SELECT ISJSON(@json)
--cte
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
  WITH (skill NVARCHAR(8) '$')

------------------------------------------------------------------------------

--Create Table 
 CREATE TABLE UserDetails 
 (
    Number VARCHAR(200) NOT NULL ,
    [Date] DATETIME NOT NULL,
    Customer VARCHAR(200) NOT NULL ,
    Quantity INT NOT NULL
 )
--Declare Json data
DECLARE @jsonVariable NVARCHAR(MAX)

SET @jsonVariable = '[
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

SELECT ISJSON(@jsonVariable)

--Insert data into table   
INSERT INTO UserDetails
SELECT * FROM OPENJSON (@jsonVariable, '$')
  WITH (
    Number VARCHAR(200) '$.Order.Number',
    [Date] DATETIME '$.Order.Date',
    Customer VARCHAR(200) '$.AccountNumber',
    Quantity INT '$.Item.Quantity'
  ) 

SELECT * FROM UserDetails
--------------------------------------------------------------------------

--Modify Json data
DECLARE @json NVARCHAR(MAX)
SET @json = '{
  "info": {
    "address": [
      { "town": "Belgrade" },
      { "town": "Paris" },
      { "town": "Madrid" }
    ]
  }
}'

SELECT ISJSON(@json)
SELECT @json

SET @json = JSON_MODIFY(@json, '$.info.address[1].town', 'London')
SELECT modifiedJson = @json

