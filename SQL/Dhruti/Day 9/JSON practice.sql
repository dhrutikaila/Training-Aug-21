
--PRACTICE JSON
--ISJSON
DECLARE @JSON NVARCHAR(MAX);
SET @JSON=N'[
{"ID":1,"NAME":"DHRUTI"},
{"ID":2,"NAME":"AVNI"}
]';
SELECT * FROM OPENJSON (@JSON)
WITH (
ID INT '$.ID',
Name NVARCHAR(50)'$.NAME'
)
--JSON_PATH

SELECT EMPLOYEE_ID,FIRST_NAME AS "INFO.NAME",LAST_NAME AS
"INFO.SURNAME",JOINING_DATE as dob
FROM EMPOLYEES
FOR JSON PATH,WITHOUT_ARRAY_WRAPPER

--JSON_MODIFY
DECLARE @jso NVARCHAR(MAX);
SET @jso = '{"info": {"address": [{"town": "Belgrade"}, {"town": "Paris"}, {"town":"Madrid"}]}}';
SET @jso = JSON_MODIFY(@jso, '$.info.address[1].town', 'London');
SELECT modifiedJson = @jso;
--1
DECLARE @js NVARCHAR(MAX);
SET @js = N'[
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
]';
--2 OPEN JSON
SELECT *
FROM OPENJSON(@jsS)
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',
    age INT,
    dateOfBirth DATETIME2 '$.dob'
  );
  --modify_json
  DECLARE @j NVARCHAR(MAX);
SET @j = '{"info": {"address": [{"town": "Belgrade"}, {"town": "Paris"}, {"town":"Madrid"}]}}';
SET @j = JSON_MODIFY(@j, '$.info.address[1].town', 'London');
SELECT modifiedJson = @j;
  --3
  DECLARE @jn NVARCHAR(MAX);
    IF (ISJSON(@jn) > 0)  
BEGIN
SET @jn = N'[
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
]';
END

SELECT *
FROM OPENJSON(@jn)
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',
    age INT,
    dateOfBirth DATETIME2 '$.dob'
  );
 
  -- Do something with the valid JSON value of @param.  


  --4

  DECLARE @jsonVariable NVARCHAR(MAX);
   
SET @jsonVariable = N'[
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
]';     
   

-- INSERT INTO <sampleTable>  
SELECT SalesOrderJsonData.*
FROM OPENJSON (@jsonVariable, N'$')
  WITH (
    Number VARCHAR(200) N'$.Order.Number',
    Date DATETIME N'$.Order.Date',
    Customer VARCHAR(200) N'$.AccountNumber',
    Quantity INT N'$.Item.Quantity'
  ) AS SalesOrderJsonData;