USE [Day5 (SSMS)]

CREATE TABLE countries(
CountryId int not null UNIQUE,
CountryName varchar(10) not null,
 RegionId int not null UNIQUE ,
 CONSTRAINT counrtnameis CHECK (CountryName IN('India','Italy','China')),
 CONSTRAINT CidRid CHECK (RegionId != CountryId )
);

INSERT into countries VALUES(1,'India',2);

SELECT * FROM countries

INSERT into countries VALUES(2,'Italy',1);

SELECT * FROM countries

INSERT into countries VALUES(3,'India',4);

SELECT * FROM countries