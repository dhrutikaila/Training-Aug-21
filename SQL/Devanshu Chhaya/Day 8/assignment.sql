
/*As a database administrator, you need to increase the performance of the PlanetsID table, so
you decide to create a clustered index. But instead of using SSMS, you decide to use queries
to perform this task. Therefore, you create a new PlanetsID database using the following
commands within SMMS:
IF EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N’[dbo] . [PlanetsID]
AND type in (N’U’))

USE AdventureWorks2008
DROP TABLE [dbo].[PlanetsID]
GO
USE [AdventureWorks2008]
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
SELECT * FROM PlanetID
GO
You should now see the following output in the results pane (below the Query Editor
Window):
ID Item Value
4 23 66
1 12 59
3 66 24
Now that you have a database with data, what steps would you use to create a clustered index
based on the ID column?*/


CREATE TABLE PlanetsID
(
Id INT CONSTRAINT PlanetsID_Id_NotNull NOT NULL,
Item INT CONSTRAINT PlanetsID_Item_NotNull NOT NULL,
Value INT CONSTRAINT PlanetsID_Value_NotNull NOT NULL
)

INSERT INTO PlanetsID VALUES (4, 23, 66),(1, 12, 59),(3, 66, 24)

CREATE CLUSTERED INDEX PlntIdIndex
ON PlanetsID(Id)

SELECT * FROM PlanetsID WHERE Id=3