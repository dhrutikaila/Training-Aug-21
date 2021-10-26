--JOINS

--JOIN GIVES Functionality of Combining two tables data
--Join uses seam to match data across table where seam is a column with unique value in both present in both table

--types of join
--Inner join
--Left outer join
--Right outer join
--Full outer join
--Cross join
--SELF JOIN

--inner Join =>  returns only the matched rows will be returned
--

USE AdventureWorks2019

SELECT pc.Name,ps.Name
FROM Production.ProductCategory AS pc
	INNER JOIN Production.ProductSubcategory AS ps  ON pc.ProductCategoryID = ps.ProductCategoryID


SELECT pc.Name AS category
	,ps.Name AS SubCategory
FROM Production.ProductCategory AS pc
	INNER JOIN Production.ProductSubcategory AS ps  ON pc.ProductCategoryID = ps.ProductCategoryID
GROUP BY ROLLUP(pc.Name,ps.Name)
HAVING pc.Name IS NOT NULL AND ps.Name IS NOT NULL;

 
SELECT ProductID,v.BusinessEntityID,v.Name
FROM Purchasing.ProductVendor AS pv
	INNER JOIN Purchasing.Vendor AS v
		ON pv.BusinessEntityID = v.BusinessEntityID
WHERE pv.StandardPrice > $20
	AND v.Name LIKE 'F%'

--Equi join 
--those join which used = operator to perfrom join are also called Equi join
--Theta Join
--when join are performed using operator or conditionls other than = are called theta join or Non-Equi join

SELECT * FROM Person.Person WHERE BusinessEntityID < 10
SELECT * FROM Person.Address WHERE AddressID < 10
SELECT * FROM Person.StateProvince
SELECT * FROM Person.CountryRegion

SELECT p.BusinessEntityID
	,p.FirstName + ' ' + p.LastName AS Name
	,a.AddressLine1
	,a.City
	,sp.Name AS State
	,cr.Name AS Country
FROM Person.Person AS p
	INNER JOIN Person.Address AS a 
		ON p.BusinessEntityID = a.AddressID
	INNER JOIN Person.StateProvince AS sp
		ON sp.StateProvinceID = a.StateProvinceID
	INNER JOIN Person.CountryRegion as cr
		ON sp.CountryRegionCode = cr.CountryRegionCode


--GROUP BY with innner join

SELECT cr.Name AS Country
	,sp.Name AS State
FROM Person.StateProvince AS sp
	INNER JOIN Person.CountryRegion AS cr
		ON sp.CountryRegionCode = cr.CountryRegionCode
GROUP BY cr.Name,sp.Name

SELECT cr.Name AS Country
	,sp.Name AS State
FROM Person.StateProvince AS sp
	INNER JOIN Person.CountryRegion AS cr
		ON sp.CountryRegionCode = cr.CountryRegionCode
GROUP BY ROLLUP(cr.Name,sp.Name)
HAVING sp.Name IS NOT NULL



--OUTER JOIN
--there three types of outer join
--RIGHT JOINN
--LEFT JOIN
--FULL JOIN

--FULL OUTER JOIN
--In SQL Full Outer Join, all rows from both the tables are included. If there are any unmatched rows, it shows NULL values for them.

SELECT * FROM Person.StateProvince
SELECT * FROM Person.CountryRegion

SELECT sp.StateProvinceID 
	,CAST(sp.Name AS varchar(20)) 
	,cr.Name
FROM Person.StateProvince AS sp
	FULL OUTER JOIN Person.CountryRegion AS cr ON sp.CountryRegionCode = cr.CountryRegionCode

SELECT sp.StateProvinceID 
	,CAST(sp.Name AS varchar(20)) 
	,cr.Name
FROM Person.StateProvince AS sp
	RIGHT OUTER JOIN Person.CountryRegion AS cr ON sp.CountryRegionCode = cr.CountryRegionCode

SELECT sp.StateProvinceID 
	,CAST(sp.Name AS varchar(20)) 
	,cr.Name
FROM Person.StateProvince AS sp
	LEFT OUTER JOIN Person.CountryRegion AS cr ON sp.CountryRegionCode = cr.CountryRegionCode

USE SampleTable

CREATE TABLE Meals(MealName VARCHAR(100))
CREATE TABLE Drinks(DrinkName VARCHAR(100))
INSERT INTO Drinks
VALUES('Orange Juice'), ('Tea'), ('Cofee')
INSERT INTO Meals
VALUES('Omlet'), ('Fried Egg'), ('Sausage')
SELECT *
FROM Meals;
SELECT *
FROM Drinks

--CROSS JOIN
SELECT * FROM Meals
CROSS JOIN Drinks

SELECT	e.FirstName
	,i.IncentiveAmount
FROM Employees AS e
CROSS JOIN Incentive AS i