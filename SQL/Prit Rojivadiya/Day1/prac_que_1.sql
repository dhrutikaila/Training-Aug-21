/* Q1 Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId 
and make sure that no countries except Italy, India and China will be entered in the table. 
and combination of columns CountryId and RegionId will be unique. */

USE db1;

CREATE TABLE countries
(
CountryId int not null PRIMARY KEY IDENTITY(1,1),
CountryName varchar(20) not null CONSTRAINT ckeckCountryName CHECK(CountryName IN ('Italy','India','Chine')),
RegionId varchar(20) not null,
CONSTRAINT unique_region UNIQUE (CountryId,RegionId)
)

INSERT INTO countries (CountryName,RegionId) VALUES ('India','delhi123');