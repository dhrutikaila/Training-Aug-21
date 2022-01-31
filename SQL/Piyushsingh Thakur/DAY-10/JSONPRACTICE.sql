DECLARE @json NVARCHAR(4000) = N'{
"empid":1,
"lastname":"Davis",
"firstname":"Sara",
"title":"CEO",
"titleofcourtesy":"Ms.",
"birthdate":"1968-12-08",
"hiredate":"2013-05-01",
"address":"7890 - 20th Ave. E., Apt. 2A",
"city":"Seattle",
"region":"WA",
"postalcode":"10003",
"country":"USA",
"phone":"(206) 555-0101"
}';

SELECT * FROM OPENJSON (@json)




DECLARE @json NVARCHAR(4000) = N'
{
"empid":1,
"lastname":"Davis",
"firstname":"Sara",
"title":"CEO",
"titleofcourtesy":"Ms.",
"birthdate":"1968-12-08",
"hiredate":"2013-05-01",
"address":"7890 - 20th Ave. E., Apt. 2A",
"city":"Seattle",
"region":"WA",
"postalcode":"10003",
"country":"USA",
"phone":"(206) 555-0101"
}';

SELECT ISJSON (@json);



DECLARE @JSONData AS NVARCHAR(4000)  
SET @JSONData = N'{  
    "EmployeeInfo":{  
        "FirstName":"Jignesh",  
        "LastName":"Trivedi",  
        "Code":"CCEEDD",  
        "Addresses":[  
            { "Address":"Test 0", "City":"Gandhinagar", "State":"Gujarat"},  
            { "Address":"Test 1", "City":"Gandhinagar", "State":"Gujarat"}  
        ]  
    }  
}'  
SELECT  ISJSON(@JSONData)



-- Check Using WITH Clause and CASE Expression

DECLARE @json NVARCHAR(4000) = N'
{
"empid":1,
"lastname":"Davis",
"firstname":"Sara",
"title":"CEO",
"titleofcourtesy":"Ms.",
"birthdate":"1968-12-08",
"hiredate":"2013-05-01",
"address":"7890 - 20th Ave. E., Apt. 2A",
"city":"Seattle",
"region":"WA",
"postalcode":"10003",
"country":"USA",
"phone":"(206) 555-0101"
}';

WITH JSONTEST as (SELECT ISJSON (@json) [IS JSON ?] )
SELECT 
CASE [IS JSON ?] 
WHEN 1 THEN 'YES'
WHEN 0 THEN 'NO'
END AS [IS JSON ?]
FROM JSONTEST




DECLARE @JSONData AS NVARCHAR(4000)  
SET @JSONData = N'{  
    "EmployeeInfo":{  
        "FirstName":"Jignesh",  
        "LastName":"Trivedi",  
        "Code":"CCEEDD",  
        "Addresses":[  
            { "Address":"Test 0", "City":"Gandhinagar", "State":"Gujarat"},  
            { "Address":"Test 1", "City":"Gandhinagar", "State":"Gujarat"}  
        ]  
    }  
}'  

SELECT JSON_QUERY(@JSONData,'$.EmployeeInfo.Addresses')  
SELECT JSON_QUERY(@JSONData,'$.EmployeeInfo.Addresses[1]')  



DECLARE @JSONData AS NVARCHAR(4000)  
SET @JSONData = N'{  
    "EmployeeInfo":{  
        "FirstName":"Jignesh",  
        "LastName":"Trivedi",  
        "Code":"CCEEDD",  
        "Addresses":[  
            { "Address":"Test 0", "City":"Gandhinagar", "State":"Gujarat"},  
            { "Address":"Test 1", "City":"Gandhinagar", "State":"Gujarat"}  
        ]  
    }  
}'  

SET @JSONData = JSON_MODIFY(@JSONData,'append $.EmployeeInfo.Addresses', 
JSON_QUERY('{"Address":"Test 2", "City":"Bhavnagar", "State":"Gujarat"}','$'))  

