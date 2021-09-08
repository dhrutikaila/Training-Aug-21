-- Practice Exercise:
--  (1)  Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. 
--       and combination of columns CountryId and RegionId will be unique.


-- Create Database 

CREATE DATABASE TraineeAug
USE TraineeAug

--Create Table 

CREATE TABLE countries
(
	CountryId INT not null,
	CountryName VARCHAR(20) not null CONSTRAINT chkCountryName CHECK(CountryName IN ('India','Italy','China')),
	RegionId VARCHAR(10) not null CONSTRAINT compCountryIdRegionId UNIQUE(CountryId,RegionId)
)

--Insert Queary
INSERT INTO countries VALUES(1,'INDIA','12')
INSERT INTO countries VALUES(2,'CHINA','21')
INSERT INTO countries VALUES(3,'ITALY','31')

--Select table
SELECT * FROM countries

--Delete Table
DROP TABLE countries