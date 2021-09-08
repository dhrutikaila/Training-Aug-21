--ISJSON PRACTICE
DECLARE @Json NVARCHAR(MAX)
SET @Json = N'{
"Name" : "Chitrank",
"Surname" : "Umarania"
}'
IF ISJSON(@Json)>0
PRINT(1)
ELSE
PRINT(2)


--JSON_VALUE PRACTICE
DECLARE @Json NVARCHAR(MAX)
SET @Json = N'{
"Name" : "Chitrank",
"Surname" : "Umarania"
}'
PRINT(JSON_VALUE(@Json,'$.Name'))


--JSON_QUERY PRACTICE
DECLARE @Json NVARCHAR(MAX)
SET @Json = N'{
"Name" : "Chitrank",
"Surname" : "Umarania",
"Skills" : ["PHP","C++","Python","SQL"]
}'
PRINT(JSON_QUERY(@Json,'$.Name'))
