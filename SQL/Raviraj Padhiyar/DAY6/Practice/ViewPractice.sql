--views
--create view using tsql

CREATE VIEW HumanResources.EmployeeHireDate  
AS
(SELECT p.FirstName,p.LastName,e.HireDate
FROM HumanResources.Employee e JOIN Person.Person p
ON e.BusinessEntityID = p.BusinessEntityID)

SELECT FirstName,LastName,HireDate 
FROM HumanResources.EmployeeHireDate


CREATE VIEW hiredate_view
AS
SELECT p.FirstName
	,p.LastName
	,e.BusinessEntityID
	,e.HireDate
FROM HumanResources.Employee e 
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID


--

CREATE VIEW HumanResources.EmployeeRecors
AS
	SELECT *
	FROM HumanResources.Employee

SELECT * FROM HumanResources.EmployeeRecors


CREATE VIEW EmployeeRecords
AS
SELECT NationalIDNumber,LoginID,JobTitle
FROM HumanResources.Employee

SELECT * FROM EmployeeRecords

DROP VIEW EmployeeRecords

--filter out results

CREATE VIEW EmployeeRecords
AS
SELECT NationalIDNumber
	,LoginID
	,JobTitle
	,MaritalStatus
FROM HumanResources.Employee
WHERE MaritalStatus = 'M'

SELECT * FROM EmployeeRecords

DROP VIEW EmployeeRecords

--fetch records with multiple table

CREATE VIEW Sales.vStoreWithContacts2
AS
SELECT s.BusinessEntityID
	,s.Name
	,ct.Name AS ContatctType
	,p.Title
	,p.FirstName
	,p.Lastname
	,p.suffix
	,pp.PhoneNumber
	,ea.EmailAddress
	,p.EmailPromotion
FROM Sales.Store s
	INNER JOIN Person.BusinessEntityContact bec ON bec.businessEntityID = s.BusinessEntityID
	INNER JOIN Person.ContactType ct ON ct.ContactTypeID = bec.ContactTypeID
	INNER JOIN Person.Person p ON p.businessEntityID = bec.PersonID
	LEFT OUTER JOIN Person.EmailAddress ea ON ea.BusinessEntityID = p.BusinessEntityID
	LEFT OUTER JOIN Person.PersonPhone pp ON pp.BusinessEntityID = p.BusinessEntityID



SELECT * FROM Sales.vStoreWithContacts2


SELECT Name,ContatctType FROM Sales.vStoreWithContacts2


--schemabinding 

CREATE TABLE myTable (
name VARCHAR(10),
PhoneNumber BIGINT
)

INSERT INTO myTable 
VALUES ('raviraj',9265914306)
	  ,('sagar',9265914309)

CREATE VIEW DemoView
WITH SCHEMABINDING 
AS
	SELECT name,PhoneNumber FROM dbo.myTable

UPDATE dbo.myTable
SET name = 'ravi'
WHERE name = 'raviraj'

DROP VIEW DemoView
DROP TABLE dbo.myTable


--encryption

CREATE TABLE myTable (
name VARCHAR(10),
PhoneNumber BIGINT
)


INSERT INTO myTable 
VALUES ('raviraj',9265914306)
	  ,('sagar',9265914309)

SELECT * FROM myTable

CREATE VIEW DemoView
WITH ENCRYPTION
AS 
SELECT Name
FROM myTable

SELECT * FROM DemoView

sp_helptext 'DemoView' --The text for object 'DemoView' is encrypted.


DROP View DemoView

--sql views with DML UPDATE DELETE INSERT

CREATE VIEW DemoView
AS 
SELECT Name
FROM myTable

--insert
INSERT INTO DemoView values ('Yuvraj')

SELECT * FROM DemoView

SELECT * FROM myTable

--UPDATE
UPDATE DemoView
SET name = 'yashraj'
WHERE name =  'Yuvraj'

SELECT * FROM DemoView

SELECT * FROM myTable

--DELETE


DELETE FROM DemoView WHERE name = 'yashraj'

SELECT * FROM DemoView

SELECT * FROM myTable


--ALTER SQL VIEW

ALTER VIEW DemoView
AS
SELECT * FROM myTable


