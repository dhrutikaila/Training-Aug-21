USE AdventureWorks2016


--SubQueries--
--1--
SELECT Name FROM Production.Product WHERE ListPrice =
(SELECT ListPrice FROM Production.Product WHERE Name = 'Chainring Bolts' )
SELECT * FROM Production.Product

--2--
SELECT Name FROM Sales.Store WHERE BusinessEntityID NOT IN
(SELECT CustomerID FROM Sales.Customer WHERE TerritoryID = 5)

--3--
SELECT LastName, FirstName FROM Person.Person WHERE BusinessEntityID IN
(SELECT BusinessEntityID FROM HumanResources.Employee WHERE BusinessEntityID IN
(SELECT BusinessEntityID FROM Sales.SalesPerson))

--4--
SELECT DISTINCT c.LastName, c.FirstName, e.BusinessEntityID 
FROM Person.Person AS c JOIN HumanResources.Employee AS e
ON e.BusinessEntityID = c.BusinessEntityID 
WHERE 5000.00 IN
(SELECT Bonus FROM Sales.SalesPerson sp WHERE e.BusinessEntityID = sp.BusinessEntityID)


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



--VIEWS--

--Create view to Select name,phonenumber,modifiedDatev where first name like Sharon-- 
CREATE VIEW PersonDetails
AS 
SELECT CONCAT(per.FirstName,' ',per.MiddleName,' ',per.LastName) AS 'Name' ,pho.PhoneNumber,pho.ModifiedDate
FROM Person.Person As per INNER JOIN Person.PersonPhone AS pho 
ON per.BusinessEntityID=pho.BusinessEntityID
SELECT * FROM PersonDetails WHERE Name LIKE 'Sharon%'

-------------------------------------------------------------
--Create View to select BirthDate,MaritalStatus,Gender, RateChangeDate,PayFreqency for Employees whose vacationHours are more than 30
CREATE VIEW EmployeeDetails
AS
SELECT  Emp.BirthDate, Emp.MaritalStatus, Emp.Gender, Pay.RateChangeDate, Pay.PayFrequency
FROM    HumanResources.Employee AS Emp INNER JOIN
        HumanResources.EmployeePayHistory AS Pay ON Emp.BusinessEntityID = Pay.BusinessEntityID
WHERE   (Emp.VacationHours > 30)
SELECT * FROM EmployeeDetails

-------------------------------------------------------------------------------------

--Microsoft Document Example--

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

----------------------------------------------------------------------------------------

--Microsoft Document Example--

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
SELECT * FROM SeattleOnly
-------------------------------------------------------------------------------


--Microsoft Document Example--
CREATE VIEW Sales.SalesPersonPerform  
AS  
SELECT TOP (100) SalesPersonID, SUM(TotalDue) AS TotalSales  
FROM Sales.SalesOrderHeader  
WHERE OrderDate > CONVERT(DATETIME,'20001231',101)  
GROUP BY SalesPersonID;  
GO  
SELECT * FROM Sales.SalesPersonPerform
------------------------------------------------------


--Microsoft Document Example--
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
SELECT * FROM SUPPLY1
SELECT * FROM SUPPLY2
SELECT * FROM SUPPLY3
SELECT * FROM SUPPLY4
