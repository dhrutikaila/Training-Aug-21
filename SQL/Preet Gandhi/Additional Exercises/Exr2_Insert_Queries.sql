USE Additional_Practice

--Exr.2 - INSERT Queries--

--1)Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.
INSERT INTO Countries_Constraint VALUES
	(1,'India',5),
	(2,'Canada',10)
SELECT * FROM Countries_Constraint

--2)Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
INSERT INTO Countries_Constraint (Country_Id,Country_Name) 
VALUES (3,'USA')
SELECT * FROM Countries_Constraint

--3)Write a SQL statement to insert 3 rows by a single insert statement.
INSERT INTO Countries_Constraint VALUES
(4,'Russia',12),
(5,'China',14),
(6,'UAE',16)
SELECT * FROM Countries_Constraint

--4)Write a SQL statement insert rows from country_new table to countries table.
SELECT * INTO Countries FROM (SELECT * FROM CountryNew) Ctr

--5)Here is the rows to insert for country_new table. Assume that, the countries table is empty.
+------------+--------------+-----------+
| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
+------------+--------------+-----------+
| C0001 | India | 1001 |
| C0002 | USA | 1007 |
| C0003 | UK | 1003 |
+------------+--------------+-----------+

INSERT INTO Countries_Constraint VALUES
(0001,'India',1001),
(0002,'USA',1007),
(0003,'UK',1003)
SELECT * FROM Countries_Constraint

--6)Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
INSERT INTO Jobs VALUES
	(1,'Software Engineer',22000,25000),
	(1,'Testing',15000,20000)

--9)Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.
INSERT INTO Countries_3 VALUES
(1,'India',10),
(2,'USA',10)

--10)Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
INSERT INTO Countries VALUES
('India',1),
('USA',2)
SELECT * FROM Countries

--11)Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column
CREATE TABLE Countries_Constraint2
(
	Country_Id INT NULL,
	Country_Name VARCHAR(20) DEFAULT 'N/A',
	Region_Id SMALLINT NULL
)
INSERT INTO Countries_constraint2(Country_Id,Region_Id) 
VALUES (10,23)
SELECT * FROM Countries_Constraint2

--12)Write a SQL statement to insert rows in the job_history table in which one column job_id

is containing those values which are exists in job_id column of jobs table.
INSERT INTO Jobs VALUES
	(1,'Software Engineer',22000,25000),
	(2,'Testing',15000,20000)

INSERT INTO Job_History VALUES 
(1,'2021/02/04','06/04/2022',1,3)

--13)Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.
INSERT INTO Employees VALUES
(1,'Jeet','Patel','jeet@gmail.com',7837383475,'2021/05/06',22000,2200,1,1)

--14)Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.
INSERT INTO Employees VALUES
(2,'Hitesh','shah','hitesh@gmail.com',7837338567,'2020/07/08',20000,2300,2,2)