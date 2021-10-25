USE Exercise1

--1. Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.

INSERT INTO Countries
VALUES ('Inida', 4)
	, ('Canada', 1)
	, ('England', 3)
	, ('US', 2)

--2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.

INSERT INTO Countries
VALUES ('India', 2)

--3.Write a SQL statement to insert 3 rows by a single insert statement.

INSERT INTO Countries
VALUES ('Inida', 4)
	, ('China', 1)
	, ('England', 3)

--4. Write a SQL statement insert rows from country_new table to countries table.

SELECT * 
INTO CountryNew
FROM Countries
WHERE 0=1

INSERT INTO CountryNew (CountryName, RegionID)
SELECT CountryName, RegionID FROM Countries  

--5. Here is the rows to insert for country_new table. Assume that, the countries table is empty.

IINSERT INTO Countries
SELECT * FROM country_new;

--6.Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.

INSERT INTO jobs VALUES('OFFICER',20000,25000);

--7. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.

INSERT INTO Countries
VALUES ('Inida', 4),
	('USA', 1),
	('UK', 3)


--8. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.

ALTER TABLE Countries
ALTER COLUMN CountryID UNIQUE IDENTITY(1,1)
INSERT INTO countries VALUES('Canada',103);

--9. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.

ALTER TABLE Countries
ALTER COLUMN CountryID UNIQUE IDENTITY(1,1),
ALTER COLUMN CountryName DEFAULT 'N/A'


--10. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.


INSERT INTO jobhistory VALUES(507,'2021-01-07','01/07/2021',2001,80);

--11. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.

INSERT INTO employees VALUES(510,'Manav','Patel','manav@gmail.com','7365','2021-01-07','1001',20000.2,.22,101,201);




--12. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.


INSERT INTO employees1 VALUES(510,'Alex','Hanes','alex@gmail.com','4545676788','2021-01-07',1001,2000.22,.22,101,201);