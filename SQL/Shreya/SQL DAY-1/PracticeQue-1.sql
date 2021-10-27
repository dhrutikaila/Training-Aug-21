CREATE TABLE countries (
CountryId int NOT NULL,
CountryName varchar(10) NOT NULL CONSTRAINT Restrict_countryname CHECK(CountryName IN ('India','Italy','Chaina') ),
RegionId INT NOT NULL ,
PRIMARY KEY(CountryId,RegionId)
 )

SELECT * FROM countries

INSERT INTO countries (CountryId,CountryName,RegionId) VALUES (6,'Italy',3),(7,'India',4)