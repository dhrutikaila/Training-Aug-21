-- TRY CATCH

USE DEMO

SELECT * FROM SYS.tables

SP_HELP Faculty2

SELECT * FROM Faculty2
SELECT * FROM Faculty


BEGIN TRY
INSERT INTO Faculty
VALUES ('Meet')

INSERT INTO Faculty2
VALUES ('Meet')
	,	(1)

END TRY
BEGIN CATCH
SELECT 'THERE WAS AN ERROR! ' + ERROR_MESSAGE() AS 'Error Message'
	,	ERROR_LINE() AS 'Error Line'
	,	ERROR_NUMBER() AS 'Error Number'
	,	ERROR_PROCEDURE() AS 'Error Procedure'
	,	ERROR_SEVERITY() AS 'Error Severity'
	,	ERROR_STATE() AS 'Error State'
END CATCH


USE AdventureWorks2019

SELECT *
FROM HumanResources.Department

SELECT *
FROM Humanresources.Employee
FOR JSON PATH

USE DEMO

SELECT * FROM Trainee FOR JSON AUTO

SP_HELP TRainee

DECLARE @json NVARCHAR(MAX)
SET @json = N'[
				{
				"T_Name":"Vinod",
				"Gender":"Female",
				"info": {"Mobile":7359411075,
				"Email":"nir.sur@gmail.com"},
				"Fac_id":3
				},
				{
				"T_Name":"Meetai",
				"Gender":"Female",
				"info": {"Mobile":7359411075,
				"Email":"nir.sur@gmail.com"},
				"Fac_id":2
				}]'
--SET @json = JSON_MODIFY(@json, '$.Trainee[1].T_Name', 'Veronica')
--PRINT @json
IF (ISJSON(@json)) > 0
BEGIN
	--INSERT INTO Trainee
	SELECT * 
	FROM OPENJSON(@json)
	WITH(
			T_Name VARCHAR(50) '$.T_Name'
		,	Gender VARCHAR(6) '$.Gender'
		,	Mobile NUMERIC(10) '$.info.Mobile'
		,	Email VARCHAR(255) '$.info.Email'
		,	Fac_id INT '$.Fac_id'
		)
END
ELSE
BEGIN
	PRINT 'Not JSON'
END

	SELECT *
	FROM Trainee

DECLARE @json NVARCHAR(MAX)

SET @json=N'{  
     "info":{    
       "type":1,  
       "address":{    
         "town":"Bristol",  
         "county":"Avon",  
         "country":"England"  
       },  
       "tags":["Sport", "Water polo"]  
    },  
    "type":"Basic"  
 },'

SELECT *
FROM OPENJSON(@json,N'lax $.info')

SELECT JSON_VALUE(@json,'strict $.info.address.town') --Extracts a scalar value from a JSON string.
SELECT JSON_QUERY(@json,'strict $.info.address') -- Extracts an object or an array from a JSON string.


DECLARE @json NVARCHAR(MAX)
SET @json = N'[
				{
				"T_Name":"Vinod",
				"Gender":"Female",
				"info": {"Mobile":7359411075,
				"Email":"nir.sur@gmail.com"},
				"Fac_id":3
				},
				{
				"T_Name":"Meetai",
				"Gender":"Female",
				"info": {"Mobile":7359411075,
				"Email":"nir.sur@gmail.com"},
				"Fac_id":2
				}
			]'

SELECT * FROM OPENJSON(@json, '$')
WITH(
			T_Name VARCHAR(50) '$.T_Name'
		,	Gender VARCHAR(6) '$.Gender'
		,	Mobile NUMERIC(10) '$.info.Mobile'
		,	Email VARCHAR(255) '$.info.Email'
		,	Fac_id INT '$.Fac_id'
		)

SET @json = JSON_MODIFY(@json, '$', 'Veronica')
PRINT @json