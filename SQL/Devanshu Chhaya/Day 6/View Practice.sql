
---- Views Using SSMS

select * from [HumanResources].[Employee]

select * from [Person].[BusinessEntityAddress]

select * from [Person].[Address]

select * from [dbo].[AddressBusinessAntityAddressEmployee]

ALTER VIEW [AddressBusinessAntityAddressEmployee] 
AS
SELECT Employee_1.BusinessEntityID,Employee_1.JobTitle, Employee_1.NationalIDNumber, Employee_1.HireDate, 
		Person.BusinessEntityAddress.AddressID, Person.Address.AddressID AS Expr1, Person.Address.City, 
		Person.Address.AddressLine1
		FROM     Person.Address INNER JOIN
                  Person.BusinessEntityAddress ON Person.Address.AddressID = Person.BusinessEntityAddress.AddressID INNER JOIN
                  HumanResources.Employee AS Employee_1 ON Person.BusinessEntityAddress.BusinessEntityID = Employee_1.BusinessEntityID


UPDATE AddressBusinessAntityAddressEmployee SET JobTitle='Customer' WHERE BusinessEntityID=259

UPDATE [HumanResources].[Employee] SET JobTitle='Marketing Specialist1' WHERE BusinessEntityID=22

DELETE FROM AddressBusinessAntityAddressEmployee WHERE BusinessEntityID=259


-------Using Transact-SQL

CREATE VIEW hiredate_view  
AS   
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate  
FROM HumanResources.Employee e   
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID ;  
GO

SELECT * FROM hiredate_view

CREATE VIEW Purchasing.PurchaseOrderReject  
WITH ENCRYPTION  
AS  
SELECT PurchaseOrderID, ReceivedQty, RejectedQty,   
    RejectedQty / ReceivedQty AS RejectRatio, DueDate  
FROM Purchasing.PurchaseOrderDetail  
WHERE RejectedQty / ReceivedQty > 0  
AND DueDate > CONVERT(DATETIME,'20010630',101) ;  
GO

SELECT * FROM Purchasing.PurchaseOrderReject

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

SELECT * FROM dbo.all_supplier_view