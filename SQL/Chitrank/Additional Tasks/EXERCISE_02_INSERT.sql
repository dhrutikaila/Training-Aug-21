/*
1.Write a SQL statement to insert a record with your own value into the table countries against each 
columns.and region_id.
*/
INSERT INTO countries VALUES('C1','India',1001);

/*
2.Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
*/
INSERT INTO countries (CountryID,CountryName) VALUES('C2','India2');

/*
3.Write a SQL statement to insert 3 rows by a single insert statement.
*/
INSERT INTO countries 
VALUES
('C2','India2'),
('C3','England'),
('C4','Australia')


/*
4.Write a SQL statement insert rows from country_new table to countries table.
*/
INSERT INTO Countries 
SELECT * FROM Country_New

/*
5.Here is the rows to insert for country_new table. Assume that, the countries table is empty.

+------------+--------------+-----------+
| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
+------------+--------------+-----------+
| C0001      | India        |      1001 |
| C0002      | USA          |      1007 |
| C0003      | UK           |      1003 |
+------------+--------------+-----------+

*/
INSERT INTO Countries
SELECT * FROM country_new;

/*
6.Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be 
entered in the job_id column.
*/
ALTER TABLE Jobs
ALTER COLUMN JobID UNIQUE
INSERT INTO jobs VALUES(1001,'OFFICER',8000);

/*
7.Write a SQL statement to insert a record into the table countries to ensure that, a country_id and 
region_id combination will be entered once in the table.
*/
ALTER TABLE Countries
ADD CONSTRAINT composit_check PRIMARY KEY(CountryID,RegionID)
INSERT INTO countries VALUES(501,'Italy',101);

/*
8.Write a SQL statement to insert rows into the table countries in which the value of country_id 
column will be unique and auto incremented.
*/
ALTER TABLE Countries
ALTER COLUMN CountryID UNIQUE IDENTITY(1,1)
INSERT INTO countries(COUNTRY_NAME,REGION_ID) VALUES('New Zealand',102);

/*
9.Write a SQL statement to insert records into the table countries to ensure that the country_id 
column will not contain any duplicate data and this will be automatically incremented and the 
column country_name will be filled up by 'N/A' if no value assigned for that column.
*/
ALTER TABLE Countries
ALTER COLUMN CountryID UNIQUE IDENTITY(1,1),
ALTER COLUMN CountryName DEFAULT 'N/A'


/*
10.Write a SQL statement to insert rows in the job_history table in which one column job_id is containing 
those values which are exists in job_id column of jobs table.
*/
INSERT INTO job_history VALUES(501,1001,60);

/*
11.Write a SQL statement to insert rows into the table employees in which a set of columns 
department_id and manager_id contains a unique value and that combined values must have exists into 
the table departments.
*/
INSERT INTO employees VALUES(510,'Alex','Hanes','CLERK',18000,201,60);
INSERT INTO employees VALUES(511,'Kim','Leon','CLERK',18000,211,80);


/*
12.Write a SQL statement to insert rows into the table employees in which a set of columns department_id and 
job_id contains the values which must have exists into the table departments and jobs.
*/
INSERT INTO employees VALUES(510,'Alex','Hanes',60,1001,18000);








