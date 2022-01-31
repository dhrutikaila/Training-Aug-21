/*
As a database administrator, you need to increase the performance of the PlanetsID table, so
you decide to create a clustered index. But instead of using SSMS, you decide to use queries
to perform this task. Therefore, you create a new PlanetsID database using the following
commands within SMMS:
*/


USE [AdventureWorks2012]
GO
CREATE TABLE [dbo].[PlanetsID](
[ID] [int] NOT NULL,
[Item] [int] NOT NULL,
[Value] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT INTO PlanetsID VALUES (4, 23, 66)
INSERT INTO PlanetsID VALUES (1, 12, 59)
INSERT INTO PlanetsID VALUES (3, 66, 24)
GO

SELECT * FROM PlanetsID

CREATE CLUSTERED INDEX IX_PlanetId
ON PlanetsID(ID ASC)

INSERT INTO PlanetsID VALUES (2, 26, 55)

SELECT * FROM PlanetsID