USE AdventureWorksLT2012
GO
CREATE PROCEDURE SalesLT.Customertest1
@lastname nvarchar(50),
@firstname nvarchar(50)
AS
SET NOCOUNT ON;
SELECT FirstName,LastName,NameStyle
FROM SalesLT.Customer
WHERE FirstName=@firstname AND LastName=@lastname
AND NameStyle IS NULL;
GO
EXEC SalesLT.Customertest1 @lastname= N'ackerman',@firstname=N'pila';


USE test1
-- output
CREATE PROCEDURE SP1DATA
@EmployeeCount int OUTPUT,
@Department int 
AS
BEGIN
	SELECT @EmployeeCount= COUNT(*) FROM Employee
	WHERE DepartmentID=@Department
END
DECLARE @CountofEmployee INT
EXECUTE SP1DATA  @CountofEmployee OUTPUT,60
IF(@CountofEmployee IS NULL)
    PRINT 'COUNT NULL'
ELSE
    PRINT @CountofEmployee

--RETURN
CREATE PROC SPgetReturn
@Department INT
AS
BEGIN
   RETURN (SELECT COUNT(*) FROM Employees
           WHERE DepartmentID=@Department)
END

--MODIFY & CREATE
IF OBJECT_ID ( 'Purchasing.uspVendorAllInfo', 'P' ) IS NOT NULL   
    DROP PROCEDURE Purchasing.uspVendorAllInfo;  
GO  
CREATE PROCEDURE Purchasing.uspVendorAllInfo  
WITH EXECUTE AS CALLER  
AS  
    SET NOCOUNT ON;  
    SELECT v.Name AS Vendor, p.Name AS 'Product name',   
      v.CreditRating AS 'Rating',   
      v.ActiveFlag AS Availability  
    FROM Purchasing.Vendor v   
    INNER JOIN Purchasing.ProductVendor pv  
      ON v.BusinessEntityID = pv.BusinessEntityID   
    INNER JOIN Production.Product p  
      ON pv.ProductID = p.ProductID   
    ORDER BY v.Name ASC;  
GO

ALTER PROCEDURE Purchasing.uspVendorAllInfo  
    @Product varchar(25)   
AS  
    SET NOCOUNT ON;  
    SELECT LEFT(v.Name, 25) AS Vendor, LEFT(p.Name, 25) AS 'Product name',   
    'Rating' = CASE v.CreditRating   
        WHEN 1 THEN 'Superior'  
        WHEN 2 THEN 'Excellent'  
        WHEN 3 THEN 'Above average'  
        WHEN 4 THEN 'Average'  
        WHEN 5 THEN 'Below average'  
        ELSE 'No rating'  
        END  
    , Availability = CASE v.ActiveFlag  
        WHEN 1 THEN 'Yes'  
        ELSE 'No'  
        END  
    FROM Purchasing.Vendor AS v   
    INNER JOIN Purchasing.ProductVendor AS pv  
      ON v.BusinessEntityID = pv.BusinessEntityID   
    INNER JOIN Production.Product AS p   
      ON pv.ProductID = p.ProductID   
    WHERE p.Name LIKE @Product  
    ORDER BY v.Name ASC;  
GO
