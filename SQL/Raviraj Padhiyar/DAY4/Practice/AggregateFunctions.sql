--Aggregate Functions

--SUM/COUNT/AVG/MAX/MIN

--SUM()
--Syntax:
-- Aggregate Function Syntax    
--SUM ( [ ALL | DISTINCT ] expression )  

-- Analytic Function Syntax   
--SUM ([ ALL ] expression) OVER ( [ partition_by_clause ] order_by_clause)

--returns number value of data type [int(types),bigint,decemials,money,flaot]

SELECT * FROM Production.Product

SELECT Color
	,SUM(ListPrice)
	,ROUND(SUM(StandardCost),2)
FROM Production.Product
WHERE Color IS NOT NULL AND Color IN ('Black','Silver','White')
GROUP BY Color

SELECT * FROM Sales.SalesPerson

SELECT BusinessEntityID
	,TerritoryID
	,SUM(SalesYTD) OVER ( ORDER BY DATEPART(yy,modifiedDate) ) AS total
FROM Sales.SalesPerson

--COUNT()
--syntax
-- Aggregation Function Syntax  
--COUNT ( { [ [ ALL | DISTINCT ] expression ] | * } )  

-- Analytic Function Syntax  
--COUNT ( [ ALL ]  { expression | * } ) OVER ( [ <partition_by_clause> ] )

--returns int

--number of rows in sales.salesPerson

SELECT COUNT(*) AS perons FROM Sales.SalesPerson

SELECT * FROM HumanResources.Employee

SELECT COUNT( JobTitle )
FROM HumanResources.Employee


SELECT COUNT( DISTINCT JobTitle )
FROM HumanResources.Employee

SELECT COUNT(*) AS totalEmployees
	,AVG(VacationHours) AS totalHoursLeft
FROM HumanResources.Employee

SELECT JobTitle
	,COUNT( VacationHours )  AS VacHours
FROM HumanResources.Employee
GROUP BY JobTitle


SELECT DISTINCT JobTitle
	,COUNT( VacationHours ) OVER (PARTITION BY JobTitle)  AS VacHours
FROM HumanResources.Employee

--using aggregate function as a condition

SELECT DISTINCT JobTitle
	,COUNT( VacationHours ) OVER (PARTITION BY JobTitle)  AS VacHours
FROM HumanResources.Employee
HAVING COUNT( VacationHours ) > 3

--AVG() 
--syntax;
--AVG ( [ ALL | DISTINCT ] expression )  
   --[ OVER ( [ partition_by_clause ] order_by_clause ) ]
--return range of numbers data types same as count

SELECT AVG(VacationHours) AS 'Avg vac hours'
	,SUM(VacationHours) AS 'total vac hours'
FROM HumanResources.Employee

SELECT JobTitle
	,AVG(VacationHours) AS 'Avg vac hours'
	,SUM(VacationHours) AS 'total vac hours'
FROM HumanResources.Employee
GROUP BY JobTitle

SELECT * FROM HumanResources.Employee



--MAX() function

-- Aggregation Function Syntax  
--MAX( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax  
--MAX ([ ALL ] expression) OVER ( <partition_by_clause> [ <order_by_clause> ] )  

--returns same as expression

SELECT * FROM  Production.Product

SELECT Name
	,MAX( StandardCost )
FROM Production.Product
GROUP BY Name

SELECT DISTINCT Name
	,MAX(StandardCost) OVER (PARTITION BY Color) AS MaxCost
FROM Production.Product
WHERE Color IS NOT NULL

SELECT DISTINCT Name
	,Color
	,MAX(StandardCost) OVER (PARTITION BY Color ORDER BY StandardCost DESC) AS MaxCost
FROM Production.Product
WHERE Color IS NOT NULL


--max on sting expression
SELECT MAX(Name) 
FROM Production.Product


--min function
--syntax:
-- Aggregation Function Syntax  
--MIN ( [ ALL | DISTINCT ] expression )  
  
-- Analytic Function Syntax   
--MIN ( [ ALL ] expression ) OVER ( [ <partition_by_clause> ] [ <order_by_clause> ] )
--returns same as expession

SELECT MIN(StandardCost)
FROM Production.Product
WHERE StandardCost > 0

SELECT DISTINCT Color
	,MIN(StandardCost) OVER ( PARTITION BY Color ) AS MinCost
FROM Production.Product
WHERE StandardCost > 0
	AND Color IS NOT NULL
ORDER BY MinCost DESC

SELECT DISTINCT MIN(StandardCost)
FROM Production.Product
WHERE Color IN ('BLACK','White') AND StandardCost > 0
