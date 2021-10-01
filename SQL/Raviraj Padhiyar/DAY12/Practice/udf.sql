--user defined functions

--benifts of udf

--Complex code is stored in one structure. You can later look at that structure as on the black box, where you’re only interested in passing appropriate values as parameters and the function will do the rest
--You can much easier test input parameters using IF or CASE, and even use loops in the functions. This is sometimes very hard (sometimes impossible) to simulate directly in SELECT statements
--Once you create a function, and after it’s properly tested, you don’t have to bother later is it working as expected and you’re avoiding a possibility to make an error because you’re not rewriting the same code over and over again (not to mention that you’ll use less time when not rewriting the same code)
--If you need to make changes to your code, you’ll do it in one place and it will reflect at every place this function is used


--general syntax


--creating udf
CREATE FUNCTION [database_name.]function_name (parameters)
RETURNS data_type AS
BEGIN
    SQL statements
    RETURN value
END;


--alter the function
ALTER FUNCTION [database_name.]function_name (parameters)
RETURNS data_type AS
BEGIN
    SQL statements
    RETURN value
END;
   
--deleting the function
DROP FUNCTION [database_name.]function_name;

--------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------

--scaler functions

CREATE FUNCTION	east_or_west(
	@long DECIMAL(9,4)
)
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @return_value VARCHAR(4);
	SET @return_value = 'same';
	IF(@long > 0.00)
	BEGIN
		SET @return_value = 'east';
	END
	IF(@long < 0.0)
	BEGIN
		SET @return_value = 'west';
	END

	RETURN @return_value
END
GO


SELECT dbo.east_or_west(0),dbo.east_or_west(4.5),dbo.east_or_west(-2.98)




--example2

CREATE FUNCTION dbo.ufnGetInventoryStock(
@ProductID int
)
RETURNS INT
AS
BEGIN
	DECLARE @ret INT;
	SELECT @ret = SUM(p.Quantity)
	FROM Production.ProductInventory p
	WHERE p.ProductID = @ProductID
		AND p.LocationID = '6';
	IF(@ret IS NULL)
		SET @ret = 0;
	RETURN @ret;
END;
GO


SELECT ProductModeLID,Name,dbo.ufnGetInventoryStock(ProductID) AS CurrentSupply
FROM Production.Product
WHERE ProductModeLID BETWEEN 75 AND 80;


SELECT * FROM Sales.SalesOrderDetail

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------



--table valued functions

--creates an inline table-valued function 
CREATE FUNCTION Sales.ufn_SalesByStore(@Storeid INT)
RETURNS TABLE
AS
RETURN (
	SELECT p.ProductID,p.Name,Sum(LineTotal) AS 'Total'
	FROM Production.product p
	JOIN Sales.SalesOrderDetail sd ON sd.ProductID = p.ProductID
	JOIN Sales.SalesOrderHeader sh ON sh.SalesOrderID = sd.SalesOrderID
	JOIN Sales.Customer c ON sh.CustomerID = c.CustomerID
	WHERE c.StoreID = @storeid
	GROUP BY p.ProductID,p.Name
);
GO

SELECT * FROM Sales.ufn_SalesByStore(602)




---------------------------------------------------

/*----------------------multi-statement table-valued function----------------*/

CREATE FUNCTION dbo.ufn_FindReports (@InEmpID INT)
RETURNS @retFindReports TABLE
(
	EmployeeID int primary key NOT NULL,  
    FirstName nvarchar(255) NOT NULL,  
    LastName nvarchar(255) NOT NULL,  
    JobTitle nvarchar(50) NOT NULL,  
    RecursionLevel int NOT NULL
)
AS
BEGIN
WITH Emp_CTE(EmployeeID, OrganizationNode, FirstName, LastName, JobTitle, RecursionLevel)
	AS(
		SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, 0
        FROM HumanResources.Employee e   
			INNER JOIN Person.Person p   
			ON p.BusinessEntityID = e.BusinessEntityID  
        WHERE e.BusinessEntityID = @InEmpID  
        UNION ALL  
        SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, RecursionLevel + 1
        FROM HumanResources.Employee e   
            INNER JOIN EMP_cte  
            ON e.OrganizationNode.GetAncestor(1) = EMP_cte.OrganizationNode  
			INNER JOIN Person.Person p   
			ON p.BusinessEntityID = e.BusinessEntityID
	)

	INSERT @retFindReports  
	SELECT EmployeeID, FirstName, LastName, JobTitle, RecursionLevel  
	FROM EMP_cte   
	RETURN
END;
GO


SELECT EmployeeID, FirstName, LastName, JobTitle, RecursionLevel  
FROM dbo.ufn_FindReports(3); 






--Limitations and Restrictions

--User-defined functions cannot be used to perform actions that modify the database state.
--User-defined functions can be nested; that is, one user-defined function can call another. The nesting level is incremented when the called function starts execution, and decremented when the called function finishes execution. User-defined functions can be nested up to 32 levels. 

--User-defined functions cannot make use of dynamic SQL or temp tables. Table variables are allowed.

--User-defined functions cannot call a stored procedure, but can call an extended stored procedure.
