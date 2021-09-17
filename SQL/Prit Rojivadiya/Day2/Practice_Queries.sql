use db2;

-- query to get countryId and regionId from countries table
SELECT CountryId,RegionId FROM dbo.Countries;

-- query for alias name
SELECT CountryId as CId,RegionId as RId FROM dbo.Countries;
SELECT CountryId 'CId',RegionId 'RId' FROM dbo.Countries;
SELECT 'Cid' = CountryId,'Rid' = RegionId FROM dbo.Countries;

-- query for concat
SELECT CountryId, 'CountryName: '+CountryName AS Country FROM dbo.Countries;

-- query mathematical operation
SELECT RegionId , NewId = 1 + RegionId, CountryName FROM dbo.Countries;

-- select query with where condition
SELECT * FROM Countries WHERE RegionId = 4;
SELECT * FROM Countries WHERE RegionId < 4;
SELECT * FROM Countries WHERE RegionId BETWEEN 2 AND 4;
SELECT * FROM Countries WHERE RegionId IN (1,2);
SELECT * FROM Countries WHERE CountryName LIKE 'In%';
SELECT * FROM Countries WHERE CountryName is not null;
SELECT * FROM Countries ORDER BY CountryName ASC;

-- query to fetch top 10 rows
SELECT TOP 10 * FROM Countries;

-- query with like operator
SELECT DISTINCT RegionId,CountryName FROM Countries WHERE CountryName LIKE 'I%';

-- query to select unique data
SELECT DISTINCT RegionId FROM Countries;

-- aggregate function
SELECT COUNT(DISTINCT RegionId) as total FROM Countries;

-- query with union keywork
SELECT * FROM Countries WHERE RegionId = 4 UNION SELECT * FROM Countries WHERE CountryName LIKE 'A%';

-- query to insert data from one table to another
SELECT * INTO cnt FROM (SELECT * FROM dbo.Countries) cnt1;
SELECT * FROM cnt;

-- alter query to add column
ALTER TABLE dbo.cnt ADD Extra varchar(20);

-- update query 
UPDATE dbo.cnt SET Extra = 'Practice';

-- query to concat the string
SELECT Extra + ' add' as cIdAdd, 'nc'='NewColumn' FROM cnt;

-- query with like operator and changing data of one column by addding integer value
SELECT CountryName,CountryId,RegionId, NewId = RegionId + 1 FROM Countries WHERE CountryName LIKE 'I%';