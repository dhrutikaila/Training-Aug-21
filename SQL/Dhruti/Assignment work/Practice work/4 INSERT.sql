use test1

--1 Write a SQL statement to rename the table countries to country_new using sp(store procedure).
 ALTER TABLE Countri
 DROP  CountrY_NEW


--1 Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.
INSERT INTO Countri VALUES('1','India',1001);

--2 Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
insert into Countri values ('1','italy','');

--3 Write a SQL statement insert rows from country_new table to countries table.

   INSERT INTO  Countries
   SELECT * FROM Countries

--4 Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
   INSERT INTO Job VALUES(1001,'OFFICER',8000);

--9. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.
   INSERT INTO countries VALUES(501,'Italy',185);

--11 Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.
   INSERT INTO coun VALUES(501,'India',102);

--12 Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.
   INSERT INTO jobhistor VALUES(501,1001,60);

--13 write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.
   INSERT INTO employe VALUES(510,'Alex','Hanes',60,1001,18000);

--14 Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.
