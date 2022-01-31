CREATE DATABASE Practice

USE Practice

--DATATYPES

--Exact numerics
--1.TINYINT 
--2.SMALLINT 
--3.INT 
--4.BIGINT
--5.DECIMAL(P,S)
--6.NUMERIC(P,S)
--7.SAMLLMONEY
--8.MONEY
--9.BIT

--Approximate numerics
--1.FLOAT
--2.REAL

--Date and time
--1.DATE
--2.TIME
--3.SMALLDATETIME
--4.DATETIME
--5.DATETIME2
--6.DATETIMEOFFSET


--Character Strings
--1.CHAR
--2.VARCHAR
--3.TEXT

--Unicode character strings
--1.NCHAR
--2.NVARCHAR
--3.NTEXT

--Binary strings
--1.BINARY
--2.VARBINARY
--3.IMAGE

--Data Integrity

--Entity Integrity(Primary Key,Composite Primary Key,Unique)

CREATE TABLE Demo
(
Id INT CONSTRAINT Demo_Id_Pk PRIMARY KEY IDENTITY(1,1),
[Name] VARCHAR(50) CONSTRAINT Demo_name_Unique UNIQUE
)

INSERT INTO Demo VALUES ('John'),('Steven')
INSERT INTO Demo VALUES ('John')

CREATE TABLE Demo2
(
Id INT,
[Name] VARCHAR(50) CONSTRAINT Demo2_name_Unique UNIQUE,
CONSTRAINT Demo2_Id_Name_CompositePk PRIMARY KEY(Id,Name)
)

ALTER TABLE Demo2 DROP CONSTRAINT Demo2_name_Unique

INSERT INTO Demo2 VALUES (1,'John'),(2,'Steven')
INSERT INTO Demo2 VALUES (3,'John')
INSERT INTO Demo2 VALUES (3,'John')


--Referential Integrity(Foreign Key)

CREATE TABLE Demo3
(
Id INT,
RefId INT CONSTRAINT Demo3_RefId_Fk FOREIGN KEY REFERENCES Demo(Id)
)
INSERT INTO Demo3 VALUES (1,1)
INSERT INTO Demo3 VALUES (2,2)
INSERT INTO Demo3 VALUES (3,3)

--Domain Integrity(Check,Default,Not Null)

CREATE TABLE Demo4
(
Id INT CONSTRAINT Demo4_Id_Pk PRIMARY KEY IDENTITY(1,1),
[Name] VARCHAR(50) CONSTRAINT Demo4_Name_NotNull NOT NULL,
City VARCHAR(20) CONSTRAINT Demo4_City_Chk CHECK (City IN ('Ahmedabad','Gandhinagar')),
[State] VARCHAR(20) CONSTRAINT Demo4_State_Chk CHECK (State LIKE 'Guj%'),
Age TINYINT CONSTRAINT Demo4_Age_Chk CHECK (Age BETWEEN 18 AND 45),
IsMarried BIT CONSTRAINT Demo4_IsMarried_Def DEFAULT 0
)

INSERT INTO Demo4 (Name,City,State,Age) VALUES ('John','Ahmedabad','Gujarat',20),('Smith','Ahmedabad','Gujrat',25)
INSERT INTO Demo4 VALUES ('John','Ahmedabad','Gujarat',20,1)
INSERT INTO Demo4 (Name,City,State,Age) VALUES ('John','Anand','Gujarat',20)
--User-defined Integrity

--Create/Alter/Drop

CREATE DATABASE Practice

CREATE TABLE Demo5
(
Id INT CONSTRAINT Demo5_Id_Pk PRIMARY KEY IDENTITY(1,1),
[Value] VARCHAR(50)
)


ALTER TABLE Demo5 ADD Name VARCHAR(50)

ALTER TABLE Demo5 ALTER COLUMN  Name VARCHAR(60)

ALTER TABLE Demo5 DROP COLUMN Name

ALTER TABLE Demo5 ADD CONSTRAINT Demo5_Value_Def DEFAULT 0 FOR Value


DROP TABLE Demo5
DROP DATABASE Practice