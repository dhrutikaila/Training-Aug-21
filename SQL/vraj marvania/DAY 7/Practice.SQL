--INTERSECT

SELECT ProductID   
FROM Production.Product  
INTERSECT  
SELECT ProductID   
FROM Production.WorkOrder  

--EXCEPT  

SELECT ProductID   
FROM Production.WorkOrder  
EXCEPT  
SELECT ProductID   
FROM Production.Product 

  
SELECT CustomerKey   
FROM FactInternetSales    
EXCEPT   
SELECT CustomerKey   
FROM DimCustomer   
WHERE DimCustomer.Gender = 'F'  
ORDER BY CustomerKey  

--Creating a simple common table expression

    -- Define the CTE expression name and column list.  
    WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)  
    AS  
    -- Define the CTE query.  
    (  
        SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
        FROM Sales.SalesOrderHeader  
        WHERE SalesPersonID IS NOT NULL  
    )  
    -- Define the outer query referencing the CTE name.  
    SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear  
    FROM Sales_CTE  
    GROUP BY SalesYear, SalesPersonID  
    ORDER BY SalesPersonID, SalesYear

 --Using a common table expression to limit counts and report averages   

    WITH Sales_CTE (SalesPersonID, NumberOfOrders)  
    AS  
    (  
        SELECT SalesPersonID, COUNT(*)  
        FROM Sales.SalesOrderHeader  
        WHERE SalesPersonID IS NOT NULL  
        GROUP BY SalesPersonID  
    )  
    SELECT AVG(NumberOfOrders) AS "Average Sales Per Person"  
    FROM Sales_CTE

--Using a recursive CTE in an UPDATE statement

    USE AdventureWorks2012  
    GO  
    WITH Parts(AssemblyID, ComponentID, PerAssemblyQty, EndDate, ComponentLevel) AS  
    (  
        SELECT b.ProductAssemblyID, b.ComponentID, b.PerAssemblyQty,  
            b.EndDate, 0 AS ComponentLevel  
        FROM Production.BillOfMaterials AS b  
        WHERE b.ProductAssemblyID = 800  
            AND b.EndDate IS NULL  
        UNION ALL  
        SELECT bom.ProductAssemblyID, bom.ComponentID, p.PerAssemblyQty,  
            bom.EndDate, ComponentLevel + 1  
        FROM Production.BillOfMaterials AS bom   
            INNER JOIN Parts AS p  
            ON bom.ProductAssemblyID = p.ComponentID  
            AND bom.EndDate IS NULL  
    )  
    UPDATE Production.BillOfMaterials  
    SET PerAssemblyQty = c.PerAssemblyQty * 2  
    FROM Production.BillOfMaterials AS c  
    JOIN Parts AS d ON c.ProductAssemblyID = d.AssemblyID  
    WHERE d.ComponentLevel = 0

 --Derived Table
	SELECT * FROM (SELECT I.FIRST_NAME AS EmployeeName ,E.FIRST_NAME AS ManagerName 
	               FROM Employee E ,Employee i  
				   WHERE E.EMPLOYEE_ID=I.MANAGER_ID)TEMP    