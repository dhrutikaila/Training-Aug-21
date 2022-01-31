--CTE--
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

--Derived Table--
SELECT Salary FROM(
          SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS Rankk,*
		  FROM Employees)Temp
WHERE Rankk=2