USE AdventureWorks2016


--DECLARE VARIABLE and Setting Value of Variable--

DECLARE @Rate INT
SELECT @Rate = MAX(Rate)
FROM HumanResources.EmployeePayHistory
PRINT @Rate
GO
-------------------------------------------------------------

DECLARE @MarriageStatus VARCHAR(2) = 'M'
SELECT emp.BirthDate,emp.MaritalStatus,emp.Gender,pay.Rate 
FROM HumanResources.Employee AS emp INNER JOIN HumanResources.EmployeePayHistory AS pay
ON emp.BusinessEntityID=pay.BusinessEntityID
WHERE MaritalStatus = @MarriageStatus
GO
-------------------------------------------------------------

DECLARE @find VARCHAR(30)   
SET @find = 'Man%'
SELECT p.LastName, p.FirstName, ph.PhoneNumber  
FROM Person.Person AS p   
JOIN Person.PersonPhone AS ph ON p.BusinessEntityID = ph.BusinessEntityID  
WHERE LastName LIKE @find
-----------------------------------------------------------------------------

DECLARE @FirstName VARCHAR(10) = 'Sharon', @LastName VARCHAR(10) = 'Roy'
SELECT per.FirstName, per.LastName, pho.PhoneNumber 
FROM Person.Person AS per INNER JOIN Person.PersonPhone AS pho 
ON per.BusinessEntityID=pho.BusinessEntityID
WHERE per.FirstName=@FirstName OR per.LastName=@LastName
GO



--IF_ELSE Statement--

DECLARE @Rate MONEY
SELECT @Rate = Rate FROM HumanResources.EmployeePayHistory
WHERE BusinessEntityID = 23
IF @Rate < 1
PRINT 'REVIEW REQUIRED'
ELSE
BEGIN
PRINT 'REVIEW NOT REQUIRED'
PRINT 'RATE='
PRINT @Rate
END 
GO
-------------------------------------------------------------

IF DATENAME(weekday, GETDATE()) IN ('Saturday', 'Sunday')
       SELECT 'Weekend' AS 'DayType'
ELSE 
       SELECT 'Weekday' AS 'DayType'
-------------------------------------------------------------



--CASE--

SELECT BusinessEntityID, 'Marriage Status' =
CASE MaritalStatus
WHEN 'M' THEN 'Married'
WHEN 'S' THEN 'Single'
ELSE 'NOT Specified'
END
FROM HumanResources.Employee
GO
--------------------------------------------------------

SELECT BusinessEntityID, 'Gender' =
CASE 
WHEN Gender = 'M' THEN 'Male'
WHEN Gender = 'F' THEN 'Female'
ELSE 'NOT Specified'
END
FROM HumanResources.Employee
GO
---------------------------------------------------------



--WHILE--
WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300  
BEGIN  
   UPDATE Production.Product  
      SET ListPrice = ListPrice * 2  
   SELECT MAX(ListPrice) FROM Production.Product  
   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500  
      BREAK  
   ELSE  
      CONTINUE  
END  
PRINT 'Too much for the market to bear'
--------------------------------------------------


USE Day3_SQL
DECLARE @id INT
SET @id = 100
WHILE (SELECT Salary FROM Employees WHERE EmployeeID = @id) >15000
BEGIN
UPDATE Employees SET Salary += (Salary*0.20) WHERE EmployeeID = @id
SET @id = @id+1
END
---------------------------------------------------------------------





--JSON--

--ISJSON--
DECLARE @json nvarchar(max) =
'{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  }'
SELECT ISJSON(@json)
--------------------------------------------

DECLARE @json_employee nvarchar(max) =
'[{"Employee_ID":1,"First_Name":"John","Last_Name":"Abraham","Salary":1000000.0000,"Joining_Date":"2013-01-01T00:00:00","Department":"Banking"},{"Employee_ID":2,"First_Name":"Michael","Last_Name":"Clarke","Salary":800000.0000,"Joining_Date":"2013-01-01T00:00:00","Department":"Insurance","Manager_ID":1},{"Employee_ID":3,"First_Name":"Roy","Last_Name":"Thomas","Salary":700000.0000,"Joining_Date":"2013-02-01T00:00:00","Department":"Banking","Manager_ID":1},{"Employee_ID":4,"First_Name":"Tom","Last_Name":"Jose","Salary":600000.0000,"Joining_Date":"2013-02-01T00:00:00","Department":"Insurance","Manager_ID":2},{"Employee_ID":5,"First_Name":"Jerry","Last_Name":"Pinto","Salary":650000.0000,"Joining_Date":"2013-02-01T00:00:00","Department":"Insurance","Manager_ID":3},{"Employee_ID":6,"First_Name":"Philip","Last_Name":"Mathew","Salary":750000.0000,"Joining_Date":"2013-01-01T00:00:00","Department":"Services","Manager_ID":3},{"Employee_ID":7,"First_Name":"TestName1","Last_Name":"123","Salary":650000.0000,"Joining_Date":"2013-01-01T00:00:00","Department":"Services","Manager_ID":2},{"Employee_ID":8,"First_Name":"TestName2","Last_Name":"Lname%","Salary":600000.0000,"Joining_Date":"2013-02-01T00:00:00","Department":"Insurance","Manager_ID":2}]'
SELECT ISJSON(@json_employee)
----------------------------------------


--JSON_VALUE--

DECLARE @jsonInfo NVARCHAR(MAX)
SET @jsonInfo=N'{"info":
					{"type":1,"address":{"town":"Bristol","county":"Avon", "country":"England","},  
					 "tags":["Sport", "Water polo"]},  
				 "type":"Basic"}'  

SELECT ISJSON(@jsoninfo)
SELECT JSON_VALUE(@jsoninfo,'$.type') --Basic
SELECT JSON_VALUE(@jsoninfo, '$.info.type') --1
SELECT JSON_VALUE(@jsoninfo,'$.info.address.country') --England
SELECT JSON_VALUE(@jsoninfo, '$.info.tags[1]') --Water polo



--JSON_QUERY--

DECLARE @jsonInfo NVARCHAR(MAX)
SET @jsonInfo=N'{"info":
					{"type":1,"address":{"town":"Bristol","county":"Avon", "country":"England"},  
					 "tags":["Sport", "Water polo"]},  
				 "type":"Basic"}' 

SELECT JSON_QUERY(@jsoninfo,'$.info')
SELECT JSON_QUERY(@jsoninfo,'$.info.address')
SELECT JSON_QUERY(@jsoninfo,'$.info.tags')



--JSON_MODIFY--

DECLARE @jsonInfo NVARCHAR(MAX)
SET @jsonInfo=N'{"info":
					{"type":1,"address":{"town":"Bristol","county":"Avon", "country":"England"},  
					 "tags":["Sport", "Water polo"]},  
				 "type":"Basic"}' 

SELECT JSON_MODIFY(@jsoninfo,'$.type','Normal')
SELECT JSON_MODIFY(@jsoninfo,'$.info','Valid')
SELECT JSON_MODIFY(@jsoninfo,'$.info.address.country','India')
SELECT JSON_MODIFY(@jsoninfo,'append $.info.tags', 'Developer')



--OPENJSON, FOR JSON PATH, FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER
USE Day9_SQL
CREATE TABLE JsonTrial
(
	InfoType INT ,
	Town VARCHAR(30) ,
	County VARCHAR(30) ,
	Country VARCHAR(30) ,
	Tags nvarchar(max) ,
	Type VARCHAR(20),
	Tag VARCHAR(20)
)
	
	
DECLARE @jsoninfo NVARCHAR(MAX)		--DECLARE VARIABLE FOR JSON
SET @jsonInfo='{"info":
					{"type":1,"address":{"town":"Bristol","county":"Avon", "country":"England"},  
					 "tags":["Sport", "Water polo"]},  
				 "type":"Basic"}'   

INSERT INTO JsonTrial				--INSERT FROM JSON
SELECT * FROM OPENJSON(@jsoninfo)   --OPENJSON
WITH 
(
	InfoType INT '$.info.type',
	Town VARCHAR(30) '$.info.address.town',
	County VARCHAR(30) '$.info.address.county',
	Country VARCHAR(30) '$.info.address.country',
	Tags nvarchar(max) '$.info.tags' AS JSON ,
	Type VARCHAR(20) '$.type'
)
OUTER APPLY OPENJSON(Tags) WITH(Tag nvarchar(10) '$')

SELECT * FROM JsonTrial FOR JSON PATH		--Convert to JSON
SELECT * FROM JsonTrial FOR JSON AUTO

SELECT * FROM JsonTrial FOR JSON PATH, WITHOUT_ARRAY_WRAPPER	--Json Path Without '[]' Brackets