CREATE DATABASE practicedb

USE practicedb

CREATE TABLE countries (
CountryId varchar(5) NOT NULL,
RegionId INT NOT NULL ,
PRIMARY KEY(CountryId,RegionId)
CountryName varchar(10) NOT NULL CONSTRAINT rest_cname CHECK (CountryName IN ('Chaina','India','Italy') ),
)

INSERT INTO countries (CountryId,CountryName,RegionId) 
VALUES ('ILY','Italy',3),
('IND','India',4)
('CH', 'China', 61)
('IND','India',13)
('IND','India',21)


SELECT * FROM countries
