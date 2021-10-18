USE PracticeExercise

-- Partitioned view : partitioned view use to create view that consist partitioning table and each table have one column that partition that table from other table.
					--Column use to partition tables declare as primary key along with primary key of that table.

-- Creating Table 4

CREATE TABLE Shipments_Q1 (
Ship_Num INT NOT NULL,
Ship_CountryCode C HAR(3) NOT NULL,
Ship_Date DATETIME NULL,
Ship_Quarter SMALLINT NOT NULL CONSTRAINT CK_Ship_Q1 CHECK (Ship_Quarter = 1),
CONSTRAINT PK_Shipments_Q1 PRIMARY KEY (Ship_Num, Ship_Quarter)
);
 
GO
CREATE TABLE Shipments_Q2 (
Ship_Num INT NOT NULL,
Ship_CountryCode CHAR(3) NOT NULL,
Ship_Date DATETIME NULL,
Ship_Quarter SMALLINT NOT NULL CONSTRAINT CK_Ship_Q2 CHECK (Ship_Quarter = 2),
CONSTRAINT PK_Shipments_Q2 PRIMARY KEY (Ship_Num, Ship_Quarter)
);
 
 GO
CREATE TABLE Shipments_Q3 (
Ship_Num INT NOT NULL,
Ship_CountryCode CHAR(3) NOT NULL,
Ship_Date DATETIME NULL,
Ship_Quarter SMALLINT NOT NULL CONSTRAINT CK_Ship_Q3 CHECK (Ship_Quarter = 3),
CONSTRAINT PK_Shipments_Q3 PRIMARY KEY (Ship_Num, Ship_Quarter)
);
 
GO
CREATE TABLE Shipments_Q4 (
Ship_Num INT NOT NULL,
Ship_CountryCode CHAR(3) NOT NULL,
Ship_Date DATETIME NULL,
Ship_Quarter SMALLINT NOT NULL CONSTRAINT CK_Ship_Q4 CHECK (Ship_Quarter = 4),
CONSTRAINT PK_Shipments_Q4 PRIMARY KEY (Ship_Num, Ship_Quarter)
);
GO


-- Creating view

CREATE VIEW partitonview1 WITH SCHEMABINDING
AS
SELECT Ship_Num ,Ship_CountryCode,Ship_Date,Ship_Quarter FROM dbo.Shipments_Q1
UNION ALL
SELECT Ship_Num ,Ship_CountryCode,Ship_Date,Ship_Quarter FROM dbo.Shipments_Q2 
UNION ALL
SELECT Ship_Num ,Ship_CountryCode,Ship_Date,Ship_Quarter FROM dbo.Shipments_Q3 
UNION ALL
SELECT Ship_Num ,Ship_CountryCode,Ship_Date,Ship_Quarter FROM dbo.Shipments_Q4 
GO

-- inserting data in view

INSERT INTO partitonview1 VALUES (1,'IN',GETDATE(),1),
								(1,'IN',GETDATE(),2),
								(1,'US',GETDATE(),4),
								(1,'IN',GETDATE(),3),
								(2,'SA',GETDATE(),3),
								(2,'UK',GETDATE(),2),
								(2,'IN',GETDATE(),1),
								(2,'IN',GETDATE(),4),
								(3,'UK',GETDATE(),2),
								(3,'US',GETDATE(),1);



SELECT * FROM partitonview1 WHERE Ship_Quarter=3
SELECT * FROM partitonview1 WHERE Ship_Quarter=1
SELECT * FROM partitonview1 WHERE Ship_Quarter=2
SELECT * FROM partitonview1 WHERE Ship_Quarter=4
GO




-- Recursive CTE : Recursive CTE means a repeatedly execute of Select Statement of CTE untill query setisfied condition.
			--	UNION ALL with CTE it self

DECLARE @no int= 10;

WITH cte As
(
	SELECT @no as Number
	UNION ALL
	SELECT Number-1
	FROM cte
	WHERE Number > 0
)
SELECT * FROM Employee



-- multiple CTE : In Multiple CTE we create more than one CTE in single 'WITH' Statement. 
			-- Just as concept


WITH 
cte1 AS
(SELECT '1' CTEType , EMPLOYEE_ID, FIRST_NAME FROm Employee ), 

cte2 AS
(SELECT '2' CTEType,EMPLOYEE_ID, LAST_NAME FROm Employee )
SELECT * FROM cte1
UNION ALL
SELECT * FROM cte2
