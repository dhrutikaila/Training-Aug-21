CREATE TABLE countries
(
	CountryId varchar(5) PRIMARY KEY NOT NULL, 
	CountryName varchar(7) NOT NULL CONSTRAINT ckCountryName 
	CHECK(CountryName IN ('India','China','Italy')),
	RegionId varchar(10) CONSTRAINT uqregion UNIQUE (CountryId,RegionId)
)