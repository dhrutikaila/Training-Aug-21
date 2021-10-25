------------------Clustered Indexes-------------------------
USE TEST



--Indexes are automatically created when PRIMARY KEY and UNIQUE constraints are defined on table columns. 
--If you configure a PRIMARY KEY, Database Engine automatically creates a clustered index, unless a clustered index already exists.

CREATE TABLE countries_1(
  COUNTRY_ID varchar(2) PRIMARY KEY,
  COUNTRY_NAME varchar(40) DEFAULT NULL,
  REGION_ID decimal(10,0) DEFAULT NULL
)

--Drop Indexes
DROP INDEX countries_1.PK__countrie__31027163892E8F07 --NOT DELETED BECAUSE It is being used for PRIMARY KEY constraint enforcement FOR THAT USE OBJECT Explorer

CREATE CLUSTERED INDEX IX_COUNTRYID
ON COUNTRIES_1 (COUNTRY_ID ASC)

--Drop Indexes
DROP INDEX COUNTRIES_1.IX_COUNTRYID
-------------UNIQUE Clustered Indexes-------------------------

CREATE UNIQUE CLUSTERED INDEX IX_CountryNameId
ON countries_1 (COUNTRY_ID,COUNTRY_NAME)

INSERT INTO countries_1 VALUES ('BE','Belgium',1)
INSERT INTO countries_1 VALUES ('BE','Germany',1)
INSERT INTO countries_1 VALUES ('BE','Belgium',1)--ERROR Because The duplicate key value is (BE, Belgium).

--Drop Indexes
DROP INDEX countries_1.IX_CountryNameId

--DROP TABLE
DROP TABLE countries_1

------------------------------NonClustered Indexes---------------------------------------
--For example, when you create a table with a UNIQUE constraint, Database Engine automatically creates a nonclustered index. 
CREATE TABLE countries_2(
  COUNTRY_ID varchar(2) UNIQUE,
  COUNTRY_NAME varchar(40) DEFAULT NULL,
  REGION_ID decimal(10,0) DEFAULT NULL
)

--DROP TABLE
DROP TABLE countries_2

--CREATE NonClustered Indexes

CREATE INDEX IX_EmployeeSalary
ON Employees (Salary ASC)

SELECT  * FROM Employees WHERE Salary > 3000 AND Salary <10000

--Drop Indexes
DROP INDEX Employees.IX_EmployeeSalary

SELECT  * FROM Employees WHERE Salary > 3000 AND Salary <10000

CREATE NONCLUSTERED INDEX IX_EmployeeNameSalary
ON Employees (Salary ASC,FirstName ASC)

--CHECK Indexes
sp_helpindex Employees

-------------UNIQUE NonClustered Indexes-------------------------
CREATE UNIQUE NONCLUSTERED INDEX IX_EmployeePhoneNumber
ON Employees (PhoneNumber ASC)