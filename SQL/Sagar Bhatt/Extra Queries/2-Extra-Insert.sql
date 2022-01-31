USE DB_ExtraQueries

--1. Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.

INSERT INTO Region
VALUES ('North')
	, ('South')
	, ('East')
	, ('West')

INSERT INTO Countries
VALUES ('Inida', 4)
	, ('China', 1)
	, ('Japan', 3)
	, ('US', 2)

--2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.

INSERT INTO Countries
VALUES ('UK', 2)

--3.Write a SQL statement to insert 3 rows by a single insert statement.

INSERT INTO Countries
VALUES ('Inida', 4)
	, ('China', 1)
	, ('Japan', 3)

--4. Write a SQL statement insert rows from country_new table to countries table.

SELECT * 
INTO CountryNew
FROM Countries
WHERE 0=1

INSERT INTO CountryNew (CountryName, RegionID)
SELECT CountryName, RegionID FROM Countries  

--5. Here is the rows to insert for country_new table. Assume that, the countries table is empty.

INSERT INTO Countries
VALUES ('Inida', 4)
	, ('USA', 1)
	, ('UK', 3)

--6.Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.

INSERT INTO Jobs
VALUES ('job-1',4000,15000)

--9. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.

INSERT INTO Countries
VALUES ('Inida', 4)
	, ('USA', 1)
	, ('UK', 3)
-- this will generate error

--10. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.

INSERT INTO Countries
VAlUES ('Pakistan', 4)

--11. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.

INSERT INTO Countries
VALUES ('CANADA', 3)

--12. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.

SELECT * FROM Jobs

INSERT INTO JobHistory
VALUES (1,'2021-08-17','2011-08-20',1,1)

--13. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.

INSERT INTO Departments
VALUES ('Human Resorces', 1,1)

INSERT INTO Employees
VALUES ('Sagar', 'Bhatt', 'Sagar.Bhatt01@gmail.com', 7600608432, '2021-08-02', 1, 5000 , 3000, 1, 1)

--14. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.

INSERT INTO Departments
VALUES ('Human Resorces', 1,1)

INSERT INTO Employees
VALUES ('Sagar', 'Bhatt', 'Sagar.Bhatt01@gmail.com', 7600608432, '2021-08-02', 1, 5000 , 3000, 1, 1)
