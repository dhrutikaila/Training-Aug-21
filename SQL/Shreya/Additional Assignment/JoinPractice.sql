SELECT * FROM Person.Person

SELECT * FROM HumanResources.Employee

SELECT   emp.BusinessEntityID , P.FirstName , P.LastName 
FROM HumanResources.Employee AS emp RIGHT join
Person.Person as P ON  emp.BusinessEntityID = P.BusinessEntityID
WHERE emp.BusinessEntityID IS NULL
ORDER BY BusinessEntityID ASC



SELECT * FROM Production.ProductCategory
SELECT * FROM Production.ProductSubcategory
 

SELECT PC.ProductCategoryID AS 'CATEGORY ID',
	   PS.ProductCategoryID AS 'PS_CATEGORYID',
       pc.Name AS 'CATEGORY NAME',
	   PS.Name AS 'SUBCATEGORY NAME'
FROM Production.ProductCategory AS pc
JOIN Production.ProductSubcategory AS ps ON 
pc.ProductCategoryID=ps.ProductCategoryID
--WHERE PC.Name='BIKES'

SELECT lhs.BusinessEntityID,rhs.BusinessEntityID,lhs.HireDate
FROM HumanResources.Employee lhs
INNER JOIN HumanResources.Employee rhs 
ON lhs.HireDate=rhs.HireDate 
WHERE lhs.BusinessEntityID < rhs.BusinessEntityID


SELECT P.Name,E.HireDate AS 'PRODUCTION DATE'
FROM Production.Product P,
	 HumanResources.Employee E

