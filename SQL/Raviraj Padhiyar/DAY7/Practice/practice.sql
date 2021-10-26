--CTE


--sales CTE

WITH Sales_CTE (SalesPersonID,SaleOrderID,SalesYear)
AS
(
	SELECT SalesPersonID,SalesOrderID, YEAR(OrderDate) AS SalesYear
	FROM Sales.SalesOrderHeader
	WHERE SalesPersonID IS NOT NULL
)

SELECT SalesPersonID,COUNT(SaleOrderID) AS TotalSales, SalesYear
FROM Sales_CTE
GROUP BY SalesYear,SalesPersonID
ORDER BY SalesPersonID,SalesYear


WITH Sales_CTE (SalesOrderID,NumberOfOrders)
AS
(
	SELECT SalesPersonID,COUNT(*)
	FROM Sales.SalesOrderHeader
	WHERE SalesPersonID IS NOT NULL
	GROUP BY SalesPersonID
)
SELECT AVG(NumberOFOrders) AS 'Avg sales per person'
FROM Sales_CTE




--declaring two cte and performing join on them

WITH Sales_CTE (SalesPersonID, TotalSales, SalesYear)  
AS  
-- Define the first CTE query.  
(  
    SELECT SalesPersonID, SUM(TotalDue) AS TotalSales, YEAR(OrderDate) AS SalesYear  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL  
       GROUP BY SalesPersonID, YEAR(OrderDate)  
  
)  
,   -- Use a comma to separate multiple CTE definitions.  
  
-- Define the second CTE query, which returns sales quota data by year for each sales person.  
Sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)  
AS  
(  
       SELECT BusinessEntityID, SUM(SalesQuota)AS SalesQuota, YEAR(QuotaDate) AS SalesQuotaYear  
       FROM Sales.SalesPersonQuotaHistory  
       GROUP BY BusinessEntityID, YEAR(QuotaDate)  
)  
  
-- Define the outer query by referencing columns from both CTEs.  
SELECT SalesPersonID  
  , SalesYear  
  , FORMAT(TotalSales,'C','en-us') AS TotalSales  
  , SalesQuotaYear  
  , FORMAT (SalesQuota,'C','en-us') AS SalesQuota  
  , FORMAT (TotalSales -SalesQuota, 'C','en-us') AS Amt_Above_or_Below_Quota  
FROM Sales_CTE  
JOIN Sales_Quota_CTE ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID  
                    AND Sales_CTE.SalesYear = Sales_Quota_CTE.SalesQuotaYear  
ORDER BY SalesPersonID, SalesYear;






--simple non recursive CTE

USE SampleTable

WITH RowCTE(RowNo)
AS
(SELECT ROW_NUMBER() OVER (ORDER BY EmployeeID ASC) AS RowNo
FROM Employees)

SELECT * FROM RowCTE

--recursive CTE

DECLARE @Row INT = 1;

WITH RowCTE
AS
(
	SELECT @Row AS RowNO
	UNION ALL
	SELECT RowNO+1 FROM RowCTE
	WHERE RowNO < 10
)

SELECT * FROM RowCTE





---------------------------------------------------------------------------------------------------------



CREATE TABLE dbo.Person(ID int, Name VARCHAR(30), Mother INT, Father INT);  

INSERT dbo.Person   
VALUES(1, 'Sue', NULL, NULL)  
      ,(2, 'Ed', NULL, NULL)  
      ,(3, 'Emma', 1, 2)  
      ,(4, 'Jack', 1, 2)  
      ,(5, 'Jane', NULL, NULL)  
      ,(6, 'Bonnie', 5, 4)  
      ,(7, 'Bill', 5, 4);  
GO  


--find bill ancestor
WITH Genration(ID)
AS (
	--anchoring Mother of bill
	SELECT Mother
	FROM Person
	WHERE Name='Bill'
UNION ALL
	--anchoring Father of bill
	SELECT Father
	FROM Person
	WHERE Name='Bill'
UNION ALL
	SELECT Person.Father
	FROM Genration,Person
	WHERE Genration.ID = Person.ID
UNION ALL
	SELECT Person.Mother
	FROM Genration,person
	WHERE Genration.ID = Person.ID
)

SELECT Person.ID, Person.Name, Person.Mother, Person.Father  
FROM Genration, dbo.Person  
WHERE Genration.ID = Person.ID;  


