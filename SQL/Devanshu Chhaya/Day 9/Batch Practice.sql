
----- IF ELSE

IF DATENAME(weekday,'20210830') IN (N'Saturday', N'Sunday')
       SELECT 'Weekend';
ELSE 
       SELECT 'Weekday';


DECLARE @TOTALCOUNT INT,@AVGWEIGHT DECIMAL(6,2)

IF
(select COUNT(*) from [Production].[Product] where Name like 'Touring-3000%')>5
BEGIN 
	SET @TOTALCOUNT=
		(SELECT COUNT(*) 
			FROM Production.Product
			WHERE Name like 'Touring-3000%');

	SET @AVGWEIGHT=
		(SELECT AVG(Weight)
			FROM Production.Product
			WHERE Name like 'Touring-3000%');

	PRINT 'THERE ARE '+CAST(@TOTALCOUNT AS VARCHAR(3));
END
ELSE
BEGIN
	SET @AVGWEIGHT=
		(SELECT AVG(Weight)
			FROM Production.Product
			WHERE Name like 'Touring-3000%');

END;


----- CASE 

USE AdventureWorks2012;  
GO  
SELECT   ProductNumber, Category =  
      CASE ProductLine  
         WHEN 'R' THEN 'Road'  
         WHEN 'M' THEN 'Mountain'  
         WHEN 'T' THEN 'Touring'  
         WHEN 'S' THEN 'Other sale items'  
         ELSE 'Not for sale'  
      END,  
   Name  
FROM Production.Product  
ORDER BY ProductNumber;  
GO

SELECT * FROM Production.Product


USE AdventureWorks2012;  
GO  
SELECT   ProductNumber, Name, "PriceRange" =   
      CASE   
         WHEN ListPrice =  0 THEN 'Mfg item - not for resale'  
         WHEN ListPrice < 50 THEN 'Under $50'  
         WHEN ListPrice >= 50 and ListPrice < 250 THEN 'Under $250'  
         WHEN ListPrice >= 250 and ListPrice < 1000 THEN 'Under $1000'  
         ELSE 'Over $1000'  
      END  
FROM Production.Product  
ORDER BY ProductNumber ;  
GO  

USE AdventureWorks2012;  
GO  
UPDATE HumanResources.Employee  
SET VacationHours =   
    ( CASE  
         WHEN ((VacationHours - 10.00) < 0) THEN VacationHours + 40  
         ELSE (VacationHours + 20.00)  
       END  
    )  
OUTPUT Deleted.BusinessEntityID, Deleted.VacationHours AS BeforeValue,   
       Inserted.VacationHours AS AfterValue  
WHERE SalariedFlag = 0;

------ WHILE LOOP

DECLARE @VAR INT
SET @VAR = 1
WHILE(@VAR<=10)
BEGIN
	PRINT 'THIS IS OUR COUNTER '+CAST(@VAR AS VARCHAR)
	SET @VAR+=1
END



USE AdventureWorks2012;  
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
PRINT 'Too much for the market to bear';

