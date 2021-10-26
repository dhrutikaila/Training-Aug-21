USE AdventureWorks2016

--SCALER FUNCTION--
-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-07>
-- Description:	<Description, ,>
-- =============================================
--Create a Scaler Function (ppt)--
CREATE FUNCTION HumanResources.MonthlySal (@PayRate FLOAT)
RETURNS FLOAT
AS
BEGIN 
	RETURN (@PayRate * 8 * 30)
END

--Call a  Scaler Function--
DECLARE @PayRate FLOAT 
SET @PayRate = HumanResources.MonthlySal(100)
PRINT @PayRate
---------------------------------------------------------

--Scaler Function in msdn--
CREATE FUNCTION dbo.ufnGetInventoryStock(@ProductID INT)  
RETURNS INT
AS     
BEGIN  
    DECLARE @TotalQty INT 
    SELECT @TotalQty = SUM(p.Quantity)   
    FROM Production.ProductInventory p   
    WHERE p.ProductID = @ProductID   
        AND p.LocationID = '6' 
     IF (@TotalQty IS NULL)   
        SET @TotalQty = 0 
    RETURN @TotalQty
END
GO

SELECT dbo.ufnGetInventoryStock(ProductID) FROM Production.ProductInventory
---------------------------------------------------------------------------------


-- =============================================
-- Author:		<Preet,Name>
-- Create date: <2021-09-07>
-- Description:	<Description, ,>
--SELECT dbo.CountAge('2000-07-08') AS 'Age'
-- =============================================
--Create Scaler Function--
CREATE FUNCTION CountAge(@DOB DATE)
RETURNS INT
AS
BEGIN
	DECLARE @Age INT
	SET @Age = DATEDIFF(yy,@DOB,GETDATE())
	RETURN @Age
END
GO

SELECT dbo.CountAge('2000-07-08') AS 'Age'

--Use Scaler function in select data from data--
SELECT BusinessEntityID,JobTitle,BirthDate,dbo.CountAge(BirthDate) AS 'Age' FROM HumanResources.Employee

SELECT BusinessEntityID,JobTitle FROM HumanResources.Employee WHERE dbo.CountAge(BirthDate) >= 50

--DROP function--
DROP FUNCTION CountAge



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


--TABLE VALUED FUNCTION--

--Create table valued Function (ppt)--
CREATE FUNCTION Find_Department_GrpDetails(@GrpName VARCHAR(30))
RETURNS TABLE
AS
	RETURN(SELECT * FROM HumanResources.Department WHERE GroupName = @GrpName)
GO

SELECT * FROM Find_Department_GrpDetails('Manufacturing')
-------------------------------------------------------------------

--Create table valued function  (msdn)--
CREATE FUNCTION Sales.ufn_SalesByStore (@storeid int)  
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

SELECT * FROM Sales.ufn_SalesByStore(1026)
------------------------------------------------------------

SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.EmployeePayHistory

CREATE FUNCTION GetEmployeeDetail(@BD_ID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT emp.JobTitle, emp.BirthDate, dbo.CountAge(emp.BirthDate) AS 'Age', pay.Rate
	FROM HumanResources.Employee AS emp 
	INNER JOIN HumanResources.EmployeePayHistory AS pay
	ON emp.BusinessEntityID = pay.BusinessEntityID
	WHERE emp.BusinessEntityID = @BD_ID
)
GO

SELECT * FROM GetEmployeeDetail(5)

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


--Multi-Statement table Valued function--
CREATE FUNCTION GetDetails (@BusinessEntityID INT)
RETURNS @data TABLE
(
	BusinessEntityID INT,
	JobTitle VARCHAR(20),
	BirthDate DATE,
	Age TINYINT,
	Rate INT
)
AS
BEGIN
	INSERT INTO @data
	SELECT emp.BusinessEntityID,emp.JobTitle, emp.BirthDate, dbo.CountAge(emp.BirthDate) AS 'Age', pay.Rate
	FROM HumanResources.Employee AS emp 
	INNER JOIN HumanResources.EmployeePayHistory AS pay
	ON emp.BusinessEntityID = pay.BusinessEntityID
	WHERE emp.BusinessEntityID = @BusinessEntityID
	RETURN 
END
GO

SELECT * FROM GetDetails(5)


--ALTER function--
ALTER FUNCTION GetDetails (@BusinessEntityID INT)
RETURNS @data TABLE
(
	BusinessEntityID INT,
	JobTitle VARCHAR(20),
	BirthDate DATE,
	Age INT,		--Altering in this line
	Rate INT
)
AS
BEGIN
	INSERT INTO @data
	SELECT emp.BusinessEntityID,emp.JobTitle, emp.BirthDate, dbo.CountAge(emp.BirthDate) AS 'Age', pay.Rate
	FROM HumanResources.Employee AS emp 
	INNER JOIN HumanResources.EmployeePayHistory AS pay
	ON emp.BusinessEntityID = pay.BusinessEntityID
	WHERE emp.BusinessEntityID = @BusinessEntityID
	RETURN 
END
GO