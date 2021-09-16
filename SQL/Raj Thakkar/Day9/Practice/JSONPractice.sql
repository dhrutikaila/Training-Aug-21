--ISJSON--
DECLARE @json INT
SET @json = '[{"Name":"James Cole","ADDRESS":"22nd street","City":"Manhattan","DOB":"2008-06-01","Standard":11},
            {"Name":"Anna Fehya","ADDRESS":"Judges Bunglow","City":"Miami","DOB":"2007-02-01","Standard":12},
			{"Name":"Anna hellapeya","ADDRESS":"Long island","City":"Athens","DOB":"2005-06-06","Standard":9},
			{"Name":"Hrufna victorsdottir","ADDRESS":"Nuuk","City":"Reykjavik","DOB":"2006-06-06","Standard":10},
			{"Name":"Prona Grufunsdottir","ADDRESS":"Downtown","City":"Reykjavik","DOB":"2006-07-07","Standard":10}]' 

IF (ISJSON(@json) > 0)  
BEGIN  
   SELECT * INTO InfoTable FROM(
   SELECT * FROM OPENJSON(@Info)
   WITH
   (
       Name VARCHAR(30) '$.Name',
       Address VARCHAR(100) '$.ADDRESS',
       City VARCHAR(30) '$.City',
       DOB Date '$.DOB',
       Standard VARCHAR(20) '$.Standard'
   )
) AS Temp
END




--JSON_VALUE--
DECLARE @jsonInfo NVARCHAR(MAX)
DECLARE @town NVARCHAR(32)

SET @jsonInfo=N'{"info":{"address":[{"town":"Paris"},{"town":"London"}]}}'

SET @town=JSON_VALUE(@jsonInfo,'$.info.address[0].town')
SET @town=JSON_VALUE(@jsonInfo,'$.info.address[1].town')




--JSON_QUERY--
SELECT StockItemID, StockItemName,
         JSON_QUERY(Tags) as Tags,
         JSON_QUERY(CONCAT('["',ValidFrom,'","',ValidTo,'"]')) ValidityPeriod
FROM Warehouse.StockItems
FOR JSON PATH




--JSON_MODIFY--

DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'
PRINT @info

SET @info=JSON_MODIFY(@info,'$.name','Mike')
PRINT @info

SET @info=JSON_MODIFY(@info,'$.surname','Smith')
PRINT @info

SET @info=JSON_MODIFY(@info,'$.name',NULL)
PRINT @info

SET @info=JSON_MODIFY(@info,'append $.skills','Azure')
PRINT @info




--WITHOUT_ARRAY_WRAPPER--
SELECT TOP 3 SalesOrderNumber, OrderDate, Status  
FROM Sales.SalesOrderHeader  
ORDER BY ModifiedDate  
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER




--OPENJSON--
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
   
SELECT * FROM  
 OPENJSON(@json, N'lax $.someObject.someArray')  
WITH ( k1 INT,   
        k2 VARCHAR(100),  
        col3 VARCHAR(6) N'$.k3',  
        col4 VARCHAR(10) N'lax $.k4.data',  
        col5 NVARCHAR(MAX) N'lax $.k4' AS JSON, 
        array_element NVARCHAR(MAX) N'$' AS JSON  
 )  