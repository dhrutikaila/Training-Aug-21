--1. Scalar Function to return total payable amount per order.
CREATE FUNCTION dbo.ufnGetInventoryStock(@SalesID int)  
RETURNS int   
AS   
-- Returns the total amount per order id.  
BEGIN  
    DECLARE @ret int  
    SELECT @ret = SUM(SO.UnitPrice)   
    FROM SalesLT.SalesOrderDetail SO   
    WHERE SO.SalesOrderID = @SalesID   
        IF (@ret IS NULL)   
        SET @ret = 0
    RETURN @ret
END
GO
SELECT dbo.ufnGetInventoryStock(71774) AS 'Payable Amount'
GO

--2. Table Valued Function
CREATE FUNCTION ufn_SalesByStore (@Productid int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total', SUM(P.ListPrice) AS 'ProductPrice'
    FROM SalesLT.Product AS P   
    JOIN SalesLT.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN SalesLT.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
    JOIN SalesLT.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE P.ProductID = @Productid  
    GROUP BY P.ProductID, P.Name  
)
GO
SELECT * FROM dbo.ufn_SalesByStore(780)
GO
