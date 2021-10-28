/*Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table.
 and combination of columns CountryId and RegionId will be unique.*/
CREATE TABLE Countrie
(
 CountryId INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
 CountryName VARCHAR(50) NOT NULL CHECK(CountryName IN('Italy','India','China')), 
 RegionId  INT  CONSTRAINT CK_RegionId UNIQUE(RegionId),
)

INSERT INTO Countrie(CountryName,RegionId) VALUES('Italy',4),('India',3)

SELECT * FROM  Countrie