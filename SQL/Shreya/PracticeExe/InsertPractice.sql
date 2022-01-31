/*Write a SQL statement to insert a record with your own value into the table countries 
against each columns.and region_id.*/

INSERT INTO countries (Country_Name,Region_Id) VALUES ('India',1)

/*Write a SQL statement to insert one row into the table countries against the column 
country_id and country_name.*/
INSERT INTO countries (Country_Name) VALUES ('US')

/*Write a SQL statement to insert 3 rows by a single insert statement.*/

INSERT INTO countries (Country_Name,Region_Id) VALUES ('India',1),('UK',2),('ITALI',3)


/*Write a SQL statement insert rows from country_new table to countries table.*/
SELECT * INTO  country_new FROM countries

/*Here is the rows to insert for country_new table. Assume that, the countries table is empty.

+------------+--------------+-----------+
| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
+------------+--------------+-----------+
| C0001      | India        |      1001 |
| C0002      | USA          |      1007 |
| C0003      | UK           |      1003 |
+------------+--------------+-----------+*/

/*Write a SQL statement to insert one row in jobs table to ensure that no duplicate value 
will be entered in the job_id column.*/

INSERT INTO Jobs (Job_Title,Min_Salary , Max_Salary) VALUES ('developer',8000,20000),('QA',7000,8000)
SELECT * FROM JOBS
/*Write a SQL statement to insert a record into the table countries to ensure that, 
a country_id and region_id combination will be entered once in the table.*/
INSERT INTO country (CountryId,CountryName,RegionId) VALUES (1,'India',2)


/*Write a SQL statement to insert rows into the table countries in which the value of 
country_id column will be unique and auto incremented.*/
SELECT * FROM countries
INSERT INTO countries VALUES ('US',101)

/*Write a SQL statement to insert records into the table countries to ensure that the 
country_id column will not contain any duplicate data and this will be automatically
incremented and the column country_name will be filled up by 'N/A' if no value assigned
for that column.*/
ALTER TABLE countries ADD CONSTRAINT df_city DEFAULT 'N/A' FOR Country_Name

INSERT INTO countries (Region_Id) VALUES (102)

SELECT * FROM countries

/*Write a SQL statement to insert rows in the job_history table in which one column job_id
is containing those values which are exists in job_id column of jobs table.*/
SELECT * FROM jobS
SELECT * FROM Job_History
SELECT * FROM Department

INSERT INTO Job_History VALUES ('12-09-2000','12/08/2021',2,2)


/*Write a SQL statement to insert rows into the table employees in which a set of
columns department_id and manager_id contains a unique value and that combined 
values must have exists into the table departments.*/

INSERT INTO Employees 
VALUES ('SHREYA','THAKKAR','shreya@gmail.com','9870087829','08-08-2021',1,20009,10,2,1)

/*Write a SQL statement to insert rows into the table employees in which a set of columns 
department_id and job_id contains the values which must have exists into the table 
departments and jobs.*/

SELECT * FROM Employees

 

