--ISJSON
--1
DECLARE @param NVARCHAR(MAX)
SET @param = 
N'[
		{
			"Name":"Shubh",
			"City":"Ahmedabad",
			"Hobbies":["Chess","Football","Making Memes"]
		}
	]'

IF (ISJSON(@param) > 0)  
BEGIN  
   PRINT 'Valid Json'
END

--2
--JSON_VALUE

DECLARE @jsonInfo NVARCHAR(MAX)
SET @jsonInfo=
   N'[
     {    
       "[ManagerId]":48,  
       "[Salary]":"500000",  
       "[Department]":"Levon"
       }
    ]'

SELECT FirstName, LastName,
 JSON_VALUE(jsonInfo,'$.Department') AS Dept
FROM Employee
SELECT * FROM Employee


--3. 
DECLARE @AvgWeight DECIMAL(8,2), @ProductNos INT  
IF   
(SELECT COUNT(*) FROM [SalesLT].[Product] WHERE Name LIKE 'LL Road Frame%' ) > 5  
BEGIN  
   SET @ProductNos =   
        (SELECT COUNT(*)   
         FROM [SalesLT].[Product]   
         WHERE Name LIKE 'LL Road Frame%');  
   SET @AvgWeight =   
        (SELECT AVG(Weight)   
         FROM [SalesLT].[Product]   
         WHERE Name LIKE 'LL Road Frame%');  
   PRINT 'There are ' + CAST(@ProductNos AS VARCHAR(3)) + 'LL Road Frame product.'  
   PRINT 'The average weight of the top 5 LL Road Frame is ' + CAST(@AvgWeight AS VARCHAR(8)) + '.';  
END  
ELSE   
BEGIN  
SET @AvgWeight =   
        (SELECT AVG(Weight)  
         FROM [SalesLT].[Product]  
         WHERE Name LIKE 'LL Road Frame%' );  
   PRINT 'Average weight of the products is ' + CAST(@AvgWeight AS VARCHAR(8)) + '.' ;  
END ;  
GO


--4. 
DECLARE @maxWeight FLOAT, @productKey INTEGER  
SET @maxWeight = 10
SET @productKey = 710
IF @maxWeight <= (SELECT Weight FROM [SalesLT].[Product] WHERE ProductId=@productKey)   
    (SELECT @productKey, [Name], Weight, 'This product is too heavy to ship and is only available for pickup.' FROM [SalesLT].[Product] WHERE ProductID=@productKey)  
ELSE  
    (SELECT @productKey AS ProductId, [Name], Weight,'This product is available for shipping or pickup.' AS Statement FROM [SalesLT].[Product] WHERE ProductID=@productKey)  
GO  
WHILE (SELECT AVG(ListPrice) FROM [SalesLT].[Product]) < $300  
BEGIN  
   UPDATE [SalesLT].[Product]  
      SET ListPrice = ListPrice * 2  
   SELECT MAX(ListPrice) FROM [SalesLT].[Product]
   IF (SELECT MAX(ListPrice) FROM [SalesLT].[Product]) > $500  
      BREAK  
   ELSE  
      CONTINUE  
END  
PRINT 'Too much for the market to bear'  


--5.
DECLARE @jsonInfo NVARCHAR(MAX)
DECLARE @town NVARCHAR(32)

SET @jsonInfo=N'{"info":{"address":[{"town":"Ahmedabad"},{"town":"Vadodara"}]}}';

SET @town=JSON_VALUE(@jsonInfo,'$.info.address[0].town')
SET @town=JSON_VALUE(@jsonInfo,'$.info.address[1].town')


--6.
CREATE TABLE Customer
 (
  CustomerID INT IDENTITY(1,1) NOT NULL,
  Address VARCHAR(500),
  jsonContent NVARCHAR(4000),
  Longitude AS JSON_VALUE(jsonContent, '$.address[0].longitude'),
  Latitude AS JSON_VALUE(jsonContent, '$.address[0].latitude')
 )
 SELECT * FROM Customer

DECLARE @jsonstr NVARCHAR(MAX)
SET @jsonstr =   
  N'[  
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
   
SELECT * FROM OPENJSON(@jsonstr)  
WITH (   
              Number varchar(200) '$.Order.Number' ,  
              Date datetime '$.Order.Date',  
              Customer varchar(200) '$.AccountNumber',  
              Quantity int '$.Item.Quantity'  
 ) 


 --7.
SELECT TOP 5 UserId, PostId, ImageURL, HelpRequiredCount, LocationName, PincodeId FROM Post FOR JSON AUTO  


 --8.
SELECT TOP 5 UserId, PostId, ClusterLocationId, PeopleCount, Locations, PincodeId FROM ClusterLocations FOR JSON PATH
