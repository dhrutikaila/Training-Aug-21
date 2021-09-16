--1. Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.
INSERT INTO Countries VALUES('Italy',1),
                            ('India',2),
							('China',3)

--2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
INSERT INTO Countries(Country_Id,Country_Name) VALUES(4,'Italy')

--3.Write a SQL statement to insert 3 rows by a single insert statement.
INSERT INTO Countries VALUES('Italy',1),
                            ('India',2),
							('China',3)

--4. Write a SQL statement insert rows from country_new table to countries table.
INSERT INTO COUNTRIES SELECT * FROM Country_new

--5. Here is the rows to insert for country_new table. Assume that, the countries table is empty.
--+------------+--------------+-----------+
--| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
--+------------+--------------+-----------+
--| C0001 | India | 1001 |
--| C0002 | USA | 1007 |
--| C0003 | UK | 1003 |
--+------------+--------------+-----------+
INSERT INTO COUNTRIES SELECT * FROM Country_new

--6.Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
ALTER TABLE jobs
ALTER COLUMN Job_Id UNIQUE
INSERT INTO jobs VALUES('Trainee',6000,8000)

--9. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.
ALTER TABLE Countries
ADD CONSTRAINT Unique_Columns UNIQUE(Country_Id,Region_Id )


INSERT INTO Countries VALUES('Italy',1),
                            ('India',2),
							('China',3)

--10. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
ALTER TABLE Countries
ALTER COLUMN Country_Id UNIQUE IDENTITY(1,1)


INSERT INTO Countries VALUES('Italy',1),
                            ('India',2),
							('China',3)

--11. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.
ALTER TABLE Countries
ALTER COLUMN Country_Id UNIQUE IDENTITY(1,1)
ADD CONSTRAINT Default_Name DEFAULT 'N/A' FOR Country_Name

INSERT INTO Countries VALUES('Italy',1),
                            ('India',2),
							('China',3)

--12. Write a SQL statement to insert rows in the job_history table in which one column job_id
--is containing those values which are exists in job_id column of jobs table.
INSERT INTO JobHistory VALUES('2020/02/02','02/08/2021',1,2)

--13. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.

INSERT INTO Employees VALUES('James','Cole','james44@gmail.com','9988776655','2010/09/09',1,20000,0.20,1,2),
                            ('Jane','Cole','jane44@gmail.com','9978776655','2010/09/09',2,20000,0.20,2,1)

--14. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.

INSERT INTO Employees VALUES('James','Cole','james44@gmail.com','9988776655','2010/09/09',1,20000,0.20,1,2),
                            ('Jane','Cole','jane44@gmail.com','9978776655','2010/09/09',2,20000,0.20,2,1)