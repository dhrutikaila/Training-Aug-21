--CREATING A SCALAR FUNCTION
USE AdventureWorks2012
CREATE FUNCTION dbo.ufnGetInventoryStock(@ProductID int)  
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = SUM(p.Quantity)   
    FROM Production.ProductInventory p   
    WHERE p.ProductID = @ProductID   
        AND p.LocationID = '6';  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END;

SELECT ProductModelID, Name, dbo.ufnGetInventoryStock(ProductID)AS CurrentSupply  
FROM Production.Product  
WHERE ProductModelID BETWEEN 75 and 80; 


--CREATING TABLE-VALUED FUNCTION
CREATE FUNCTION Sales.ufn_SalesByStore(@storeid int)
RETURNS TABLE
AS
RETURN
(
	SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'  
    FROM Production.Product AS P   
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE C.StoreID = @storeid  
    GROUP BY P.ProductID, P.Name  
);

SELECT * FROM Sales.ufn_SalesByStore (602);  

--CREATING MULTI-STATEMENT TABLE VALUED FUNCTION
USE Practice
CREATE FUNCTION GetFLName(@EmpID INT)
RETURNS @getflname TABLE
(
	FirstName varchar(20),
	LastName varchar(20)
)
AS
BEGIN
INSERT INTO @getflname
SELECT FirstName,LastName FROM Employees WHERE EmployeeID=@EmpID
RETURN 
END
GO

SELECT * FROM GetFLName(100)


