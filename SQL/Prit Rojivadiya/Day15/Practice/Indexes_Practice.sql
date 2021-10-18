USE AdventureWorks2012


-- Clustered index

CREATE TABLE #temp
(
Id int,
FirstName varchar(20),
Age int
)

INSERT INTO #temp VALUES (1,'Prit',21),(2,'Man',17),(3,'Tirth',12),(4,'Krusha',18),(5,'Raj',21)

CREATE CLUSTERED INDEX IX_age
ON #temp(Age ASC)

SELECT * FROM #temp

DROP TABLE #temp



-- Non Clustered Index


CREATE TABLE #temp
(
Id int,
FirstName varchar(20),
Age int
)

INSERT INTO #temp VALUES (1,'Prit',21),(2,'Man',17),(3,'Tirth',12),(4,'Krusha',18)

CREATE NONCLUSTERED INDEX IX_age
ON #temp(Id DESC)
INCLUDE (FirstName,Age)

SELECT * FROM #temp
SELECT FirstName FROM #temp

DROP TABLE #temp



-- Unique index

USE AdventureWorks2012;  
GO  

IF EXISTS (SELECT name from sys.indexes  
           WHERE name = N'AK_UnitMeasure_Name'
           AND object_id = OBJECT_ID(N'Production.UnitMeasure', N'U'))   
   DROP INDEX AK_UnitMeasure_Name ON Production.UnitMeasure;   
GO  

CREATE UNIQUE INDEX AK_UnitMeasure_Name   
   ON Production.UnitMeasure (Name);   
GO

SELECT * FROM Production.UnitMeasure
INSERT INTO Production.UnitMeasure VALUES ('PC1','Piece','2008-04-30 00:00:00.000')
