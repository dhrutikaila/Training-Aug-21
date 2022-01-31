CREATE FUNCTION dbo.ufnGetInventoryStock(@ProductID int)  
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret INT;  
    SELECT @ret = SUM(p.Quantity)   
    FROM Production.ProductInventory p   
    WHERE p.ProductID = @ProductID   
        AND p.LocationID = '6';  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END



CREATE FUNCTION Sales.ufn_SalesByStore (@storeid INT)  
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
)



CREATE FUNCTION dbo.ufn_FindReports (@InEmpID INTEGER)  
RETURNS @retFindReports TABLE   
(  
    EmployeeID int primary key NOT NULL,  
    FirstName nvarchar(255) NOT NULL,  
    LastName nvarchar(255) NOT NULL,  
    JobTitle nvarchar(50) NOT NULL,  
    RecursionLevel int NOT NULL  
)  
--Returns a result set that lists all the employees who report to the   
--specific employee directly or indirectly.*/  
AS  
BEGIN  
WITH EMP_cte(EmployeeID, OrganizationNode, FirstName, LastName, JobTitle, RecursionLevel) -- CTE name and columns  
    AS (  
        SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, 0 -- Get the initial list of Employees for Manager n  
        FROM HumanResources.Employee e   
INNER JOIN Person.Person p   
ON p.BusinessEntityID = e.BusinessEntityID  
        WHERE e.BusinessEntityID = @InEmpID  
        UNION ALL  
        SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, RecursionLevel + 1 -- Join recursive member to anchor  
        FROM HumanResources.Employee e   
            INNER JOIN EMP_cte  
            ON e.OrganizationNode.GetAncestor(1) = EMP_cte.OrganizationNode  
INNER JOIN Person.Person p   
ON p.BusinessEntityID = e.BusinessEntityID  
        )  
-- copy the required columns to the result of the function   
   INSERT @retFindReports  
   SELECT EmployeeID, FirstName, LastName, JobTitle, RecursionLevel  
   FROM EMP_cte   
   RETURN  
END
GO 


--alter functions
-- Scalar-Valued Function  
USE [AdventureWorks2019]  
GO  
ALTER FUNCTION [dbo].[ufnGetAccountingEndDate]()  
RETURNS [datetime]   
AS   
BEGIN  
    RETURN DATEADD(millisecond, -2, CONVERT(datetime, '20040701', 112));  
END
 




 ALTER FUNCTION [dbo].[ufnGetContactInformation](@PersonID int)  
RETURNS @retContactInformation TABLE   
(  
    -- Columns returned by the function  
    [PersonID] int NOT NULL,   
    [FirstName] [nvarchar](50) NULL,   
    [LastName] [nvarchar](50) NULL,   
    [JobTitle] [nvarchar](50) NULL,  
    [BusinessEntityType] [nvarchar](50) NULL  
)  
AS   
-- Returns the first name, last name, job title and business entity type for the specified contact.  
-- Since a contact can serve multiple roles, more than one row may be returned.  
BEGIN  
IF @PersonID IS NOT NULL   
BEGIN  
     IF EXISTS(SELECT * FROM [HumanResources].[Employee] e   
     WHERE e.[BusinessEntityID] = @PersonID)   
     INSERT INTO @retContactInformation  
          SELECT @PersonID, p.FirstName, p.LastName, e.[JobTitle], 'Employee'  
          FROM [HumanResources].[Employee] AS e  
          INNER JOIN [Person].[Person] p ON p.[BusinessEntityID] = e.[BusinessEntityID]  
          WHERE e.[BusinessEntityID] = @PersonID;  

     IF EXISTS(SELECT * FROM [Purchasing].[Vendor] AS v  
     INNER JOIN [Person].[BusinessEntityContact] bec ON bec.[BusinessEntityID] = v.[BusinessEntityID]  
     WHERE bec.[PersonID] = @PersonID)  
     INSERT INTO @retContactInformation  
          SELECT @PersonID, p.FirstName, p.LastName, ct.[Name], 'Vendor Contact'   
          FROM [Purchasing].[Vendor] AS v  
          INNER JOIN [Person].[BusinessEntityContact] bec ON bec.[BusinessEntityID] = v.[BusinessEntityID]  
          INNER JOIN [Person].ContactType ct ON ct.[ContactTypeID] = bec.[ContactTypeID]  
          INNER JOIN [Person].[Person] p ON p.[BusinessEntityID] = bec.[PersonID]  
          WHERE bec.[PersonID] = @PersonID;  

     IF EXISTS(SELECT * FROM [Sales].[Store] AS s  
     INNER JOIN [Person].[BusinessEntityContact] bec ON bec.[BusinessEntityID] = s.[BusinessEntityID]  
     WHERE bec.[PersonID] = @PersonID)  
     INSERT INTO @retContactInformation  
          SELECT @PersonID, p.FirstName, p.LastName, ct.[Name], 'Store Contact'   
          FROM [Sales].[Store] AS s  
          INNER JOIN [Person].[BusinessEntityContact] bec ON bec.[BusinessEntityID] = s.[BusinessEntityID]  
          INNER JOIN [Person].ContactType ct ON ct.[ContactTypeID] = bec.[ContactTypeID]  
          INNER JOIN [Person].[Person] p ON p.[BusinessEntityID] = bec.[PersonID]  
          WHERE bec.[PersonID] = @PersonID;  

     IF EXISTS(SELECT * FROM [Person].[Person] AS p  
     INNER JOIN [Sales].[Customer] AS c ON c.[PersonID] = p.[BusinessEntityID]  
     WHERE p.[BusinessEntityID] = @PersonID AND c.[StoreID] IS NULL)   
     INSERT INTO @retContactInformation  
          SELECT @PersonID, p.FirstName, p.LastName, NULL, 'Consumer'   
          FROM [Person].[Person] AS p  
          INNER JOIN [Sales].[Customer] AS c ON c.[PersonID] = p.[BusinessEntityID]  
          WHERE p.[BusinessEntityID] = @PersonID AND c.[StoreID] IS NULL;   
     END  
RETURN
END  


DECLARE @ret nvarchar(15);   

-- Execute the function while passing a value to the @status parameter
EXEC @ret = dbo.ufnGetSalesOrderStatusText 
	@Status = 5; 

-- View the returned value.  The Execute and Select statements must be executed at the same time.  
SELECT N'Order Status: ' + @ret; 



