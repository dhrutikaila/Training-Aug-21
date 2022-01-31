DECLARE @AvgWeight DECIMAL(8,2), @BikeCount INT  
IF   
(SELECT COUNT(*) FROM Production.Product WHERE Name LIKE 'Touring-3000%' ) > 5  
BEGIN  
   SET @BikeCount =   
        (SELECT COUNT(*)   
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%');  
   SET @AvgWeight =   
        (SELECT AVG(Weight)   
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%');  
   PRINT 'There are ' + CAST(@BikeCount AS VARCHAR(3)) + ' Touring-3000 bikes.'  
   PRINT 'The average weight of the top 5 Touring-3000 bikes is ' + CAST(@AvgWeight AS VARCHAR(8)) + '.';  
END  
ELSE   
BEGIN  
SET @AvgWeight =   
        (SELECT AVG(Weight)  
         FROM Production.Product   
         WHERE Name LIKE 'Touring-3000%' );  
   PRINT 'Average weight of the Touring-3000 bikes is ' + CAST(@AvgWeight AS VARCHAR(8)) + '.' ;  
END ;  
GO

DECLARE @Number INT;  
SET @Number = 50;  
IF @Number > 100  
   PRINT 'The number is large.';  
ELSE   
   BEGIN  
      IF @Number < 10  
      PRINT 'The number is small.';  
   ELSE  
      PRINT 'The number is medium.';  
   END ;  
GO  

DECLARE @maxWeight FLOAT, @productKey INTEGER  
SET @maxWeight = 100.00  
SET @productKey = 424  
IF @maxWeight <= (SELECT Weight FROM DimProduct WHERE ProductKey=@productKey)   
    (SELECT @productKey, EnglishDescription, Weight, 'This product is too heavy to ship and is only available for pickup.' FROM DimProduct WHERE ProductKey=@productKey)  
ELSE  
    (SELECT @productKey, EnglishDescription, Weight, 'This product is available for shipping or pickup.' FROM DimProduct WHERE ProductKey=@productKey)  

	USE AdventureWorks2012;  
GO  
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
PRINT 'Too much for the market to bear';  

DECLARE @EmployeeID as NVARCHAR(256)
DECLARE @Title as NVARCHAR(50)

DECLARE Employee_Cursor CURSOR FOR  
SELECT LoginID, JobTitle   
FROM HumanResources.Employee  
WHERE JobTitle = 'Marketing Specialist';  
OPEN Employee_Cursor;  
FETCH NEXT FROM Employee_Cursor INTO @EmployeeID, @Title;  
WHILE @@FETCH_STATUS = 0  
   BEGIN  
      Print '   ' + @EmployeeID + '      '+  @Title 
      FETCH NEXT FROM Employee_Cursor INTO @EmployeeID, @Title;  
   END;  
CLOSE Employee_Cursor;  
DEALLOCATE Employee_Cursor;  
GO 

DECLARE @param NVARCHAR(MAX)
SET @param='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}';
IF (ISJSON(@param) > 0)  
BEGIN  
     PRINT 'This is Json'
END

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
 SELECT FirstName, LastName,
 JSON_VALUE(@jsonInfo,'$.info.address[0].town') AS Town
FROM Person.Person
WHERE JSON_VALUE(@jsonInfo,'$.info.address[0].state') LIKE 'US%'
ORDER BY JSON_VALUE(@jsonInfo,'$.info.address[0].town')


DECLARE @jsonInfo NVARCHAR(MAX)
DECLARE @town NVARCHAR(32)

SET @jsonInfo=N'{"info":{"address":[{"town":"Paris"},{"town":"London"}]}}';

SET @town=JSON_VALUE(@jsonInfo,'$.info.address[0].town'); -- Paris
SET @town=JSON_VALUE(@jsonInfo,'$.info.address[1].town'); -- London

CREATE TABLE dbo.Store
 (
  StoreID INT IDENTITY(1,1) NOT NULL,
  Address VARCHAR(500),
  jsonContent NVARCHAR(4000),
  Longitude AS JSON_VALUE(jsonContent, '$.address[0].longitude'),
  Latitude AS JSON_VALUE(jsonContent, '$.address[0].latitude')
 )
 SELECT * FROM dbo.Store

DECLARE @json NVARCHAR(MAX)
SET @json =   
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
   
SELECT * FROM  
 OPENJSON ( @json )  
WITH (   
              Number varchar(200) '$.Order.Number' ,  
              Date datetime '$.Order.Date',  
              Customer varchar(200) '$.AccountNumber',  
              Quantity int '$.Item.Quantity'  
 ) 


 --json_query
 DECLARE @json NVARCHAR(MAX)
SET @json =   
  N'{
  "students":[  
       {  
         "Name": "Dhruvit",  
		 "Address": "Bhut Bangla,Shetan Gali,Andher Nagar, Smashan Ke Samne",
        "City":"Surat",
		"DOB":"2000-09-06",
        "Standard":1 
       },
       {  
         "Name": "Shubh",  
		 "Address": "Himalyan Valley Kingdom",
         "City":"Ahmedabad",  
		 "DOB": "1950-01-26",
		 "Standard":5 
		},
       {  
         "Name": "Hemanshu",  
		 "Address": "Royal Circus,Matunga",
         "City":"Vadodara",  
		 "DOB": "1950-01-26",
		 "Standard":2
		},
		{  
         "Name": "Niraj",  
		 "Address": "Kathiyavadi Khadki,Ahmedabad",
         "City":"Ahmedabad",  
		 "DOB": "1950-01-26",
		 "Standard":3
		},
		{  
         "Name": "Piyush",  
		 "Address": "Ram Bhavan,Ayodhya",
         "City":"Ahmedabad",  
		 "DOB": "1950-01-26",
		 "Standard":4 
		 }
 ]
 }'  
 SELECT JSON_QUERY(@json, '$.employees[0]') AS 'Result';


DECLARE @OriginalJSON NVARCHAR(4000)
SET @OriginalJSON='{"Brand":"HP","Product":"Laptop"}'
SELECT @OriginalJSON AS 'Before Update',
        JSON_MODIFY(@OriginalJSON,'$.Product', 'Laptop') AS 'Updated JSON';

SELECT TOP 5   
       BusinessEntityID As Id,  
       FirstName, LastName,  
       Title As 'Info.Title',  
       MiddleName As 'Info.MiddleName'  
   FROM Person.Person  
   FOR JSON PATH   

SELECT TOP 2 H.SalesOrderNumber AS 'Order.Number',  
        H.OrderDate AS 'Order.Date',  
        D.UnitPrice AS 'Product.Price',  
        D.OrderQty AS 'Product.Quantity'  
FROM Sales.SalesOrderHeader H  
   INNER JOIN Sales.SalesOrderDetail D  
     ON H.SalesOrderID = D.SalesOrderID  
FOR JSON PATH   

SELECT TOP 2 SalesOrderNumber,  
        OrderDate,  
        UnitPrice,  
        OrderQty  
FROM Sales.SalesOrderHeader H  
   INNER JOIN Sales.SalesOrderDetail D  
     ON H.SalesOrderID = D.SalesOrderID  
FOR JSON AUTO   


SELECT TOP 2  
    SalesOrderNumber,  
    OrderDate,  
    (SELECT UnitPrice, OrderQty  
      FROM Sales.SalesOrderDetail AS D  
      WHERE H.SalesOrderID = D.SalesOrderID  
     FOR JSON PATH) AS D  
FROM Sales.SalesOrderHeader AS H  
FOR JSON PATH  

SELECT TOP 2  
    SalesOrderNumber,  
    OrderDate,  
    (SELECT UnitPrice, OrderQty  
      FROM Sales.SalesOrderDetail AS D  
      WHERE H.SalesOrderID = D.SalesOrderID  
     FOR JSON PATH) AS D  
FROM Sales.SalesOrderHeader AS H  
FOR JSON PATH ,WITHOUT_ARRAY_WRAPPER 

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

DECLARE @jsonInfo NVARCHAR(MAX)

 

SET @jsonInfo=
   N'[
     {    
       "ManagerId":48,  
       "Salary]":"500000",  
       "Department":"Levon"
       }
    ]'
SELECT FirstName, LastName,
JSON_VALUE(@jsonInfo,'$.Department') AS Dept
FROM Employee

WHERE FirstName='Jerry'
 

SELECT FirstName, LastName,
 JSON_VALUE(@jsonInfo,'$.Department') AS Dept
FROM Employee
SELECT * FROM Employee
 



DECLARE @id AS INTDECLARE @avg AS INTSET @id=1WHILE(SELECT (Salary) FROM Employees WHERE DepartmentID=@id)>5000BEGINSET @avg=(SELECT Avg(Salary) FROM Employees WHERE DepartmentID=@id)    if(SELECT Salary FROM Employees)>5000    UPDATE Employees SET Salary=Salary-@avg WHERE DepartmentID=@id;    ELSE    UPDATE Employees SET Salary=Salary+@avg WHERE DepartmentID=@id;    SET @id=@id+1END
