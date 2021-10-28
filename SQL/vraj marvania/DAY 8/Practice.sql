--Creating Indexes in SQL Server
--To create an index, use the create index command that has the following system.
--create [unique][clustered /non clusted] index :
--By default an index is non-clustered.

-- CREATE INDEX

 --CREATE INDEX statement to create a nonclustered index for one column example

	CREATE INDEX BNo 
	ON HumanResources.Employee(BusinessEntityID) 

	SELECT * FROM Employees WHERE Name like 'v%'  

 --CREATE INDEX statement to create a nonclustered index for multiple columns example
--Composite Indexes

	SELECT * FROM Employees WHERE Name like 'v%' AND EmployeeID=1 

	CREATE INDEX Eno 
	ON Employees(EmployeeID,Name) 

--DROP INDEX

--SQL Server DROP INDEX statement overview

	DROP INDEX Eno ON Employees;

--DROP INDEX to remove multiple indexes example

	DROP INDEX Eno ON Employees,
			   Cno ON Employees

--ALTER INDEX

--Altering an Index
	ALTER INDEX DNOiDX 
	ON EMp REBUILD 

--Ex:-
SELECT * FROM Employees WHERE Name like 'v%'

sp_helpindex 'EmployeeS'

	
CREATE INDEX Eno ON Employees(EmployeeID,Name) 

sp_helpindex 'EmployeeS'

SELECT * FROM Employees WHERE Name like 'v%'




--clustered index
USE AdventureWorks2012;  
GO  
-- Create a new table with three columns.  
CREATE TABLE dbo.TestTable  
    (TestCol1 int NOT NULL,  
     TestCol2 nchar(10) NULL,  
     TestCol3 nvarchar(50) NULL);  
GO  
-- Create a clustered index called IX_TestTable_TestCol1  
-- on the dbo.TestTable table using the TestCol1 column.  
CREATE CLUSTERED INDEX IX_TestTable_TestCol1   
    ON dbo.TestTable (TestCol1);   
GO  

	sp_helpindex 'dbo.TestTable'


--nonclustered index
USE AdventureWorks2012;  
GO  
-- Find an existing index named IX_ProductVendor_VendorID and delete it if found.   
IF EXISTS (SELECT name FROM sys.indexes  
            WHERE name = N'IX_ProductVendor_VendorID')   
    DROP INDEX IX_ProductVendor_VendorID ON Purchasing.ProductVendor;   
GO  
-- Create a nonclustered index called IX_ProductVendor_VendorID   
-- on the Purchasing.ProductVendor table using the BusinessEntityID column.   
CREATE NONCLUSTERED INDEX IX_ProductVendor_VendorID   
    ON Purchasing.ProductVendor (BusinessEntityID);   
GO  


	sp_helpindex 'dbo.TestTable'


