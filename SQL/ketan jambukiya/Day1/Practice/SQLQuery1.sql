USE DEMO

--Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.

CREATE TABLE Countries
(
Country_Id INT PRIMARY KEY,
CountryName CHAR(10) CHECK (Countryname IN ('italy','india','china')),
Region_Id VARCHAR(5) NOT NULL CONSTRAINT combination UNIQUE (Country_Id,Region_Id)

)