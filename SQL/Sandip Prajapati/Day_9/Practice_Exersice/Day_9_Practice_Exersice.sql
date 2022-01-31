-------------DAY-9-------------
--VARIABLE DECLARE, SET AND PRINT
DECLARE @SALARY INT
SET @SALARY = 45000
PRINT @SALARY

SELECT Salary=@SALARY  FROM Employees
WHERE Salary>25000;
GO
SELECT * FROM Employees

-----BATCH
--IF...ELSE
DECLARE @SALARY INT
SELECT @SALARY =Salary FROM Employees
WHERE EmployeeID = '100'
IF @SALARY>25000
PRINT 'yeah it is greater'
ELSE 
BEGIN 
PRINT 'NEAH ITS NOT'
PRINT 'SALARY='
PRINT @SALARY
END 
GO

--CASE
SELECT
EmployeeID,
CASE Salary
	WHEN 25000 THEN Salary*1.25
	WHEN 15000 THEN Salary*1.15
	WHEN 5000 THEN Salary*1.05
	ELSE Salary*1.01
END
FROM Employees
GO

---------WHILE
WHILE (SELECT AVG(Salary) FROM Employees)<15000
BEGIN
	UPDATE Employees
		SET Salary = Salary*2
	SELECT  AVG(Salary) FROM Employees
	IF (SELECT AVG(Salary) FROM Employees)>15000
		BREAK
	ELSE
		CONTINUE
END
PRINT 'DONE TO GREATER 15000';
SELECT Salary FROM Employees;

-----JSON data in SQL Server
--JSON DATA
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}';

-------OPENJSON
----OPENJSON WITH DEFAULT OUTPUT
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}';
SELECT * FROM OPENJSON(@json);
--Return array of object and also convert json to temporary table
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}';
SELECT [key],value FROM OPENJSON(@json,'$.skills');

--combine relational and json data
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}';
SELECT FirstName,LastName, value as jsontab FROM Employees_1
CROSS APPLY OPENJSON(@json)

----OPENJSON WITH EXPLICIT OUTPUT
DECLARE @json NVARCHAR(MAX)
SET @json =   
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
 SELECT * FROM 
 OPENJSON(@json)
 WITH(
 NUMBER VARCHAR(100) '$.Order.Number',
 DATE  DATETIME '$.Order.Date' ,
 Customer VARCHAR(1000 ) '$.AccountNumber' ,
 Price VARCHAR(100) '$.Item.Price' ,
 Quantity Int '$.Item.Quantity'
 )

 --RETURN jSON Object
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

SELECT * FROM OPENJSON(@json,'$.someObject.someArray')
WITH
(
K1 INT '$.k1',
K2 VARCHAR(20) '$.k2',
col3 varchar(6) '$.k3',
col4 varchar(10) '$.k4.data',
col5 Nvarchar(MAX) '$.k4' AS JSON,
array_element Nvarchar(MAX) '$' AS JSON
)

--INSERT JSON DATA INTO TABLE
DECLARE @json NVARCHAR(MAX) = '{  
  "id" : 209,  
  "firstName": "John",  
  "lastName": "Smith",  
  "isAlive": "tr",  
  "age": 25,  
  "dateOfBirth": "2015-03-25T12:00:00",  
  "spouse": null  
  }'; 
 INSERT INTO Employees_1(EmployeeID,FirstName,LastName,Email,HireDate,JobId)
SELECT * FROM OPENJSON(@json)
WITH
(
id int '$.id',  
firstName nvarchar(50) '$.firstName',
lastName nvarchar(50) '$.lastName' ,
Email VARCHAR(30) '$.dateOfBirth',
HireDate datetime '$.dateOfBirth',
JobId varchar(20) '$.age'
)
SELECT * FROM Employees_1

--ISJSON
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'
IF ISJSON(@json)>0
	print 'It is Valid Json'
ELSE 
	print 'It is Invalid'

DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"}'
IF ISJSON(@json)>0
	print 'It is Valid Json'
ELSE 
	print 'It is Invalid Json'

--JSON VALUE
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'
SELECT JSON_VALUE(@json,'$.name') FROM OPENJSON(@json)
--array
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'
SELECT JSON_VALUE(@json,'$.skills[0]') FROM OPENJSON(@json);
SELECT JSON_VALUE(@json,'$.skills[0]'),JSON_VALUE(@json,'$.skills[1]'),JSON_VALUE(@json,'$.skills[2]') FROM OPENJSON(@json)

--JSON QUERY
--object
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'
SELECT JSON_QUERY(@json,'$') FROM OPENJSON(@json)

--array
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'
SELECT JSON_QUERY(@json,'$.skills') FROM OPENJSON(@json)

--JSON MODIFY
--MODIFY VALUE
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json = JSON_MODIFY(@json,'$.name','Sandip')
print @json

--INSERT VALUE
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json = JSON_MODIFY(@json,'$.nickname','Sundy')
print @json

--Delete Value
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json = JSON_MODIFY(@json,'$.name',Null)
print @json

--ADD IN ARRAY
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json = JSON_MODIFY(@json,'append $.skills','Python')
print @json

--multiple update
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json=JSON_MODIFY(JSON_MODIFY(JSON_MODIFY(@json,'$.name','Mike'),'$.surname','Smith'),'append $.skills','Azure')
print @json

--Rename Key
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json = JSON_MODIFY(JSON_MODIFY(@json,'$.FirstName',CAST(JSON_VALUE(@json,'$.name') AS varchar(25))),'$.name',NULL)
print @json

--INCREMENT VALUE
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json = JSON_MODIFY(@json,'$.age',CAST(JSON_VALUE(@json,'$.age') AS int)+1)
PRINT @json

--MODIFY OBJECT
DECLARE @json NVARCHAR(MAX)
SET @json='{"name":"John","surname":"Doe","age":22,"skills":["SQL","C#","MVC"]}'
SET @json =JSON_MODIFY(@json,'$.skills','["PYTHON","REACT","NODE"]')
PRINT @json

--JSON PATH
SELECT * FROM Employees FOR JSON PATH 
SELECT * FROM Employees FOR JSON PATH , ROOT('EmployeesInfo')

SELECT EmployeeID,FirstName,LastName,DepartmentName FROM Employees AS EMP JOIN Departments AS DEP ON EMP.EmployeeID = DEP.DepartmentID
FOR JSON PATH
--JSON AUTO
SELECT * FROM Employees FOR JSON AUTO
SELECT * FROM Employees FOR JSON AUTO , ROOT('EmployeesInfo')

SELECT EmployeeID,FirstName,LastName,DepartmentName FROM Employees AS EMP JOIN Departments AS DEP ON EMP.EmployeeID = DEP.DepartmentID
FOR JSON AUTO

--WITHOUT ARRAY WRAPPER
SELECT * FROM Employees FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER

SELECT 2015 as year, 12 as month, 15 as day  
FOR JSON PATH

SELECT 2015 as year, 12 as month, 15 as day  
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER 
