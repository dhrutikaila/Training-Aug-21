use AdventureWorks2012

-- View Practice

SELECT * FROM dbo.View_1

UPDATE dbo.view_1 
SET FirstName = 'Prit' WHERE BusinessEntityID = 1


SELECT * FROM Person.Person

UPDATE dbo.View_1
SET FirstName = 'Man', PhoneNumber = 999-555-9999 WHERE BusinessEntityID = 1


UPDATE Person.Person
SET FirstName = 'Man' WHERE BusinessEntityID = 1


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

Update SeattleOnly
SET FirstName = 'Prit' WHERE LastName = 'Lee'

SELECT * FROM SeattleOnly


--Create the tables and insert the values.  
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

SELECT * FROM dbo.SUPPLY1


-------------------------------------------------------------------------------------


-- Batch Practice

DECLARE @output int
SET @output = (SELECT MAX(Rate) FROM HumanResources.EmployeePayHistory)
PRINT @output
GO

-- OR

DECLARE @output int
SELECT @output =  MAX(Rate) FROM HumanResources.EmployeePayHistory
PRINT @output
GO


-- If-else

DECLARE @rate int
SELECT @rate = Rate FROM HumanResources.EmployeePayHistory WHERE BusinessEntityID = 25
IF @rate < 15
PRINT 'Review required'
ELSE
BEGIN
PRINT 'Review Not Required'
PRINT 'Rate = ' + CAST (@rate as varchar)
END
GO


-- Case statement

SELECT BusinessEntityID, 
	   'MaritalStatus' = CASE MaritalStatus
	   WHEN 'M' THEN 'Married'
	   WHEN 'S' THEN 'Single'
	   ELSE 'Not Specified'
	   END
FROM HumanResources.Employee
GO



-- While statement

WHILE(SELECT AVG(ListPrice) FROM Production.Product) < 300
BEGIN
	UPDATE Production.Product
	SET ListPrice = ListPrice * 2
	SELECT MAX(ListPrice) FROM Production.Product
	IF(SELECT MAX(ListPrice) FROM Production.Product) > 500
		BREAK
	ELSE
		CONTINUE
END
PRINT 'Too much'


SELECT * FROM Production.Product