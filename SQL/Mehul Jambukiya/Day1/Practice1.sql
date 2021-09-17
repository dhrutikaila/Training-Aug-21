CREATE DATABASE NewOne

USE NewOne

CREATE TABLE Countries
(
 CountryId tinyint,
 CountryName varchar(5) CONSTRAINT	ChkCountriesCountryName CHECK ( CountryName IN ('India','Italy','China')),
 RegionId tinyint,
 CONSTRAINT PkCountryIdRegionId PRIMARY KEY(CountryId,RegionId)
)

ALTER TABLE Countries ALTER COLUMN CountryName varchar(5) NOT NULL;

INSERT INTO Countries VALUES (1,'India',1);
INSERT INTO Countries VALUES (2,'Italy',4);
INSERT INTO Countries VALUES (3,'China',2);
INSERT INTO Countries VALUES (4,'Australia',6);

ALTER TABLE Countries ALTER COLUMN CountryName varchar(15) NOT NULL;

INSERT INTO Countries VALUES (4,'Australia',6);

SELECT * FROM Countries