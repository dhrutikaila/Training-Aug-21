
CREATE TABLE countries(
	CountryId TINYINT,
	CountryName VARCHAR(20) CONSTRAINT Fix_Country CHECK(CountryName IN('India','Italy','China')),
	RegionId SMALLINT,
	CONSTRAINT Pk_test PRIMARY KEY (CountryId, RegionId)
);

INSERT INTO countries VALUES (1,'India',1);
INSERT INTO countries VALUES (2,'CHINA',2),(3,'TOKYO',3);

SELECT * FROM countries;
