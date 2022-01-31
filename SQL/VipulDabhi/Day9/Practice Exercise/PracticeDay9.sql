--CASH STATEMENT SYNTAX

/*CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END*/

USE SQLtask

SELECT EmployeeID, Salary,
CASE
    WHEN Salary < 5000 THEN 'junior'
    WHEN Salary >5000 THEN 'senior'
    ELSE 'Traiinee'
END AS QuantityText
FROM Employees;

--Using a SELECT statement with a simple CASE expression

USE AdventureWorks2012;  
GO  
SELECT   ProductNumber, Category =  
      CASE ProductLine  
         WHEN 'R' THEN 'Road'  
         WHEN 'M' THEN 'Mountain'  
         WHEN 'T' THEN 'Touring'  
         WHEN 'S' THEN 'Other sale items'  
         ELSE 'Not for sale'  
      END,  
   Name  
FROM Production.Product  
ORDER BY ProductNumber;  
GO  

--Using CASE in an ORDER BY clause

SELECT BusinessEntityID, SalariedFlag  
FROM HumanResources.Employee  
ORDER BY CASE SalariedFlag WHEN 1 THEN BusinessEntityID END DESC  
        ,CASE WHEN SalariedFlag = 0 THEN BusinessEntityID END;  
GO 


--Syntax for while loop

--WHILE Boolean_expression   
--     { sql_statement | statement_block | BREAK | CONTINUE }  

--Using BREAK and CONTINUE with nested IF...ELSE and WHILE

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

--Using WHILE In A Cursor

DECLARE @EmployeeID as NVARCHAR(256)
DECLARE @Title as NVARCHAR(50)

DECLARE Employee_Cursor CURSOR FOR  
SELECT LoginID, JobTitle   
FROM AdventureWorks2012.HumanResources.Employee  
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

--Simple While Loop
--Uses AdventureWorks  
WHILE ( SELECT AVG(ListPrice) FROM dbo.DimProduct) < $300  
BEGIN  
    UPDATE dbo.DimProduct  
        SET ListPrice = ListPrice * 2;  
    SELECT MAX ( ListPrice) FROM dbo.DimProduct  
    IF ( SELECT MAX (ListPrice) FROM dbo.DimProduct) > $500  
        BREAK;  
END  
  


--JSON
--FOR JSON AUTO
--FOR JSON PATH
--INCLUDE_NULL_VALUES,WITHOUT_ARRAY_WRAPPER

USE SQLtask

SELECT  * FROM Employee

SELECT TOP 3 
	EmployeeID,
	FirstName AS "Name.FirstName",
	LastName AS "Name.LastName",
	Salary 
FROM Employee
FOR JSON AUTO 



--INCLUDE_NULL_VALUES = FOR INCLUDE NULL VALUES IN JSON TEXT
--WITHOUT_ARRAY_WRAPPER = IF THERE IS ONLY ONE RECORD THEN AND ONLY THEN IT WOULD WE APPLY

UPDATE Employee SET Salary = Null WHERE EmployeeID = 1

--
DECLARE @json NVARCHAR(MAX);
SET @json = N'[
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
]';

SELECT *
FROM OPENJSON(@json)
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',
    age INT,
    dateOfBirth DATETIME2 '$.dob'
  );

  --ISJSON
DECLARE @param NVARCHAR(MAX)
SET @param = 21

IF (ISJSON(@param) > 0)  
BEGIN  
   -- Do something with the valid JSON value of @param.  

--JSON_VALUE
CREATE TABLE dbo.Store
 (
  StoreID INT IDENTITY(1,1) NOT NULL,
  Address VARCHAR(500),
  jsonContent NVARCHAR(4000),
  Longitude AS JSON_VALUE(jsonContent, '$.address[0].longitude'),
  Latitude AS JSON_VALUE(jsonContent, '$.address[0].latitude')
 )


