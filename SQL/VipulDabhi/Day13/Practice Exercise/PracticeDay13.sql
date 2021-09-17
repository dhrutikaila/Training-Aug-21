
--!**!Creating And calling Scaller Function!**!

--Creating

-- =============================================
-- Author:		<VipulDabhi>
-- Create date: <07-09-2021>
-- Description:	<Creating A Function For Practice>
-- =============================================
CREATE FUNCTION HumanResources.Monthlysal 
(
	@PayRate float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	--DECLARE <@ResultVar, sysname, @Result> <Function_Data_Type, ,int>

	-- Add the T-SQL statements to compute the return value here
	--SELECT <@ResultVar, sysname, @Result> = <@Param1, sysname, @p1>

	-- Return the result of the function
	RETURN (@PayRate * 8 * 30)

END


--Calling

DECLARE @PayRate float
SET @PayRate = HumanResources.Monthlysal(12.25)
PRINT @PayRate


--Scaler Function With If_ELSE

CREATE FUNCTION VoterVarification
(@Age INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @Status VARCHAR(100)
	IF @Age >= 18
	BEGIN 
		SET @Status = 'You Are Aligible For Vote'
	END
	ELSE
	BEGIN
		SET @Status = 'You Are Not Aligile For Voting'
	END
	RETURN @Status
END

--Calling
SELECT dbo.VoterVarification(20)

--Function Call Other Function

CREATE FUNCTION GetCurrentDate()
RETURNS DATETIME
AS 
BEGIN

	RETURN GETDATE()

END
--Calling
SELECT dbo.GetCurrentDate()


--!**!Creating A Table Valued Function!**!

--!**!Inline Table Value Function!**!

-- =============================================
-- Author:		<Vipuldabhi>
-- Create date: <07-09-2021>
-- Description:	<>
-- =============================================
CREATE FUNCTION fx_Department_Gname 
(	
	-- Add the parameters for the function here
	@GrName	NVARCHAR(20)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM HumanResources.Department
		WHERE GroupName = @GrName
)
--CALLING
SELECT * FROM fx_Department_Gname ('Manufacturing')


--Example Of Inline Table values Function
USE AdventureWorks2012
CREATE FUNCTION Sales.ufn_SalesByStore 
(@storeid int)
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

--FUNCTION ARE ALSO USED WITH SELECT STATEMENT

USE SQLtask
CREATE FUNCTION fu_Employee()
RETURNS TABLE
AS
	RETURN(SELECT * FROM Employees)
--CALLING 
SELECT * FROM fu_Employee()
SELECT EmployeeID,Firstname,LastName FROM fu_Employee()
SELECT * FROM fu_Employee() f JOIN Departments d ON f.DepartmentID = d.DepartmentID

--!**!Multi-Statement Table Valued Functions!**!

-- =============================================
-- Author:		<VipulDabhi>
-- Create date: <07-09-2021>
-- Description:	<Multi-Statement table valued Function>
-- =============================================
USE AdventureWorks2012
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
        -- Get the initial list of Employees for Manager n
        SELECT e.BusinessEntityID, OrganizationNode = ISNULL(e.OrganizationNode, CAST('/' AS hierarchyid)) 
        , p.FirstName, p.LastName, e.JobTitle, 0
        FROM HumanResources.Employee e
              INNER JOIN Person.Person p
              ON p.BusinessEntityID = e.BusinessEntityID
        WHERE e.BusinessEntityID = @InEmpID
        UNION ALL
        -- Join recursive member to anchor
        SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, RecursionLevel + 1
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
END;
GO 
-- Example invocation
SELECT EmployeeID, FirstName, LastName, JobTitle, RecursionLevel
FROM dbo.ufn_FindReports(1);


--
USE SQLtask
CREATE FUNCTION fn_EmpoyeeDetails()
RETURNS @retEmployeeDetails TABLE
(
	EmpId INT,
	Name VARCHAR(50),
	Salary INT
)
AS
BEGIN
	INSERT INTO @retEmployeeDetails
	SELECT EmployeeID,FirstName,Salary FROM Employees 
	RETURN
END
SELECT * FROM fn_EmpoyeeDetails()




						--!**!Aggregate Function!**!



--APPROX_COUNT_DISTINCT ( expression )   
SELECT APPROX_COUNT_DISTINCT(O_OrderKey) AS Approx_Distinct_OrderKey
FROM dbo.Orders;

--AVG
SELECT AVG(VacationHours)AS 'Average vacation hours',   
    SUM(SickLeaveHours) AS 'Total sick leave hours'  
FROM HumanResources.Employee  
WHERE JobTitle LIKE 'Vice President%';  

--CHECKSUM_AGG
--Get the checksum value before the column value is changed.  
SELECT CHECKSUM_AGG(CAST(Quantity AS INT))  
FROM Production.ProductInventory;  
GO  

--COUNT
SELECT COUNT(DISTINCT Title)  
FROM HumanResources.Employee;  
GO  

--GROUPING
SELECT SalesQuota, SUM(SalesYTD) 'TotalSalesYTD', GROUPING(SalesQuota) AS 'Grouping'  
FROM Sales.SalesPerson  
GROUP BY SalesQuota WITH ROLLUP;  
GO  

--MAX
SELECT MAX(TaxRate)  
FROM Sales.SalesTaxRate;  
GO

--MIN
SELECT MIN(TaxRate)  
FROM Sales.SalesTaxRate;  
GO

--STDEV
SELECT STDEV(Bonus)  
FROM Sales.SalesPerson;  
GO  

--STDEVP
SELECT STDEVP(Bonus)  
FROM Sales.SalesPerson;  
GO  

--SUM
SELECT Color, SUM(ListPrice), SUM(StandardCost)  
FROM Production.Product  
WHERE Color IS NOT NULL   
    AND ListPrice != 0.00   
    AND Name LIKE 'Mountain%'  
GROUP BY Color  
ORDER BY Color;  
GO

--VAR
SELECT VAR(Bonus)  
FROM Sales.SalesPerson;  
GO  

--VARP
SELECT VARP(Bonus)  
FROM Sales.SalesPerson;  
GO

