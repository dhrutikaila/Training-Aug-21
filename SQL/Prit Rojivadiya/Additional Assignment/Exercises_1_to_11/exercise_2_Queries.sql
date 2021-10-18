/*
1. Write a SQL statement to insert a record with your own value into the table countries against each columns and region_id.
*/

INSERT INTO countries(Country_name,Region_id) VALUES('India',111)
INSERT INTO countries(Country_name,Region_id) VALUES('Italy',222)
INSERT INTO countries(Country_name,Region_id) VALUES('Chine',333)



/*
2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
*/

INSERT INTO countries(Country_name,Region_id) VALUES('Italy',444)



/*
3.Write a SQL statement to insert 3 rows by a single insert statement.
*/

INSERT INTO countries VALUES ('India',555),('Italy',666),('Chine',777)



/*
4. Write a SQL statement insert rows from country_new table to countries table.
*/

SELECT * INTO country_new FROM countries



/*
5. Here is the rows to insert for country_new table. Assume that, the countries table is empty.
*/

INSERT INTO country_new VALUES ('India',1001),('USA',1007),('UK',1003)



/*
6.Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
*/

INSERT INTO jobs VALUES ('NodeJS',20000,30000)



/*
7. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id 
combination will be entered once in the table.
*/

INSERT INTO countries VALUES ('India',111)



/*
8. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
*/

INSERT INTO countries VALUES ('Italy',888)



/*
9. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data 
and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.
*/

INSERT INTO countries VALUES ('Chine',999)



/*
10. Write a SQL statement to insert rows in the job_history table in which one column job_id
is containing those values which are exists in job_id column of jobs table
*/

INSERT INTO Departments VALUES ('.net',1,11)
INSERT INTO Employees VALUES ('Prit','Rojivadiya','prit@gmail.com',9925973399,'2021-08-03',1,30000,0.2,1,1)
INSERT INTO JobHistory VALUES (1,'2021-08-03','2021-09-03',1,1)



/*
11. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id 
contains a unique value and that combined values must have exists into the table departments.
*/

INSERT INTO Employees VALUES ('Man','Rojivadiya','man@gmail.com',9925974499,'2021-08-16',1,25000,0.15,1,1)



/*
12. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id 
contains the values which must have exists into the table departments and jobs.
*/

INSERT INTO Jobs VALUES ('ReactJs',20000,30000)
INSERT INTO Employees VALUES ('Tirth','Patel','tirth@gmail.com',9925974599,'2021-08-10',2,27000,0.25,1,1)


