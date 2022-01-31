--isjson check wether it is json or not 
DECLARE @JSON VARCHAR(MAX);
SET @JSON = N'{
"AGE":18
}';

SELECT FirstName,LastName , JSON_QUERY(@JSON,'$')AS 'AGE'  FROM Employees

--CHECK WHETHER IT IS JSON OR NOT
IF ISJSON(@JSON)=1
PRINT(1)
ELSE
PRINT(0)

--JSON_VALUE FUNCTION

SELECT JSON_VALUE('{"Name": "Shreya"}', '$.Name') AS 'Output';

--if we gave wrong key then it will return NULL value so we need to give proper key
SELECT JSON_VALUE('{"Name": "Shreya"}', '$.FirstName') AS 'Output';

--BY DEFAULT THE MODE IS LAX BUT WE DO IT BY EXPLICITLY ALSO .IT IS CASE SENSITIVE
SELECT JSON_VALUE('{"Name": "Shreya"}', 'lax$.Name') AS 'Output';

SELECT JSON_VALUE('{"Name": "Shreya"}', 'strict$.Name') AS 'Output';


--ex-2

DECLARE @data VARCHAR(MAX);
SET @data = N'{
"Employees":[
{"EmployeeName":"Shreya Thakkar",
"DepartmentName":"QA",
"Address":"Ahmedabad",
"Salary" : 20000
},
{   "EmployeeName":"Diya Thakkar",
	"DepartmentName":"Developer",
	"Address":"Ahmedabad",
	"Salary" : 30000
}

]

}';
SELECT JSON_VALUE(@data, '$.Employees[0].EmployeeName') AS 'Name', 
       JSON_VALUE(@data, '$.Employees[0].DepartmentName') AS 'Department', 
       JSON_VALUE(@data, '$.Employees[0].Address') AS 'Address', 
       JSON_VALUE(@data, '$.Employees[0].Salary') AS 'Salary'
UNION ALL
SELECT JSON_VALUE(@data, '$.Employees[1].EmployeeName') AS 'Name', 
       JSON_VALUE(@data, '$.Employees[1].DepartmentName') AS 'Department', 
       JSON_VALUE(@data, '$.Employees[1].Address') AS 'Address', 
       JSON_VALUE(@data, '$.Employees[1].Salary') AS 'Salary'



--fetch array value 

DECLARE @data1 VARCHAR(MAX);
SET @data1 =  N'{  
     "info":{    
       "ID":1,  
     "Name":"Shreya",
       "address":{    
         "City":"Ahmedabad",  
         "Country":"India"  
       },  
       "Favorite_Subject":["English", "Maths"]  
    },  
    "type":"student"  
 }';  

SELECT JSON_VALUE(@data1 , '$.info.ID') as 'Id',
	   JSON_VALUE(@data1 ,'$.info.Name') as 'Name',
	   JSON_VALUE(@data1,'$.info.address.City') as 'City',
	   JSON_VALUE(@data1,'$.info.Favorite_Subject[1]') as 'Favourite Subject'


---IF WE TRY TO RETRIVE WHOLE ARRAY IT RETURNS NULL VALUE BECAUSE THE JSON_VALUE FUNCTION ONLY RETURNS THE SCALAR VALUE NOT ARRAY

SELECT JSON_VALUE(@data1 , 'lax$.info.Favorite_Subject') as 'Fav_Sub'
--when we are using json_query it will return the array 
SELECT JSON_QUERY(@data1 , 'lax$.info.Favorite_Subject') as 'Fav_Sub'

--JSON_QUERY 


DECLARE @data2 VARCHAR(MAX);
SET @data2 =  N'{  
     "info":{    
       "ID":1,  
     "Name":"Shreya",
       "address":{    
         "City":"Ahmedabad",  
         "Country":"India"  
       },  
       "Favorite_Subject":["English", "Maths"]  
    },  
    "type":"student"  
 }';  

 SELECT JSON_QUERY (@data2,'$.info') AS 'result'
 SELECT JSON_QUERY(@data2 , '$.info.address')

 --example - 2
 DECLARE @data3 VARCHAR(MAX);
SET @data3 = N'{
"Employees":[
{"EmployeeName":"Shreya Thakkar",
"DepartmentName":"QA",
"Address":"Ahmedabad",
"Salary" : 20000
},
{   "EmployeeName":"Diya Thakkar",
	"DepartmentName":"Developer",
	"Address":"Ahmedabad",
	"Salary" : 30000
}

]

}';

SELECT JSON_QUERY (@data3)
--SELECT JSON_QUERY(@data3,'$')
SELECT JSON_QUERY(@data3,'$.Employees')


--JSON_MODIFY FUNCTION 
SELECT JSON_MODIFY('{"EmployeeName":"abc"}','$.Employee','abc')
AS 'updated json'


-----
DECLARE @OriginalJSON NVARCHAR(4000)
Set @OriginalJSON='{"Brand":"HP","Product":"Laptop"}'
Select
        @OriginalJSON as 'Before Update',
        JSON_MODIFY(@OriginalJSON,'$.Product', 'Laptop') AS 'Updated JSON';
	SELECT	JSON_MODIFY(@OriginalJSON,'$.Quantity',10) AS 'Updated JSON';

--ADD ARRAY USING JSON_MODIFY
DECLARE @Darray VARCHAR(MAX)=N'["SCIENCE","MATHS","ENGLISH"]'

SELECT JSON_MODIFY('{"EmployeeName":"abc"}','$.Subject',@Darray)


--in previous example in output we can see a backslash in array 
--for removing backslash 
DECLARE @Darray1 VARCHAR(MAX)=N'["SCIENCE","MATHS","ENGLISH"]'

SELECT JSON_MODIFY('{"EmployeeName":"abc"}','$.Subject',JSON_QUERY(@Darray1))
--FOR APPEND VALUE IN ARRAY 

SELECT JSON_MODIFY('{"EmployeeName":"abc"}','append$.Subject','Digital electronics')


---OPEN JSON: IS USED TO CONVERT JSON DATA TO RELATIONAL TABLE 
DECLARE @json1 NVarChar(2048) = N'{
"StuName" : "Shreya",
"EnrollMentNo":"17162101044",
"Branch":"CSE",
"AreaOfInterest":"Developer"
}'
 

 --IF ISJSON(@json1) > 0
 --PRINT(1)
 --ELSE 
 --PRINT(0)

SELECT * FROM OPENJSON(@json1)
WITH (StudentName VARCHAR(20) '$.StuName',
EnrollMentNo VARCHAR(10) '$.EnrollMentNo',
Branch VARCHAR(10) '$.Branch',
Area_of_Interest VARCHAR(20) '$.AreaOfInterest'
)

--open json with array

DECLARE @stu_info NVarChar(2048) = N'{
"StuName" : "Shreya",
"EnrollMentNo":"17162101044",
"Branch":"CSE",
"AreaOfInterest":["Developer","Design"]
}'

SELECT * FROM OPENJSON(@stu_info)
WITH (StudentName VARCHAR(20) '$.StuName',
EnrollMentNo VARCHAR(10) '$.EnrollMentNo',
Branch VARCHAR(10) '$.Branch',
Area_of_Interest NVARCHAR(MAX) '$.AreaOfInterest' AS JSON
)

--------------------------------------------------
DECLARE @jsonInfo NVARCHAR(MAX)

SET @jsonInfo=N'{  
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
 }'

 SELECT * FROM OPENJSON(@jsonInfo)
WITH
(
NAME VARCHAR(20) '$.info.type',
towm VARCHAR(49) '$.info.address.town',
country VARCHAR(49) '$.info.address.country',
tag VARCHAR(MAX) '$.info.tags',
type VARCHAR(20) '$.type'
)
------------------------------------------------------
SELECT * FROM Employees FOR JSON PATH	

DECLARE @var nvarchar(max)
SET @var = 
  '[ {"name": "John", "surname": "Smith", "age": 25} ,
   {"name": "shreya", "surname": "thakkar", "age": 22}]';

SELECT * FROM OPENJSON(@var)
WITH
(
NAME VARCHAR(20) '$.name',
SURNAME VARCHAR(49) '$.surname',
age INT '$.age'
)


DECLARE @var1 nvarchar(max)
SET @var1 = N' {
"info":{
"id" : 1,
"Name":"Shreya",
"Address":{
"city":"Ahmedabad",
"country" :"India"
},
"Fav_Sub":["English","Maths"]},
"type":"stdent"

}';

SELECT JSON_VALUE(@var1,'$.info.id') as id , 
JSON_VALUE(@var1,'$.info.Name') as name  ,
JSON_VALUE(@var1,'$.info.Address.city') as city,
JSON_VALUE(@var1,'$.info.Address.country') as country,
JSON_VALUE(@var1,'$.info.Fav_Sub') as subject


--open json inside json file and open array

DECLARE @data4 VARCHAR(MAX);
SET @data4 = N'{
"Employees":[
{"EmpID":1,
"EmployeeName":"Shreya Thakkar",
"DepartmentName":"QA",
"Address":"Ahmedabad",
"Interests": {"Interest1": "Reading", 
              "Interest2":"Sleeping"},
"Salary" : 20000,
"TeamMember" : ["jhon","rima","mina"]
},
{   "EmpID":2,
	"EmployeeName":"Diya Thakkar",
	"DepartmentName":"Developer",
	"Address":"Ahmedabad",
	"Interests": {"Interest1": "Reading", 
              "Interest2":"Sleeping",
			  "Interest3":"Travelling"},
	"Salary" : 30000,
	"TeamMember" : ["suresh","naresh","jinal"]
}

]

}';
--CHECK IS IT JSON OR NOT
--IF ISJSON(@data4)=1
--PRINT('YES IT IS JSON')
--ELSE
--PRINT('NO IT IS NOT')


SELECT id, Empname, DepartmentName, Address, interest,Salary,Teammember,Dif_Team_Member FROM OPENJSON(@data4, '$.Employees')
  WITH(
    id VARCHAR(1) '$.EmpID',
    Empname VARCHAR(20) '$.EmployeeName',
    DepartmentName VARCHAR(15) '$.DepartmentName',
   Address VARCHAR(20) '$.Address',
    interest NVARCHAR(MAX)  '$.Interests' AS JSON,
	Salary MONEY '$.Salary',
    Teammember NVARCHAR(MAX) '$.TeamMember' AS JSON
	)
    CROSS APPLY OPENJSON(Teammember) WITH
    (
    Dif_Team_Member VARCHAR(10) '$'
    )
 
--parse array in json file
--parse array in json file
SELECT id, Empname, DepartmentName, Address, interest,Salary,Teammember,Dif_Team_Member FROM OPENJSON(@data4)
  WITH(
    id VARCHAR(1) '$.Employees[0].EmpID',
    Empname VARCHAR(20) '$.Employees[0].EmployeeName',
    DepartmentName VARCHAR(15) '$.Employees[0].DepartmentName',
   Address VARCHAR(20) '$.Employees[0].Address',
    interest NVARCHAR(MAX)  '$.Employees[0].Interests' AS JSON,
	Salary MONEY '$.Employees[0].Salary',
    Teammember NVARCHAR(MAX) '$.Employees[0].TeamMember' AS JSON)
    CROSS APPLY OPENJSON(Teammember) WITH
    --or outer apply
    (
    Dif_Team_Member VARCHAR(10) '$'
    )
    


