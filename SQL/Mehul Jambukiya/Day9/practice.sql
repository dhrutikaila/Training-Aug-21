USE Practice
--Batch
--Declare Variable

DECLARE @Variable INT
DECLARE @Variable2 INT = 5

--Setting values of the variable

SET @Variable = 6

--If-else

IF(@Variable) < 5 
BEGIN
PRINT @Variable
END
ELSE
BEGIN
PRINT 'Limit Exceed'
END

--Case Statement

CREATE TABLE Demo7
(
ID INT CONSTRAINT Demo7_ID_PK PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(60) CONSTRAINT Demo7_Name_NotNull NOT NULL,
Salary MONEY CONSTRAINT Demo7_Salary_NotNull NOT NULL
)

INSERT INTO Demo7 VALUES ('John',18500),('Steven',22000),('Roy',18000),('Tom',21000)

SELECT * FROM Demo7

UPDATE Demo7 SET Salary = 
CASE 
WHEN Salary<20000 THEN Salary+2000
WHEN Salary>20000 THEN Salary+3000
ELSE Salary
END

--While

CREATE TABLE Demo8
(
ID INT CONSTRAINT Demo8_ID_PK PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(60) CONSTRAINT Demo8_Name_NotNull NOT NULL,
ReadStatus INT CONSTRAINT Demo8_ReadStatus_Def0 DEFAULT 0
)

INSERT INTO Demo8 (Name) VALUES ('John'),('Steven'),('Roy'),('Tom')


SELECT * FROM Demo8
DECLARE @CountVar INT = 1
DECLARE @MaxVar INT = (SELECT MAX(ID) FROM Demo8)
WHILE(@CountVar<=@MaxVar)
BEGIN
SELECT * FROM Demo8 WHERE Id=@CountVar
UPDATE Demo8 SET ReadStatus += 1 WHERE Id=@CountVar
SET @CountVar += 1
END


--Processing JSON
--ISJSON

DECLARE @jsondata NVARCHAR(MAX)
SET @jsondata = '[
{"Name":"Abc1","City":"xyz1"},
{"Name":"Abc2","City":"xyz2"},
{"Name":"Abc3","City":"xyz3"}
]'

IF(ISJSON(@jsondata)>0)
SELECT * FROM OPENJSON(@jsondata)

--JSON_VALUE

DECLARE @jsondata NVARCHAR(MAX)
SET @jsondata = '{ "Student" :[
{"Name":"Abc1","City":"xyz1"},
{"Name":"Abc2","City":"xyz2"},
{"Name":"Abc3","City":"xyz3"}
] }'

SELECT JSON_VALUE(@jsondata, '$.Student')
SELECT JSON_VALUE(@jsondata, '$.Student[0].Name')
SELECT JSON_VALUE(@jsondata, '$.Student[0].City')
SELECT JSON_VALUE(@jsondata, '$.Student[1].Name')

--JSON_QUERY

DECLARE @jsondata NVARCHAR(MAX)
SET @jsondata = '{ "Student" :[
{"Name":"Abc1","City":"xyz1"},
{"Name":"Abc2","City":"xyz2"},
{"Name":"Abc3","City":"xyz3"}
] }'

SELECT JSON_QUERY(@jsondata,'$.Student')
SELECT JSON_QUERY(@jsondata,'$.Student[0]')

--JSON_MODIFY

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'
PRINT @info

-- Update 
SET @info=JSON_MODIFY(@info,'$.name','Mike')
PRINT @info

-- Insert 
SET @info=JSON_MODIFY(@info,'$.surname','Smith')
PRINT @info

-- Delete 
SET @info=JSON_MODIFY(@info,'$.name',NULL)
PRINT @info

-- Add
SET @info=JSON_MODIFY(@info,'append $.skills','Azure')
PRINT @info


--Convert JSON collections to a rowset
--OPENJSON

DECLARE @jsondata NVARCHAR(MAX)
SET @jsondata = '[
{"Name":"Abc1","City":"xyz1"},
{"Name":"Abc2","City":"xyz2"},
{"Name":"Abc3","City":"xyz3"}
]'

CREATE TABLE Demo9
(
Name VARCHAR(50),
City VARCHAR(30)
)

IF(ISJSON(@jsondata)>0)
	BEGIN
		INSERT INTO Demo9 SELECT * FROM OPENJSON(@jsondata)
			WITH
			(
			Name VARCHAR(50) '$.Name',
			City VARCHAR(30) '$.City'
			)
	END

SELECT * FROM Demo9

--Convert SQL Server data to JSON or export JSON
--FOR JSON PATH
SELECT * FROM Demo9 FOR JSON PATH

INSERT INTO Demo9 VALUES ('John',NULL)

SELECT * FROM Demo9 FOR JSON PATH,INCLUDE_NULL_VALUES

--FOR JSON AUTO

SELECT * FROM Demo9 FOR JSON AUTO

--WITHOUT_ARRAY_WRAPPER

SELECT * FROM Demo9 FOR JSON PATH,WITHOUT_ARRAY_WRAPPER