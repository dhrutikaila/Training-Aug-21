USE AdventureWorks2019

SELECT * FROM SYS.tables 

SELECT * FROM HumanResources.Employee

SELECT * FROM HumanResources.Department

SELECT * FROM Person.Person

SELECT * FROM HumanResources.EmployeeDepartmentHistory

--- INNER JOIN


SELECT CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
	, D.GroupName
FROM Person.Person AS P
JOIN HumanResources.EmployeeDepartmentHistory ED
ON ED.BusinessEntityID = P.BusinessEntityID
JOIN HumanResources.Department AS D 
ON ED.DepartmentID = D.DepartmentID
WHERE P.BusinessEntityID < 10


--- OUTER JOIN

--- LEFT

SELECT CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
	, D.GroupName
FROM Person.Person AS P
LEFT JOIN HumanResources.EmployeeDepartmentHistory ED
ON ED.BusinessEntityID = P.BusinessEntityID
LEFT JOIN HumanResources.Department AS D 
ON ED.DepartmentID = D.DepartmentID

--- RIGHT

SELECT CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
	, D.GroupName
FROM Person.Person AS P
RIGHT JOIN HumanResources.EmployeeDepartmentHistory ED
ON ED.BusinessEntityID = P.BusinessEntityID
RIGHT JOIN HumanResources.Department AS D 
ON ED.DepartmentID = D.DepartmentID


--- OUTER

SELECT CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
	, D.GroupName
FROM Person.Person AS P
FULL OUTER JOIN HumanResources.EmployeeDepartmentHistory ED
ON ED.BusinessEntityID = P.BusinessEntityID
FULL OUTER JOIN HumanResources.Department AS D 
ON ED.DepartmentID = D.DepartmentID

--- CROSS

SELECT Dept.Name
	, Dept.GroupName
	, EDH.StartDate
FROM HumanResources.Department AS Dept
CROSS JOIN HumanResources.EmployeeDepartmentHistory AS EDH

SELECT D1.GroupName
	, D2.GroupName
FROM HumanResources.Department AS D1
CROSS JOIN HumanResources.Department AS D2


--- SELF JOIN 

SELECT EDH1.BusinessEntityID,EDH1.DepartmentID
FROM HumanResources.EmployeeDepartmentHistory AS EDH1
JOIN  HumanResources.EmployeeDepartmentHistory AS EDH2
ON EDH1.DepartmentID = EDH2.BusinessEntityID


SELECT EDH1.BusinessEntityID,EDH1.DepartmentID
FROM HumanResources.EmployeeDepartmentHistory AS EDH1
	, HumanResources.EmployeeDepartmentHistory AS EDH2
WHERE EDH1.DepartmentID = EDH2.BusinessEntityID
