use AdventureWorks2012



SELECT pc.Name as 'Category_Name',
	   ps.Name as 'SubCategory_Name',
	   pc.ProductCategoryID as 'PC-categoryId',
	   ps.ProductCategoryID as 'PS-subcategoryId'
FROM Production.ProductCategory AS pc
	INNER JOIN Production.ProductSubcategory AS ps ON pc.ProductCategoryId = ps.ProductcategoryId 




SELECT pc.Name as 'Category_Name',
	   ps.Name as 'SubCategory_Name'
FROM Production.ProductCategory AS pc
	LEFT OUTER JOIN Production.ProductSubcategory AS ps ON pc.ProductCategoryId = ps.ProductcategoryId 




SELECT pc.Name as 'Category_Name',
	   ps.Name as 'SubCategory_Name'
FROM Production.ProductCategory AS pc
	RIGHT OUTER JOIN Production.ProductSubcategory AS ps ON pc.ProductCategoryId = ps.ProductcategoryId 



SELECT lhs.BusinessEntityID,
		lhs.HireDate,
		rhs.BusinessEntityID	
FROM HumanResources.Employee as lhs
	JOIN HumanResources.Employee as rhs ON lhs.HireDate = rhs.HireDate
								AND lhs.BusinessEntityID < rhs.BusinessEntityID




SELECT e.HireDate,
		p.Name
FROM HumanResources.Employee as e,
	Production.Product as p