----- subqueries

 USE AdventureWorks2016;
GO
SELECT [Name]
FROM Sales.Store
WHERE BusinessEntityID NOT IN
    (SELECT CustomerID
     FROM Sales.Customer
     WHERE TerritoryID = 5);
GO

-- Correlated Subqueries

USE AdventureWorks2016;
GO
SELECT DISTINCT c.LastName, c.FirstName, e.BusinessEntityID 
FROM Person.Person AS c JOIN HumanResources.Employee AS e
ON e.BusinessEntityID = c.BusinessEntityID 
WHERE 5000.00 IN
    (SELECT Bonus
    FROM Sales.SalesPerson sp
    WHERE e.BusinessEntityID = sp.BusinessEntityID) ;
GO


--- Subqueries With IN

USE AdventureWorks2016;
GO
SELECT [Name]
FROM Production.Product
WHERE ProductSubcategoryID IN
    (SELECT ProductSubcategoryID
     FROM Production.ProductSubcategory
     WHERE [Name] = 'Wheels');
GO

--- Subqueries with not in

USE AdventureWorks2016;
GO
SELECT [Name]
FROM Production.Product
WHERE ProductSubcategoryID NOT IN
    (SELECT ProductSubcategoryID
     FROM Production.ProductSubcategory
     WHERE [Name] = 'Mountain Bikes' 
        OR [Name] = 'Road Bikes'
        OR [Name] = 'Touring Bikes');
GO


--- Subqueries with comparison operators

USE AdventureWorks2016;
GO
SELECT CustomerID
FROM Sales.Customer
WHERE TerritoryID =
    (SELECT TerritoryID
     FROM Sales.SalesPerson
     WHERE BusinessEntityID = 276);
GO

USE AdventureWorks2016;
GO
SELECT [Name]
FROM Production.Product
WHERE ListPrice >
    (SELECT MIN (ListPrice)
     FROM Production.Product
     GROUP BY ProductSubcategoryID
     HAVING ProductSubcategoryID = 14);
GO

--- Subquaries with Update Statemment

USE AdventureWorks2016;
GO 
UPDATE Production.Product
SET ListPrice = ListPrice * 2
WHERE ProductID IN
    (SELECT ProductID 
     FROM Purchasing.ProductVendor
     WHERE BusinessEntityID = 1540);
GO

--- Subquaries with ANY,ALL

USE AdventureWorks2016;
GO
SELECT [Name]
FROM Production.Product
WHERE ListPrice >= ANY
    (SELECT MAX (ListPrice)
     FROM Production.Product
     GROUP BY ProductSubcategoryID);
GO

USE AdventureWorks2016;
GO
SELECT [Name]
FROM Production.Product
WHERE ListPrice >= ALL
    (SELECT MIN (ListPrice)
     FROM Production.Product
     GROUP BY ProductSubcategoryID);
GO

--- Subquaries With Exists

USE AdventureWorks2016;
GO
SELECT [Name]
FROM Production.Product
WHERE EXISTS
    (SELECT * 
     FROM Production.ProductSubcategory
     WHERE ProductSubcategoryID IN
	 (SELECT ProductSubcategoryID FROM Production.Product)
		AND [Name] = 'Wheels');
GO

USE AdventureWorks2016;
GO
SELECT [Name]
FROM Production.Product
WHERE EXISTS
    (SELECT * 
     FROM Production.ProductSubcategory
     WHERE ProductSubcategoryID = 
            Production.Product.ProductSubcategoryID
        AND [Name] = 'Wheels');
GO

---- Subquaries in Select As an Expression 

USE AdventureWorks2016;
GO
SELECT [Name], ListPrice, 
(SELECT AVG(ListPrice) FROM Production.Product) AS Average, 
    ListPrice - (SELECT AVG(ListPrice) FROM Production.Product)
    AS Difference
FROM Production.Product
WHERE ProductSubcategoryID = 1;
GO
