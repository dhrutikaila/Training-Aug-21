USE PracticeExercise


-- Grouping and Grouping_ID 

--Grouping : Grouping is function that indicates that the column from GROUP BY is aggregated or not.
--			Grouping function takes one column as argument , column should be from GROUP BY list.

CREATE TABLE Location_Sale 
(
Continent varchar(50) NULL , 
Country varchar(50) NULL ,
City varchar(50) NULL ,
SaleAmount int NULL,
);


INSERT into Location_Sale 
Values
('Asia','India','Ahmedabad',2000),
('Asia','India','Mumbai',3000),
('Europe','England','Oxford',2500),
('Europe','England','London',5000),
('Europe','Italy','',1500),
('Europe','Italy','ROMA',1500),
('Asia','Russia','MOSCCO',1400),
('Asia','Russia','Bashkortostan,',500);


DELETE Location_Sale


SELECT  Continent , Country , City , SUM(SaleAmount) FROM Location_Sale GROUP BY ROLLUP (Continent , Country , City)


SELECT City , SUM(SaleAmount) as 'TotalSale', GROUPING(City) as 'Grouping_city' FROM Location_Sale GROUP BY ROLLUP (City)


-- Grouping 
SELECT 
Continent , Country , City ,SUM(SaleAmount) as 'TotalSale', GROUPING(Country) as 'Grouping_continent',GROUPING(Country) as 'Grouping_country',GROUPING(City) as 'Grouping_city' FROM Location_Sale GROUP BY ROLLUP(Continent ,Country,City)



SELECT 
CASE WHEN GROUPING(Continent) = 1 THEN 'ALL' ELSE ISNULL(Continent,'Unknown') END AS G_continent,
CASE WHEN GROUPING(Country) = 1 THEN 'ALL' ELSE ISNULL(Continent,'Unknown') END AS G_country,
CASE WHEN GROUPING(City) = 1 THEN 'ALL' ELSE ISNULL(Continent,'Unknown') END AS G_city
,SUM(SaleAmount) as 'TotalSale', GROUPING(Country) as 'Grouping_continent',GROUPING(Country) as 'Grouping_country',GROUPING(City) as 'Grouping_city' FROM Location_Sale GROUP BY ROLLUP(Continent ,Country,City)



-- Grouping_ID : simillar to grouping in grouping_ID we can pass all column of GROUP BY Clause we want for grouping , as parameter to  like GOUPRING_ID([,columns])


SELECT GROUPING_ID(Continent , Country ,City) As  'Grouping_id_ccc' , Continent , Country ,City FROM Location_Sale GROUP BY ROLLUP(Continent , Country ,City) 
