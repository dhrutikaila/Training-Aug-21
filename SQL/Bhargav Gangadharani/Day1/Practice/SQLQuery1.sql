Create table Countries
(
CountryId int NOT NULL,
CountryName Char(20) NOT NULL CHECK (CountryName IN ( 'Italy' , 'India' , 'China')), 
RegionId varchar(8) NOT NULL,
CONSTRAINT combination UNIQUE(CountryId , RegionId ),
)
