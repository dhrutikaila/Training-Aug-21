use AdventureWorks2012
-->Create a SQL VIEW
		CREATE VIEW EmployeeRecords1
		AS
			 SELECT *
			 FROM [HumanResources].[Employee]

-->SQL VIEW to fetch a few columns of a table
		CREATE VIEW EmployeeRecordse1
		AS
			 SELECT NationalIDNumber,LoginID,JobTitle 
			 FROM [HumanResources].[Employee]

-->SQL VIEW to fetch a few columns of a table and filter results using WHERE clause
		CREATE VIEW EmployeeRecordse2
		AS
			 SELECT NationalIDNumber, 
					LoginID, 
					JobTitle, 
					MaritalStatus
			 FROM [HumanResources].[Employee]
			 WHERE MaritalStatus = 'M'

-->sp_refreshview to update the Metadata of a SQL VIEW
			CREATE VIEW DemoViewnew
			AS
				   SELECT top(10) NationalIDNumber,LoginID,JobTitle 
				   FROM [HumanResources].[Employee]
			-->alter a table add new column
			Alter Table [HumanResources].[Employee] Add City nvarchar(50)

			--!! By Default, SQL Server does not modify the schema and metadata for the VIEW. We can use the system stored  procedure sp_refreshview to refresh the metadata of any view.

			Exec sp_refreshview DemoViewnew

 -->Schema Binding a SQL VIEW
			--Names must be in a two-part format, and an object cannot reference itself.
			--We need to drop the VIEW definition itself along with other dependencies on that table before making a change to the existing table schema.


			 CREATE VIEW DemoView33
			 WITH SCHEMABINDING
			 AS
				 SELECT top(10) NationalIDNumber,LoginID,JobTitle 
				 FROM [HumanResources].[Employee]

			 --error  alter
			 ALTER TABLE [HumanResources].[Employee] ALTER COLUMN LoginID BIGINT

--> SQL VIEW ENCRYPTION
			CREATE VIEW DemoView24
			WITH ENCRYPTION
			AS
				  SELECT top(10) NationalIDNumber,LoginID,JobTitle 
				 FROM [HumanResources].[Employee]

		   Exec sp_helptext DemoView24

		   select * from DemoView24
   -->SQL VIEW for DML (Update, Delete and Insert) queries
			--->Insert DML

				Insert into DemoView24(NationalIDNumber,LoginID,JobTitle) values(295847284,'adventure-works\ken0','Chief Executive Officer')
			-->Delete DML

				Delete from DemoView24 where NationalIDNumber=295847284
			-->Update DML
				Update DemoView24 set JobTitle='er' where NationalIDNumber=295847284


 -->SQL VIEW and Check Option
  -->It prevents to insert rows in the table where the condition in the Where clause is not satisfied
  -->If the condition does not satisfy, we get an error message in the insert or update statement
		  CREATE VIEW DemoView
		  AS
			 SELECT *
			 FROM [dbo].[MyTable]
			 WHERE [Codeone] LIKE 'F%'
		  WITH CHECK OPTION

		  Insert into DemoView values (5,'CC','Raj','Raj')
		  --error

-->Drop SQL VIEW
	     DROP VIEW demoview

-->Alter a SQL VIEW
		 Alter VIEW DemoView
		 AS
		 SELECT *
		 FROM [dbo].[MyTable]
		 WHERE [Codeone] LIKE 'C%'
		 WITH CHECK OPTION


--->Subqueries

USE AdventureWorks2012
GO
SELECT Ord.SalesOrderID, Ord.OrderDate,
    (SELECT MAX(OrdDet.UnitPrice)
     FROM Sales.SalesOrderDetail AS OrdDet
     WHERE Ord.SalesOrderID = OrdDet.SalesOrderID) AS MaxUnitPrice
FROM Sales.SalesOrderHeader AS Ord


USE AdventureWorks2012
GO
SELECT [Name]
FROM Sales.Store
WHERE BusinessEntityID NOT IN
    (SELECT CustomerID
     FROM Sales.Customer
     WHERE TerritoryID = 5)
GO

--Multiple levels of nesting

SELECT LastName, FirstName
FROM Person.Person
WHERE BusinessEntityID IN
    (SELECT BusinessEntityID
     FROM HumanResources.Employee
     WHERE BusinessEntityID IN
        (SELECT BusinessEntityID
         FROM Sales.SalesPerson)
    )

--Correlated subqueries

SELECT DISTINCT c.LastName, c.FirstName, e.BusinessEntityID 
FROM Person.Person AS c JOIN HumanResources.Employee AS e
ON e.BusinessEntityID = c.BusinessEntityID 
WHERE 5000.00 IN
    (SELECT Bonus
    FROM Sales.SalesPerson sp
    WHERE e.BusinessEntityID = sp.BusinessEntityID) 



SELECT StateProvinceID, AddressID
FROM Person.Address
WHERE AddressID IN
    (SELECT AddressID
     FROM Person.Address
     WHERE StateProvinceID = 39)
