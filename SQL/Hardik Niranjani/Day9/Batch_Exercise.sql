--Batch Practice

--If-Else Statement

IF DATENAME(weekday, GETDATE()) IN ('Saturday', 'Sunday') 
       SELECT 'Weekend' AS [Weekend / Weekday]
ELSE 
       SELECT 'Weekday' AS [Weekend / Weekday]


--While Loop
USE AdventureWorks2019  
GO  
WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300  
BEGIN  
   UPDATE Production.Product  
      SET ListPrice = ListPrice * 2  
   SELECT MAX(ListPrice) FROM Production.Product  
   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500  
      BREAK  
   ELSE  
      CONTINUE  
END  


--Case 

SELECT ProductNumber, Category =  
      CASE ProductLine  
         WHEN 'R' THEN 'Road'  
         WHEN 'M' THEN 'Mountain'  
         WHEN 'T' THEN 'Touring'  
         WHEN 'S' THEN 'Other sale items'  
         ELSE 'Not for sale'  
      END,  
	  [Name]  
	  FROM Production.Product  
	  ORDER BY ProductNumber




