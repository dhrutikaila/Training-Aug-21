--Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId 
--and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.

USE Assignments

CREATE TABLE Countries
(
Country_Id INT PRIMARY KEY IDENTITY(1,1),
Country_Name VARCHAR(20) NOT NULL CONSTRAINT Chk_Country CHECK(Country_Name IN('Italy','India','China')),
Region_Id INT NOT NULL,
CONSTRAINT Unique_Columns UNIQUE(Country_Id,Region_Id )
)

INSERT INTO Countries VALUES('Italy',1),
                            ('India',2),
							('China',3)

SELECT * FROM Countries 
