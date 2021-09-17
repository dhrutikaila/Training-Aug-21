CREATE VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID ;   
GO  
-- Query the view  
SELECT FirstName, LastName, HireDate  
FROM HumanResources.EmployeeHireDate  
ORDER BY LastName;  

-- Modify the view by adding a WHERE clause to limit the rows returned.  
ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID  
WHERE HireDate < CONVERT(DATETIME,'20020101',101) ;   
GO  
 

UPDATE HumanResources.vEmployeeDepartmentHistory  
SET StartDate = '20110203', EndDate = GETDATE()   
WHERE LastName = N'Smith' AND FirstName = 'Samantha';   
GO  
SELECT * FROM HumanResources.vEmployeeDepartmentHistory where GroupName='MyGroup'

INSERT INTO HumanResources.vEmployeeDepartmentHistory (Department, GroupName)   
VALUES ('MyDepartment', 'MyGroup');   
GO  

DROP VIEW HumanResources.EmployeeHireDate


CREATE TABLE dbo.SUPPLY1 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 1 and 150),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY2 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 151 and 300),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY3 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 301 and 450),  
supplier CHAR(50)  
);  
CREATE TABLE dbo.SUPPLY4 (  
supplyID INT PRIMARY KEY CHECK (supplyID BETWEEN 451 and 600),  
supplier CHAR(50)  
);  
GO  
--Create the view that combines all supplier tables.  
CREATE VIEW dbo.all_supplier_view  
WITH SCHEMABINDING  
AS  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY1  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY2  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY3  
UNION ALL  
SELECT supplyID, supplier  
  FROM dbo.SUPPLY4;  
GO
INSERT dbo.all_supplier_view VALUES ('1', 'CaliforniaCorp'), ('5', 'BraziliaLtd')    
, ('231', 'FarEast'), ('280', 'NZ')  
, ('321', 'EuroGroup'), ('442', 'UKArchip')  
, ('475', 'India'), ('521', 'Afrique');  
GO  
SELECT * FROM SUPPLY4

CREATE VIEW hiredate_view  
AS   
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate  
FROM HumanResources.Employee e   
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID ;  
GO  

CREATE VIEW dbo.SeattleOnly  
AS  
SELECT p.LastName, p.FirstName, e.JobTitle, a.City, sp.StateProvinceCode  
FROM HumanResources.Employee e  
INNER JOIN Person.Person p  
ON p.BusinessEntityID = e.BusinessEntityID  
    INNER JOIN Person.BusinessEntityAddress bea   
    ON bea.BusinessEntityID = e.BusinessEntityID   
    INNER JOIN Person.Address a   
    ON a.AddressID = bea.AddressID  
    INNER JOIN Person.StateProvince sp   
    ON sp.StateProvinceID = a.StateProvinceID  
WHERE a.City = 'Seattle'  
WITH CHECK OPTION ;  
GO  
SELECT * FROM dbo.SeattleOnly

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
